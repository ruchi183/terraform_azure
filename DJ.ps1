$domain = "terraform.com"
$password = "welcome@12345"| ConvertTo-SecureString -asPlainText -Force
$username = "$domain\ruchi
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
Add-Computer -DomainName $domain -Credential $credential