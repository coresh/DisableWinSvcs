echo Starting Disabling Services 

@net stop Fax > null
@net stop DPS > null
@net stop Spooler > null
@net stop seclogon > null
@net stop PcaSvc > null
@net stop ScDeviceEnum > null
@net stop CscService > null
@net stop stisvc > null
@net stop DiagTrack > null
@net stop RemoteRegistry > null
@net stop WerSvc > null

echo Finished!

PAUSE