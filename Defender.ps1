#Use Defender module on microsoft learn for info: https://learn.microsoft.com/en-us/powershell/module/defender/?view=windowsserver2022-ps

#need to test on windows vm
#should make it to where all solutions are exported to file

#gets the status of anitmalware software on the computer:
Get-MpComputerStatus


#Things to do:
#Use  Set-MpPreference  to set settings for defender, need to set each one indivdually but should work well for what we need

#Use Get-MpPreference to check settings were completed correctly, also lists to user of script what the settings are set too:

#use Get-MpThreat to see all past and current threats detected on computer as well as Get-MpThreatDetection

#can use Get-MpThreatCatalog to check what any threats that are found do, by using the process id of any dicoverd threats to help figure out how to defend against it.










#updates the antimalware: should run before you start scan.
Update-MpSignature
#run after updates: starts the scan
Start-MpScan
#Removes detected active threats from local computer:
Remove-MpThreat



