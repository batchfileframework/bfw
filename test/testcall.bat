@echo off


REM findstr /N "^:Mylabel" "testcall.bat"  (matches MylabelTest for instance)
REM findstr /R /N "^:Mylabel[ ]" "testcall.bat"
REM findstr /N "^:Mylabel" "testcall.bat" | findstr /R "^.*:Mylabel[ ]\|^.*:Mylabel$"
REM findstr /N "^:Mylabel" "testcall.bat" | findstr /V "::Mylabel[A-Za-z]"
REM findstr /N "^:Mylabel" "testcall.bat" | findstr /V "::Mylabel[A-Za-z0-9]"
REM findstr /N "^:Mylabel" "testcall.bat" | findstr /V "::Mylabel[a-zA-Z0-9\-]"
REM findstr /N "^:Mylabel" "testcall.bat" | findstr /V "::MyLabel[a-zA-Z0-9\-]"
REM findstr /N "^:Mylabel" "testcall.bat" | findstr /V "::MyLabel[a-zA-Z0-9\-]"
REM findstr /N "^:Mylabel" "testcall.bat" | findstr /V "::Mylabel[a-zA-Z0-9\-]"
REM findstr /N "^:MyLabel" "testcall.bat" | findstr /V "::MyLabel[a-zA-Z0-9\-]"


echo.& echo special character tests, all these work as is
call :MyLabel-a
call :MyLabel-1a
call :MyLabel?parameter
call :MyLabel!variable
call :MyLabel@home
call :MyLabel#section
call :MyLabel$
call :MyLabel$dollarsign
call :MyLabel*star
call :MyLabel)Close
call :MyLabel{Brace
call :MyLabel}EndBrace
call :MyLabel[Bracket
call :MyLabel]EndBracket
call :MyLabel/command
call :MyLabel\backslash
call :MyLabel-argument1-argument2
call :MyLabel_parameter_value

echo.& echo Label with carret needs to be doubled when called
call :MyLabel^caret
call :MyLabel^^caret

echo.& echo =,+ and ( will call :MyLabel
call :MyLabel=Equal
call :MyLabel+Plus
call :MyLabel(Open


echo.& echo Label ending with ampersand, match label before ampersand (maybe no way to call a label with an ampersand)
call :MyLabel&
call :MyLabel^&and
call :MyLabel^^&and
call :MyLabel^^^&and
call :MyLabel&and


echo.& echo when calling percentsign, they need to be quadrupled and it works
call :MyLabel%percent
call :MyLabel%%%%percent


echo.& echo label are case insensitive, will match the first one
call :MyLabel test
call :MyLabel test testtt
call :MYLABEL 
call :mylabel

echo.& echo more test for findstr
call :MyLabel1
call :MyLabela
call :MyLabelA


:main

GoTo :EOF

:MyLabel
echo The first :MyLabel
GoTo :EOF

:MyLabel
echo The second :MyLabel
GoTo :EOF

:mylabel
echo lowercase :mylabel
GoTo :EOF

:MYLABEL
echo uppercase :MYLABEL
GoTo :EOF

:MyLabeL
echo mixed case :MyLabeL
GoTo :EOF

:MyLabel test
echo :MyLabel test
GoTo :EOF

:MyLabel test testtt
echo :MyLabel test testtt
GoTo :EOF



:MyLabel1
echo :MyLabel1
GoTo :EOF

:MyLabela
echo :MyLabela
GoTo :EOF

:MyLabelA
echo :MyLabelA
GoTo :EOF

:MyLabel-a
echo :MyLabel-a
GoTo :EOF

:MyLabel-1a
echo :MyLabel-1a
GoTo :EOF

:MyLabel?parameter
echo :MyLabel?parameter
GoTo :EOF

:MyLabel!variable
echo :MyLabel!variable
GoTo :EOF

:MyLabel@home
echo :MyLabel@home
GoTo :EOF

:MyLabel#section
echo :MyLabel#section
GoTo :EOF

:MyLabel$
echo :MyLabel$
GoTo :EOF

:MyLabel$dollarsign
echo :MyLabel$dollarsign
GoTo :EOF

:MyLabel%percent
echo :MyLabel%%percent
GoTo :EOF

:MyLabel^caret
echo :MyLabel^caret
GoTo :EOF

:MyLabel^^caret
echo :MyLabel^^caret
GoTo :EOF

:MyLabel&and
echo :MyLabel&and
GoTo :EOF

:MyLabel*star
echo :MyLabel*star
GoTo :EOF

:MyLabel(Open
echo :MyLabel(Open
GoTo :EOF

:MyLabel)Close
echo :MyLabel)Close
GoTo :EOF

:MyLabel+Plus
echo :MyLabel+Plus
GoTo :EOF

:MyLabel=Equal
echo :MyLabel=Equal
GoTo :EOF

:MyLabel{Brace
echo :MyLabel{Brace
GoTo :EOF

:MyLabel}EndBrace
echo :MyLabel}EndBrace
GoTo :EOF

:MyLabel[Bracket
echo :MyLabel[Bracket
GoTo :EOF

:MyLabel]EndBracket
echo :MyLabel]EndBracket
GoTo :EOF

REM :MyLabel (followed by a single space)
REM echo :MyLabel (followed by a single space)
REM GoTo :EOF

:MyLabel 
echo :MyLabel (this label had a space)
GoTo :EOF

REM :MyLabel          (multiple spaces)
REM echo :MyLabel1 (this label had multiple spaces)
REM GoTo :EOF

:MyLabel          
echo :MyLabel1 (this label had multiple spaces)
GoTo :EOF

REM :MyLabel	(tab after the label)
REM echo :MyLabel1
REM GoTo :EOF

:MyLabel	
echo :MyLabel1 (tab after the label)
GoTo :EOF

:MyLabel				
echo :MyLabel1 (multiple tab after the label)
GoTo :EOF

:MyLabel test (lowercase)
echo :MyLabel1
GoTo :EOF

:MyLabel TEST (uppercase)
echo :MyLabel1
GoTo :EOF

:MyLabel:MoreLabels
echo :MyLabel1
GoTo :EOF

:MyLabel:MyLabel
echo :MyLabel1
GoTo :EOF

:MyLabel :MoreLabels
echo :MyLabel1
GoTo :EOF

:MyLabel :MyLabel
echo :MyLabel1
GoTo :EOF

REM End of Line Scenarios:
echo :MyLabel1
GoTo :EOF

REM :MyLabel (with nothing following it, at the end of a line)
echo :MyLabel1
GoTo :EOF

REM Embedded in Text or Comments:
REM This is a comment :MyLabel should not match
echo REM This is a comment :MyLabel should not match
GoTo :EOF

ECHO :MyLabel is a part of this line
echo ECHO :MyLabel is a part of this line
GoTo :EOF

Complex Combinations:
:MyLabel-argument1-argument2
echo :MyLabel-argument1-argument2
GoTo :EOF

:MyLabel_parameter_value
echo :MyLabel_parameter_value
GoTo :EOF

:MyLabel/command
echo :MyLabel/command
GoTo :EOF

:MyLabel\backslash
echo :MyLabel\backslash
GoTo :EOF

:MYLABEL
echo :MYLABEL
GoTo :EOF

:mylabel
echo :mylabel
GoTo :EOF


The output of this script

special character tests, all these work as is
:MyLabel-a
:MyLabel-1a
:MyLabel?parameter
:MyLabel!variable
:MyLabel@home
:MyLabel#section
:MyLabel$
:MyLabel$dollarsign
:MyLabel*star
:MyLabel)Close
:MyLabel{Brace
:MyLabel}EndBrace
:MyLabel[Bracket
:MyLabel]EndBracket
:MyLabel/command
:MyLabel\backslash
:MyLabel-argument1-argument2
:MyLabel_parameter_value

Label with carret needs to be doubled when called
:MyLabelcaret
:MyLabel^caret

=,+ and ( will call :MyLabel
The first :MyLabel
The first :MyLabel
The first :MyLabel

Label ending with ampersand, match label before ampersand (maybe no way to call a label with an ampersand)
The first :MyLabel
The system cannot find the batch label specified - MyLabel^
'and' is not recognized as an internal or external command,
operable program or batch file.
The first :MyLabel
'and' is not recognized as an internal or external command,
operable program or batch file.

when calling percentsign, they need to be quadrupled and it works
The system cannot find the batch label specified - MyLabelpercent
:MyLabel%percent

label are case insensitive, will match the first one
The first :MyLabel
The first :MyLabel
The first :MyLabel
The first :MyLabel

more test for findstr
:MyLabel1
:MyLabela
:MyLabela


The output of 

findstr /N "^:mYlabel" "testcall.bat" | findstr /V "::MyLabel[a-zA-Z0-9\-]"
(no output)

findstr /N "^:mylabel" "testcall.bat" | findstr /V "::MYLABEL[a-zA-Z0-9\-]"
83::mylabel
291::mylabel

findstr /N "^:MYLABEL" "testcall.bat" | findstr /V "::MYLABEL[a-zA-Z0-9\-]"
87::MYLABEL
287::MYLABEL

findstr /N "^:mylabel" "testcall.bat" | findstr /V "::MyLabel[a-zA-Z0-9\-]"
83::mylabel
291::mylabel

findstr /N "^:MyLabel" "testcall.bat" | findstr /V "::MyLabel[a-zA-Z0-9\-]"
75::MyLabel
79::MyLabel
95::MyLabel test
99::MyLabel test testtt
125::MyLabel?parameter
129::MyLabel!variable
133::MyLabel@home
137::MyLabel#section
141::MyLabel$
145::MyLabel$dollarsign
149::MyLabel%percent
153::MyLabel^caret
157::MyLabel^^caret
161::MyLabel&and
165::MyLabel*star
169::MyLabel(Open
173::MyLabel)Close
177::MyLabel+Plus
181::MyLabel=Equal
185::MyLabel{Brace
189::MyLabel}EndBrace
193::MyLabel[Bracket
197::MyLabel]EndBracket
205::MyLabel
213::MyLabel
221::MyLabel
225::MyLabel
229::MyLabel test (lowercase)
233::MyLabel TEST (uppercase)
237::MyLabel:MoreLabels
241::MyLabel:MyLabel
245::MyLabel :MoreLabels
249::MyLabel :MyLabel
275::MyLabel_parameter_value
279::MyLabel/command
283::MyLabel\backslash

findstr /N "^:MyLabel" "testcall.bat" | findstr /V "::MYLABEL[a-zA-Z0-9\-]"
75::MyLabel
79::MyLabel
95::MyLabel test
99::MyLabel test testtt
105::MyLabel1
109::MyLabela
113::MyLabelA
117::MyLabel-a
121::MyLabel-1a
125::MyLabel?parameter
129::MyLabel!variable
133::MyLabel@home
137::MyLabel#section
141::MyLabel$
145::MyLabel$dollarsign
149::MyLabel%percent
153::MyLabel^caret
157::MyLabel^^caret
161::MyLabel&and
165::MyLabel*star
169::MyLabel(Open
173::MyLabel)Close
177::MyLabel+Plus
181::MyLabel=Equal
185::MyLabel{Brace
189::MyLabel}EndBrace
193::MyLabel[Bracket
197::MyLabel]EndBracket
205::MyLabel
213::MyLabel
221::MyLabel
225::MyLabel
229::MyLabel test (lowercase)
233::MyLabel TEST (uppercase)
237::MyLabel:MoreLabels
241::MyLabel:MyLabel
245::MyLabel :MoreLabels
249::MyLabel :MyLabel
271::MyLabel-argument1-argument2
275::MyLabel_parameter_value
279::MyLabel/command
283::MyLabel\backslash

findstr /N "^:MyLabel" "testcall.bat" | findstr /V "::mylabel[a-zA-Z0-9\-]"
75::MyLabel
79::MyLabel
95::MyLabel test
99::MyLabel test testtt
105::MyLabel1
109::MyLabela
113::MyLabelA
117::MyLabel-a
121::MyLabel-1a
125::MyLabel?parameter
129::MyLabel!variable
133::MyLabel@home
137::MyLabel#section
141::MyLabel$
145::MyLabel$dollarsign
149::MyLabel%percent
153::MyLabel^caret
157::MyLabel^^caret
161::MyLabel&and
165::MyLabel*star
169::MyLabel(Open
173::MyLabel)Close
177::MyLabel+Plus
181::MyLabel=Equal
185::MyLabel{Brace
189::MyLabel}EndBrace
193::MyLabel[Bracket
197::MyLabel]EndBracket
205::MyLabel
213::MyLabel
221::MyLabel
225::MyLabel
229::MyLabel test (lowercase)
233::MyLabel TEST (uppercase)
237::MyLabel:MoreLabels
241::MyLabel:MyLabel
245::MyLabel :MoreLabels
249::MyLabel :MyLabel
271::MyLabel-argument1-argument2
275::MyLabel_parameter_value
279::MyLabel/command
283::MyLabel\backslash


findstr /I /N "^:MyLabel" "testcall.bat" | findstr /I /V "::mylabel[a-zA-Z0-9\-]"
75::MyLabel
79::MyLabel
83::mylabel
87::MYLABEL
91::MyLabeL
95::MyLabel test
99::MyLabel test testtt
105::MyLabel1
109::MyLabela
113::MyLabelA
117::MyLabel-a
121::MyLabel-1a
125::MyLabel?parameter
129::MyLabel!variable
133::MyLabel@home
137::MyLabel#section
141::MyLabel$
145::MyLabel$dollarsign
149::MyLabel%percent
153::MyLabel^caret
157::MyLabel^^caret
161::MyLabel&and
165::MyLabel*star
169::MyLabel(Open
173::MyLabel)Close
177::MyLabel+Plus
181::MyLabel=Equal
185::MyLabel{Brace
189::MyLabel}EndBrace
193::MyLabel[Bracket
197::MyLabel]EndBracket
205::MyLabel
213::MyLabel
221::MyLabel
225::MyLabel
229::MyLabel test (lowercase)
233::MyLabel TEST (uppercase)
237::MyLabel:MoreLabels
241::MyLabel:MyLabel
245::MyLabel :MoreLabels
249::MyLabel :MyLabel
271::MyLabel-argument1-argument2
275::MyLabel_parameter_value
279::MyLabel/command
283::MyLabel\backslash
287::MYLABEL
291::mylabel

findstr /I /N "^:MyLabel" "testcall.bat" | findstr /I /V "::mylabel[a-zA-Z0-9\-]"
75::MyLabel
79::MyLabel
83::mylabel
87::MYLABEL
91::MyLabeL
95::MyLabel test
99::MyLabel test testtt
125::MyLabel?parameter
129::MyLabel!variable
133::MyLabel@home
137::MyLabel#section
141::MyLabel$
145::MyLabel$dollarsign
149::MyLabel%percent
153::MyLabel^caret
157::MyLabel^^caret
161::MyLabel&and
165::MyLabel*star
169::MyLabel(Open
173::MyLabel)Close
177::MyLabel+Plus
181::MyLabel=Equal
185::MyLabel{Brace
189::MyLabel}EndBrace
193::MyLabel[Bracket
197::MyLabel]EndBracket
205::MyLabel
213::MyLabel
221::MyLabel
225::MyLabel
229::MyLabel test (lowercase)
233::MyLabel TEST (uppercase)
237::MyLabel:MoreLabels
241::MyLabel:MyLabel
245::MyLabel :MoreLabels
249::MyLabel :MyLabel
275::MyLabel_parameter_value
279::MyLabel/command
283::MyLabel\backslash
287::MYLABEL
291::mylabel