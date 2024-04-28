

::Usage Call :Install DELETETEMPFILES softwarename optional usercommandsfolder optional destinationroot optional destinationfolder

check internal lookup for software definition
create folder
create version subfolder
create package subfolder
create version subfolder in package folder
download package files to package subfolder   folder\package\version\
use system proxy settings if needed
uncompress and copy relevant files to destinationroot\destinationfolder\version\
hardlink all relevant files in destinationroot\destinationfolder\
hardlink all relevant files to userfolder

::Usage Call :GetSoftwareDetails softwarename Details.object
:GetSoftwareDetails softwarename

REM software name
REM description
REM latest.version
REM latest.sourceURL[]
REM latest.signature
REM latest.signature.type
REM knownversions[].versions
REM knownversions[].signature
REM knownversions[].signature.type

if "[%~1]" EQU "[ffmpeg-essentials-by-gyan.dev]"
if "[%~1]" EQU "[ffmpeg-full-by-gyan.dev]" (


set "%~2[0].name=FFmpeg"
set "%~2[0].description=Fast Forward MPEG"
set "%~2[0].variant=Fast Forward MPEG by-gyan.dev"
REM set "%~2[0].version=2023-09-07-git-9c9f48e7f2"
set "%~2[0].version=6.0"
set "%~2[0].files[0].url=https://github.com/GyanD/codexffmpeg/releases/download/6.0/ffmpeg-6.0-full_build.zip"
set "%~2[0].files[0].signature=ee343e25f71cfd5b9de1f800dba2e5d4fd6da25118a82035acf7363f8086daa9"
set "%~2[0].files[0].signature.url=https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-full.7z.sha256"
set "%~2[0].files[0].signature.type=sha256"
set "%~2[0].files[0].filename=ffmpeg-full-(by-gyan.dev)-6.0.zip"
set "%~2[0].installcommands[0]=unzip file destinationfolder"
set "%~2.ubound=0"
https://github.com/GyanD/codexffmpeg/releases/download/6.0/ffmpeg-6.0-full_build.zip
https://github.com/GyanD/codexffmpeg/releases/download/6.0/ffmpeg-6.0-essentials_build.zip
https://github.com/GyanD/codexffmpeg/releases/download/2023-09-07-git-9c9f48e7f2/ffmpeg-2023-09-07-git-9c9f48e7f2-essentials_build.zip
https://github.com/GyanD/codexffmpeg/releases/download/2023-09-07-git-9c9f48e7f2/ffmpeg-2023-09-07-git-9c9f48e7f2-full_build.zip
set "%~2.name="
set "%~2.description="
set "%~2.version
set "%~2.sourceURLs[]
set "%~2.installcommands[]
set "%~2.signature
set "%~2.signature.type
)


if "[%~1]" EQU "[ffmpeg-essentials-by-BtbN]" ( )

if "[%~1]" EQU "[ffmpeg-full-by-BtbN]" ( )

if "[%~1]" EQU "[TCC]" (



)
