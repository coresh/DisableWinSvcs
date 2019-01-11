@echo Starting Disabling Services 

@net stop Fax > null 2>&1
@echo .
@net stop DPS > null 2>&1
@echo .
@net stop Spooler > null 2>&1
@echo .
@net stop seclogon > null 2>&1
@echo .
@net stop PcaSvc > null 2>&1
@echo .
@net stop ScDeviceEnum > null 2>&1
@echo .
@net stop CscService > null 2>&1
@echo .
@net stop stisvc > null 2>&1
@echo .
@net stop DiagTrack > null 2>&1
@echo .
@net stop RemoteRegistry > null 2>&1
@echo .
@net stop WerSvc > null 2>&1
@echo .

@echo Finished!

@pause