@ECHO OFF
@Title Qlikview Components Build Process
REM ***************************************************************************************************************
REM This cmd file is for people who don't want to use ANT (requires Java & ANT) to rebuild the Runtime\Qvc.qvs >>..\Qvc_Runtime\Qvc.qvs file. 
REM ****************************************************************************************************************
CD "%~dp0"
ECHO Cleaning Qvc_Runtime directory...
DEL /S /Q ..\Qvc_Runtime\*.* > nul

ECHO Merging source *.qvs files into Qvc.qvs...

REM ..\QVC_Source\Qvc_Global.qvs must be first.
TYPE ..\QVC_Source\Qvc_Global.qvs > ..\Qvc_Runtime\Qvc.qvs
FOR %%b IN (..\QVC_Source\*.qvs) DO (
    IF NOT "%%b"=="..\QVC_Source\Qvc_Global.qvs" (
        TYPE %%b >> ..\Qvc_Runtime\Qvc.qvs
    )
)

ECHO Copying language files...
XCOPY ..\QVC_Source\Language\*.* ..\Qvc_Runtime\Language\*.* /E > nul

ECHO Qlikview Components build complete!

SET /p=Press ENTER to finish...
@ECHO ON
