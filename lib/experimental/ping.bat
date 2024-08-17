
::Usage Call :ping address
::Returns 0 for no replies, 1 for any reply including ICMP errors
:ping
ping -n 1 -w 250 %~1
GoTo :EOF
