echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

:MENU
@cls
@echo . .....................................................................................
@echo .                            Developed by: TIGAXMT                                    .                                                        
@echo .......................................................................................
@echo .                                                                                     .
@echo .                                                                                     .  
@echo .                                                                                     .
@echo . 1 - Disable Unnecessary Services                                                    .
@echo . 2 - Disable Unnecessary Services Powerful (some features can be disable e.g: IPv6)  .
@echo . 3 - Windows License Expiration                                                      .
@echo . 4 - Hardware Info                                                                   .
@echo . 5 - Disable Suggested Apps (Windows 10)                                             .
@echo . 6 - Remove WaterMark                                                                .
@echo . 7 - Reboot Windows                                                                  .
@echo . 0 - Exit                                                                            .
@echo .                                                                                     .
@echo .                                                                                     .
@echo .......................................................................................

@set /P M=Type the option NUMBER then press ENTER:
IF %M%==1 GOTO DUS
IF %M%==2 GOTO DUSP
IF %M%==3 GOTO SLMGREXP
IF %M%==4 GOTO HARDWARE
IF %M%==5 GOTO SUGGESTAPPS
IF %M%==6 GOTO WATERMARK
IF %M%==7 GOTO RBT
IF %M%==0 GOTO EOF
IF %M%>5 GOTO MENU


:DUS
@echo Starting Disabling Unnecessary Services 
@net stop Fax > null 2>&1
@sc config Fax start= disabled
@echo Disabling Fax

@net stop DPS > null 2>&1
@sc config DPS start= disabled
@echo Disabling Diagnostic Policy Service

@net stop Spooler > null 2>&1
@sc config Spooler start= disabled
@echo Disabling Print Spooler

@net stop seclogon > null 2>&1
@sc config seclogon start= disabled
@echo Disabling Secondary Logon

@net stop PcaSvc > null 2>&1
@sc config PcaSvc start= disabled
@echo Disabling Program Compatibility Assistant Service

@net stop ScDeviceEnum > null 2>&1
@sc config ScDeviceEnum start= disabled
@echo Smart Card Device Enumeration Service

@net stop CscService > null 2>&1
@sc config CscService start= disabled
@echo Disabling Offline Files

@net stop stisvc > null 2>&1
@sc config stisvc start= disabled
@echo Disabling Still Image Services

@net stop DiagTrack > null 2>&1
@sc config DiagTrack start= disabled
@echo Disabling Diagnostic Tracking Service

@net stop RemoteRegistry > null 2>&1
@sc config RemoteRegistry start= disabled
@echo Disabling Remote Registry

@net stop WerSvc > null 2>&1
@sc config WerSvc start= disabled
@echo Disabling Windows Error Reporting Service

@net stop dmwappushsvc > null 2>&1
@sc config dmwappushsvc start= disabled
@echo Disabling dmwappushsvc Service

@echo Finished!
@cls
GOTO MENU

:DUSP
@echo Starting Disabling Unnecessary Services Powerful 
@net stop Fax > null 2>&1
@sc config Fax start= disabled
@echo Disabling Fax

@net stop DPS > null 2>&1
@sc config DPS start= disabled
@echo Disabling Diagnostic Policy Service

@net stop Spooler > null 2>&1
@sc config Spooler start= disabled
@echo Disabling Print Spooler

@net stop seclogon > null 2>&1
@sc config seclogon start= disabled
@echo Disabling Secondary Logon

@net stop PcaSvc > null 2>&1
@sc config PcaSvc start= disabled
@echo Disabling Program Compatibility Assistant Service

@net stop ScDeviceEnum > null 2>&1
@sc config ScDeviceEnum start= disabled
@echo Smart Card Device Enumeration Service

@net stop CscService > null 2>&1
@sc config CscService start= disabled
@echo Disabling Offline Files

@net stop stisvc > null 2>&1
@sc config stisvc start= disabled
@echo Disabling Still Image Services

@net stop DiagTrack > null 2>&1
@sc config DiagTrack start= disabled
@echo Disabling Diagnostic Tracking Service

@net stop RemoteRegistry > null 2>&1
@sc config RemoteRegistry start= disabled
@echo Disabling Remote Registry

@net stop WerSvc > null 2>&1
@sc config WerSvc start= disabled
@echo Disabling Windows Error Reporting Service

@net stop dmwappushsvc > null 2>&1
@sc config dmwappushsvc start= disabled
@echo Disabling dmwappushsvc Service

@net stop MapsBroker > null 2>&1
@sc config MapsBroker start= disabled
@echo Disabling Downloaded Maps Manager

@net stop iphlpsvc > null 2>&1
@sc config iphlpsvc start= disabled
@echo Disabling IP Helper

@net stop WSearch > null 2>&1
@sc config WSearch start= disabled
@echo Disabling Windows Search

@echo Finished!
@cls
GOTO MENU

:SLMGREXP

@slmgr -xpr
@cls
GOTO MENU

:HARDWARE
@cls
@echo CPU
@wmic cpu get name, numberofcores, maxclockspeed, status

@echo RAM
@wmic MEMORYCHIP get DeviceLocator, MemoryType, TypeDetail, Speed
@systeminfo | findstr /C:”Total Physical Memory

@echo GPU
@wmic path win32_VideoController get name

@echo HDD
@wmic logicaldisk get Caption, DriveType, Size 
@pause
@cls
GOTO MENU

:SUGGESTAPPS

@cls
@echo Disabling Suggested Apps ....
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f
@pause
@cls
GOTO MENU

:WATERMARK

@cls
@echo WARNING: YOUR COMPUTER WILL BE REBOOTTED
@echo
@pause

@echo off
Taskkill /F /IM explorer.exe
explorer.exe
GOTO RBT

:RBT
@shutdown /r /t 0

@pause