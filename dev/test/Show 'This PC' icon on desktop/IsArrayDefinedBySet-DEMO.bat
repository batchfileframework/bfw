
:IsArrayDefinedBySet-DEMO
set mytestvar=1
set mytestvar[0]=1
set mytestvar[0].test=1
set mytestvar[1]=1

Call :IsArrayDefinedBySet myteFFFFstvar && echo it is defined || echo it is not defined
Call :IsArrayDefinedBySet mytestvar && echo it is defined || echo it is not defined
Call :IsArrayDefinedBySet mytestvar[ && echo it is defined || echo it is not defined
Call :IsArrayDefinedBySet mytestvar[0] && echo it is defined || echo it is not defined
Call :IsArrayDefinedBySet mytestvar[1] && echo it is defined || echo it is not defined
Call :IsArrayDefinedBySet mytestvar[2] && echo it is defined || echo it is not defined

goto :eof

