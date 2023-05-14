# Non ssh should work
# psexec s0
# psexec s11
# psexec -accepteula -w "$pwd.Path" -i 1 -s ahk .\gui_psexec.ahk
$ahkv2="C:\Users\Jason\AppData\Local\Programs\AutoHotkey\v2\AutoHotkey64.exe"

#works... through ssh but not w/o. no -s flag?
# psexec -accepteula -i 1 -s $ahkv2 c:\Users\Jason\WebstormProjects\toggle-click\public\ahk\gui_psexec.ahk "1_s"
# psexec -accepteula -i 1 $ahkv2 c:\Users\Jason\WebstormProjects\toggle-click\public\ahk\gui_psexec.ahk "1_no_s"

# psexec -accepteula -s powershell echo $pwd # without -s... wont get console out...
# psexec -accepteula -h powershell echo $pwd # without -s... wont get console out...
psexec -accepteula powershell echo $pwd # without -s... wont get console out...


# local
# psexec -accepteula $ahkv2 c:\Users\Jason\WebstormProjects\toggle-click\public\ahk\gui_psexec.ahk "1 local"

## my point is it shouldnt need to?
# i feel like it would be easier just to edit?
# psexec -accepteula $ahkv2 c:\Users\Jason\WebstormProjects\toggle-click\public\ahk\gui_psexec.ahk "1 local"

# doesnt work... over ssh
# psexec -accepteula -i 0 -s $ahkv2 c:\Users\Jason\WebstormProjects\toggle-click\public\ahk\gui_psexec.ahk 1


# $tmp=psexec -accepteula -w "$pwd.Path" -i 1 -s ahk .\gui_psexec.ahk
# echo $tmp
