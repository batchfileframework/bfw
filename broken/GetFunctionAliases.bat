
::Usage Call :GetFunctionAliases batchfile functionname returnvariable
::returns number of aliases found
:GetFunctionAliases
from preamble to first exist
take not of all non-excluded labels
those are the aliases
reject aliases from list of functions
GoTo :EOF

