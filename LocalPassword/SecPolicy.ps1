secedit /configure /db c:\windows\security\local.sdb /cfg "IntialConfig.cfg" /areas SECURITYPOLICY

#######Just in case the other code does not work:##########
###Saves the local security policy configuration file to competition folder:
Get-Content LocalPassword\IntialConfig.cfg
###Updates the local security policy:
secedit /configure /db c:\windows\security\local.sdb /cfg "IntialConfig.cfg" /areas SECURITYPOLICY


$configContent = Get-Content LocalPassword\IntialConfig.cfg 
Invoke-Expression -command $configContent

$seceditCommand = secedit /configure /db c:\windows\security\local.sdb /cfg "IntialConfig.cfg" /areas SECURITYPOLICY

Invoke-Expression -Command $seceditCommand





#Region editing local policys:
# Specify the paths
$configFilePath = "IntialConfig.cfg"
$dbPath = "c:\windows\security\local.sdb"


# Read content from the configuration file
$configContent = Get-Content -Path $configFilePath -Raw


    # Use secedit to apply the configuration
    $seceditCommand = "secedit /configure /db ""$dbPath"" /cfg ""$configFilePath"" /areas SECURITYPOLICY"
    
    # Start the secedit process and capture the output
    Start-Process -FilePath "secedit" -ArgumentList @("/configure", "/db", $dbPath, "/cfg", $configFilePath, "/areas", "SECURITYPOLICY") 
    
    Write-Output "Security settings applied successfully."
#EndRegion


#Region editing local policys:
# Specify the paths
$configFilePath = "IntialConfig.cfg"
$dbPath = "c:\windows\security\local.sdb"
# Read content from the configuration file
$configContent = Get-Content -Path $configFilePath -Raw

# Use secedit to apply the configuration
$seceditCommand = "secedit /configure /db ""$dbPath"" /cfg ""$configFilePath"" /areas SECURITYPOLICY"
    
# Start the secedit process and capture the output
Start-Process -FilePath "secedit" -ArgumentList @("/configure", "/db", $dbPath, "/cfg", $configFilePath, "/areas", "SECURITYPOLICY") 

Write-Output "Security settings applied successfully."
#EndRegion


