
:ListVolumes
for /f "skip=7 tokens=*" %%a in ('echo list volume ^| diskpart') do ( if "[%%a]" NEQ "[DISKPART> ]" echo %%a )
GoTo :EOF
