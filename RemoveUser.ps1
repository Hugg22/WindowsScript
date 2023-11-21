Write-Output 'What users would you like to remove?'
$User = Read-Host
Remove-LocalUser -Name $User







