new-item -ItemType Directory -Path C:\Users\bob\Desktop\asdf


$Files = Get-ChildItem -Path C:\Users\* -Include *.jpg,*.png,*.aac,*.ac3,*.avi,*.aiff,*.bat,*.bmp,*.exe,*.flac,*.gif,*.jpeg,*.mov,*.m3u,*.m4p,*.mp2,*.mp3,*.mp4,*.mpeg4,*.midi,*.msi,*.ogg,*.png,*.txt,*.sh,*.wav,*.wma,*.vqf,*.pcap,*.zip,*.pdf,*.json -Recurse -Depth 1 > C:\Users\bob\Desktop\asdf\userfiles.txt
Write-Warning 'listing all located files in user directory'
Write-output $Files
Write-output 'Would you like to remove all of these files^: if yes=1, No=0'
$1 = Read-Host
if ($1 -eq 1){
    Write-Warning 'Removing all found files'
    Remove-Item -Path C:\Users\* -Include *.jpg,*.png,*.aac,*.ac3,*.avi,*.aiff,*.bat,*.bmp,*.exe,*.flac,*.gif,*.jpeg,*.mov,*.m3u,*.m4p,*.mp2,*.mp3,*.mp4,*.mpeg4,*.midi,*.msi,*.ogg,*.png,*.txt,*.sh,*.wav,*.wma,*.vqf,*.pcap,*.zip,*.pdf,*.json -Recurse -Depth 1 
}