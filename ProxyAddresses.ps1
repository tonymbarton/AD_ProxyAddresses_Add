Import-Module ActiveDirectory

$domain = "@domainname.com"
$users = Get-ADUser -Filter {ProxyAddresses -notlike "*"} -Properties SamAccountName, ProxyAddresses

Foreach ($user in $users) {

    Set-ADUser -Identity $user.samaccountname -Add @{Proxyaddresses="SMTP:"+$user.samaccountname+$domain}

    }