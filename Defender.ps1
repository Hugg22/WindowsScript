#need to test on windows vm
#should make it to where all solutions are exported to file


#Use  Set-MpPreference  to set settings for defender, need to set each one indivdually but should work well for what we need
Get-MpComputerStatus







#updates the antimalware: should run before you start scan.
Update-MpSignature
#run after updates: starts the scan
Start-MpScan
#Removes detected active threats from local computer:
Remove-MpThreat



