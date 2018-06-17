#############################################################
#Sophos installation Script
#Written By: Damian Coln
#Modified: 6/16/2018
#############################################################

$deviceEncrption                    = "Yes"
$appplicationBasedFileEncryption    = "No" 
$localBasedFileEncryption           = "No"
$dataExchange                       = "No"
$fileShare                          = "No"
$cloudStorage                       = "No"
$windows7_BitLocker                 = "No"
$windows7_ProDefault2SGN            = "No" 

#Create scritpting log file
#Variables for naming the file and locatoin
[String] $filename            = $env:COMPUTERNAME + "_sophos"
[String] $strLogFileLocation  = "C:\ProgramData\" + $filename + ".log"

#Creates function with the parameter to passthrough information 
function LogWrite ([string] $logString) {

    #adds the information that is passwed through to the log file.
    Add-Content $strLogFileLocation -Value $logString
}

##########################
#Inital Log file creation
##########################
LogWrite -logString "SGN Modules selected for install"
LogWrite -logString "Device Encryption: $deviceEncrption" 
LogWrite -logString "ApplicatonBasedFileENcryption: $appplicationBasedFileEncryption"
LogWrite -logString "localBasedFileEncryption: $localBasedFileEncryption" 
LogWrite -logString "dataExchange: $dataExchange"
LogWrite -logString "fileShare: $fileShare"
LogWrite -logString "cloudStorage: $cloudStorage"
LogWrite -logString "windows7_bitlocker: $windows7_BitLocker"
LogWrite -logString "windows7_ProDefault2SGN: $windows7_ProDefault2SGN"

###############################################
#Checks to see if a pending reboot is required.
###############################################
$isTrue = [string]::IsNullOrEmpty((Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager' -Name PendingFileRenameOperations))

if($isTrue){LogWrite -logString "A pending reboot was not detected, installation will continue"}

else {
    Get-Item -Path 'Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager' | Remove-ItemProperty -Name PendingFileRenameOperations
    LogWrite -logString "A pending reboot was deleted, installation will continue"
}

#########################################################################################