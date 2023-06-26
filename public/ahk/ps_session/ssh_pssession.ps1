# echo $PSVersionTable # dont need to echo apparently
# $PSVersionTable

Get-PSSession | Remove-PSSession


# $session = New-PSSession -HostName win11vm.mshome.net -UserName Administrator
$session = New-PSSession -HostName localhost -UserName Jason
# interesting.. crashed
Get-PSSession # didnt even ask me for password. probably because of config?
Enter-PSSession -Session (Get-PSsession)
Get-PSHostProcessInfo
