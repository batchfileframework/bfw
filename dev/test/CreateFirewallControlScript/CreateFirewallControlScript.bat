@echo off

set "original_script=FileShareRulesControl.bat"
set "actions=Enable Disable"
set "rules_groups=NameResolution RespondToPings PrinterSharing FileSharing OldFileSharing"
set "profiles=OnPublic OnPrivate OnDomain"

for %%a in (%actions%) do (
  for %%g in (%rules_groups%) do (
    for %%p in (%profiles%) do (
      echo Copying %%a%%g%%p.bat...
      copy "%original_script%" "%%a %%g %%p.bat"
    )
    echo Copying %%a%%g.bat...
    copy "%original_script%" "%%a %%g.bat"
  )
)
