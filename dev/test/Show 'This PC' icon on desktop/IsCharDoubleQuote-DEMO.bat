
:IsCharDoubleQuote-DEMO
set _mydouble="
Call :IsCharDoubleQuote _mydouble && echo it is doublequotes || echo it is not doublequotes
set _mydouble=a
Call :IsCharDoubleQuote _mydouble && echo it is doublequotes || echo it is not doublequotes

goto :eof

