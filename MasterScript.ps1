#sets Firewall to active
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True

#Blocking high risk ports
New-NetFirewallRule -DisplayName "Block Port 23" -Direction Outbound -LocalPort 23 -Protocol TCP -Action Block
New-NetFirewallRule -DisplayName "Block Port 20" -Direction Outbound -LocalPort 20 -Protocol TCP -Action Block
New-NetFirewallRule -DisplayName "Block Port 21" -Direction Outbound -LocalPort 21 -Protocol TCP -Action Block
New-NetFirewallRule -DisplayName "Block Port 22" -Direction Outbound -LocalPort 22 -Protocol TCP -Action Block
New-NetFirewallRule -DisplayName "Block Port 69" -Direction Outbound -LocalPort 69 -Protocol TCP -Action Block
New-NetFirewallRule -DisplayName "Block Port 3389" -Direction Outbound -LocalPort 3389 -Protocol TCP -Action Block
New-NetFirewallRule -DisplayName "Block Port 5900,5901,5902" -Direction Outbound -LocalPort 5900,5901,5902 -Protocol TCP -Action Block
New-NetFirewallRule -DisplayName "Block Port 5112,513,514" -Direction Outbound -LocalPort 512,513,514 -Protocol TCP -Action Block
New-NetFirewallRule -DisplayName "Block Port 873" -Direction Outbound -LocalPort 873 -Protocol TCP -Action Block
New-NetFirewallRule -DisplayName "Block Port 25" -Direction Outbound -LocalPort 25 -Protocol TCP -Action Block
New-NetFirewallRule -DisplayName "Block Port 110" -Direction Outbound -LocalPort 110 -Protocol TCP -Action Block
New-NetFirewallRule -DisplayName "Block Port 143" -Direction Outbound -LocalPort 143 -Protocol TCP -Action Block
New-NetFirewallRule -DisplayName "Block Port 1433" -Direction Outbound -LocalPort 1433 -Protocol TCP -Action Block
New-NetFirewallRule -DisplayName "Block Port 1521" -Direction Outbound -LocalPort 1521 -Protocol TCP -Action Block
New-NetFirewallRule -DisplayName "Block Port 3306" -Direction Outbound -LocalPort 3306 -Protocol TCP -Action Block
New-NetFirewallRule -DisplayName "Block Port 5000" -Direction Outbound -LocalPort 5000 -Protocol TCP -Action Block
New-NetFirewallRule -DisplayName "Block Port 5432" -Direction Outbound -LocalPort 5432 -Protocol TCP -Action Block
New-NetFirewallRule -DisplayName "Block Port 6379" -Direction Outbound -LocalPort 6379 -Protocol TCP -Action Block
New-NetFirewallRule -DisplayName "Block Port 27017,27018" -Direction Outbound -LocalPort 27017,27018 -Protocol TCP -Action Block

#Finds files created by user and puts them into a file located in the Users c drive
Get-ChildItem -Path C:\users\*.txt -Recurse -Force -Depth 2 > c:\Users\txtOutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.png  -Recurse -Force -Depth 2 > c:\Users\pngOutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.jpeg  -Recurse -Force -Depth 2 > c:\Users\jpegOutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.doc  -Recurse -Force -Depth 2 > c:\Users\docOutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.mp3  -Recurse -Force -Depth 2 > c:\Users\mp3OutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.sql  -Recurse -Force -Depth 2 > c:\Users\sqlOutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.exe  -Recurse -Force -Depth 2 > c:\Users\exeOutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.mp4  -Recurse -Force -Depth 2 > c:\Users\mp4OutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.docx  -Recurse -Force -Depth 2 > c:\Users\docxOutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.pdf  -Recurse -Force -Depth 2 > c:\Users\pdfOutPut -ErrorAction SilentlyContinue

#Shows active users on local computer
Get-LocalUser | Where-Object -Property enabled

#need to create microsoft defender script componennt. -temp

#Conditonal that creates new user on local computer as long as the user inputs 1 and when the user inputs 0 the script moves on.
Write-Output 'New User? yes=1, no=0 '
$i = Read-Host

while ($i -eq 1) {
    Write-Output 'UserName:'
    $UserName = Read-Host
    Write-Output 'Password:'
    $Password = Read-Host -AsSecureString
    Write-Output 'Full Name:'
    $FullName = Read-Host
    Write-Output 'Group: (seperate with , then a space for mulitple groups)'
    $Group = Read-Host
    
    New-LocalUser -Name $UserName -FullName $FullName -Password $Password -AccountNeverExpires -UserMayNotChangePassword
    Add-LocalGroupMember -Group "$Group" -Member $UserName 
    
    Write-Output 'New User? yes=1, no=0 '
    $i = Read-Host
}

#Conditonal that removes a user on local computer as long as user inputs 1. When the user inputs 0 the script moves on. 
Write-Output 'Remove User? Yes=1, No=0'
$i = Read-Host

while ($i -eq 1) {
    Write-Output 'What users would you like to remove?'
    $User = Read-Host
    Remove-LocalUser -Name $User

    Write-Output 'Remove User? Yes=1, No=0'
$i = Read-Host
}