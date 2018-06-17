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

#########################################################################################

#Inital Log file creation

LogWrite -logString "SGN Modules selected for install"
LogWrite -logString "Device Encryption: $deviceEncrption" 
LogWrite -logString "ApplicatonBasedFileENcryption: $appplicationBasedFileEncryption"
LogWrite -logString "localBasedFileEncryption: $localBasedFileEncryption" 
LogWrite -logString "dataExchange: $dataExchange"
LogWrite -logString "fileShare: $fileShare"
LogWrite -logString "cloudStorage: $cloudStorage"
LogWrite -logString "windows7_bitlocker: $windows7_BitLocker"
LogWrite -logString "windows7_ProDefault2SGN: $windows7_ProDefault2SGN"

#########################################################################################

