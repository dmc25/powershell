#############################################################
#Sophos installation Script
#Written By: Damian Coln
#Modified: 6/16/2018
#############################################################

#################
#Global Variables
#################
[string]$deviceEncrption                    = "Yes"
[string]$appplicationBasedFileEncryption    = "No" 
[string]$localBasedFileEncryption           = "No"
[string]$dataExchange                       = "No"
[string]$fileShare                          = "No"
[string]$cloudStorage                       = "No"
[string]$windows7_BitLocker                 = "No"
[string]$windows7_ProDefault2SGN            = "No" 
[string]$strRegPath                         = 'Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager'
[string]$SGxClientPreinstall                = "SGxClientPreinstall.msi"         #Name of SGN PreInstall MSI from download (same for both x86 and x64)
[string]$SGNClient                          = "SGNClient.msi"                   #Name of SGN Client MSI from download for x86 based systems
[string]$SGNClient_x64                      = "SGNClient_x64.msi"               #Name of SGN Client MSI from download for x64 based systems
[string]$SGNConfigManaged                   = "Windows Workstation.msi"         #Name of SGN Configuration MSI created by the Management Center (same for both x86 and x64)
[string]$POACFG                             = "POACFG_7_00_0_105_and_above.xml" #Name of POACFG file (Should be located in the "software" directory)

#Create scritpting log file
#Variables for naming the file and locatoin
[String] $filename            = $env:COMPUTERNAME + "_sophos"
[String] $strLogFileLocation  = "C:\ProgramData\" + $filename + ".log"

#Creates function with the parameter to passthrough information 
function LogWrite ([string] $logString) {

    #adds the information that is passed through to the log file.
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
if((Get-ItemProperty -Path $strRegPath -Name PendingFileRenameOperations) -eq "" ){LogWrite -logString "A pending reboot was not detected, installation will continue"}

else {
    Get-Item -Path $strRegPath | Remove-ItemProperty -Name PendingFileRenameOperations
    LogWrite -logString "A pending reboot was deleted, installation will continue"
}

#######################
#Get CPU Architecture 32 or 64.
#######################
$intArch = (Get-WmiObject Win32_Processor -Property AddressWidth).AddressWidth 

function SGNClientMSI ([int]$intCPUArch){

    if($intCPUArch = '64'){

        [string]$strSgnRegLoc       = "SOFTWARE\WOW6432Node\Utimaco\SafeGuard Enterprise"
        [string]$strSgnRegLocName   = "SGNInstallDir"
        
        LogWrite -logString "CPU architecture - x64 detected"
    }
}

