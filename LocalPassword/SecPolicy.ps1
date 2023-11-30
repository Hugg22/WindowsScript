secedit /configure /db c:\windows\security\local.sdb /cfg "IntialConfig.cfg" /areas SECURITYPOLICY

#######Just in case the other code does not work:##########
###Saves the local security policy configuration file to competition folder:
Get-Content LocalPassword\IntialConfig.cfg
###Updates the local security policy:
secedit /configure /db c:\windows\security\local.sdb /cfg "IntialConfig.cfg" /areas SECURITYPOLICY