@ECHO OFF
@Title Qlikview Components Build Process
REM ***************************************************************************************************************
REM This cmd file is for people who don't want to use ANT (requires Java & ANT) to rebuild the Runtime\Qvc.qvs >>..\Qvc_Runtime\Qvc.qvs file. 
REM ****************************************************************************************************************

call :setup
call :clean
call :build
call :doc

ECHO Qlikview Components build complete!

SET /p=Press ENTER to finish...
GOTO :End

:setup
    REM ** Make sure we are in the build directory so we can call this script from anywhere
    CD "%~dp0"
    REM Setup configuration for running qlikview
    SET qveDir="C:\Program Files\QlikView"
    SET qveExec="qv.exe"
    SET runtimeDir="..\Qvc_Runtime"
    SET srcDir="..\Qvc_Source"
    SET docDir="..\Doc"
GOTO:EOF

:build
    ECHO Merging source *.qvs files into Qvc.qvs...

    REM ..\QVC_Source\Qvc_Global.qvs must be first.
    TYPE %srcDir%\Qvc_Global.qvs > %runtimeDir%\Qvc.qvs
    FOR %%b IN (%srcDir%\*.qvs) DO (
        IF NOT "%%b"=="%srcDir%\Qvc_Global.qvs" (
            TYPE %%b >> %runtimeDir%\Qvc.qvs
        )
    )

    ECHO Copying language files...
    XCOPY %srcDir%\Language\*.* %runtimeDir%\Language\*.* /E > nul
GOTO:EOF

:clean
    ECHO Cleaning Qvc_Runtime directory...
    DEL /S /Q %runtimeDir%\*.* > nul
GOTO:EOF

:doc
    ECHO Building documentation...
    %qveDir%\%qveExec% /NoSecurity /r %docDir%\QvcDocumentation.qvw
GOTO:EOF

:End
@ECHO ON
