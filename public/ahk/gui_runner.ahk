#Requires AutoHotkey v2.0
#SingleInstance
; FileDelete('log.txt')
; FileAppend("X11VNC :" StartTime ":" ElapsedTime "`n", "log.txt")
Persistent true

; ToolbarWindow323


; show_opts:="AutoSize Restore"
show_opts:="AutoSize NoActivate"
; show_opts:="AutoSize Minimize"
; show_opts:="Minimize"
; show_opts:="AutoSize Hide"
; show_opts:="AutoSize NA"
; show_opts:="AutoSize Hide"
; show_opts:="AutoSize Restore Minimize"
; MyGui := Gui(, "Title of Window")
; MyGui := Gui("+Resize +MinSize640x480 -SysMenu +MinimizeBox")
; MyGui := Gui("+Resize +MinSize640x480 -SysMenu")
; MyGui := Gui("+Resize +MinSize640x480 -SysMenu +Owner +MinimizeBox")
; MyGui := Gui("+MinSize640x480 -SysMenu +Owner +MinimizeBox")
; MyGui := Gui("+MinSize640x480 -SysMenu +MinimizeBox")
; MyGui := Gui("+MinSize640x480 -SysMenu +Owner")
MyGui := Gui("+Resize +MinSize640x480 -SysMenu +Owner +LastFound +MinimizeBox")
; MyGui := Gui("+Resize +MinSize640x480 -SysMenu +Owner +LastFound +ToolWindow")
; MyGui := Gui("+Resize +MinSize640x480 -SysMenu +Owner +MinimizeBox Hide")
; MyGui := Gui("+Resize +MinSize640x480")
FileMenu := Menu()

; FileMenu.Add "E&xit", (*) => ExitApp()
; FileMenu.Add "E&xit", (*) => WinMinimize("A")
; FileMenu.Add "E&xit", (*) => WinHide(MyGui)
FileMenu.Add "Min", (*) => MyGui.Minimize()
FileMenu.Add "E&xit", (*) => WinHide(MyGui)
; FileMenu.Add "&Open`tCtrl+O", (*) => FileSelect()  ; See remarks below about Ctrl+O.

Menus := MenuBar()
Menus.Add "&File", FileMenu
MyGui.MenuBar := Menus


; MyGui.Opt("+AlwaysOnTop +Disabled -SysMenu +Owner")  ; +Owner avoids a taskbar button.
; MyGui.Opt("+Owner")  ; +Owner avoids a taskbar button.
; MyGui.Add("Text",, "Some text to display.")

MyGui.Add("Text",, "Last name:")
; MyGui.Add("Edit", "vFirstName ym")  ; The ym option starts a new column of controls.
; MyGui.Add("Edit", "vFirstName ym","value")  ; The ym option starts a new column of controls.
; However, when the control's content is retrieved via MyGui.Submit or GuiCtrl.Value, each `r`n in the text is always translated to a plain linefeed (`n).

MyGui.AddEdit("vFirstName ym r3 w200","value")  ; The ym option starts a new column of controls.
MyGui.AddEdit("vName ym","value")  ; The ym option starts a new column of controls.
; https://www.autohotkey.com/docs/v2/lib/Gui.htm#ExInputBox
MyGui.Add("Button", "default", "OK").OnEvent("Click", ProcessUserInput) ; so any enter would submit
; MyGui.Add("Button",, "OK").OnEvent("Click", ProcessUserInput)
ProcessUserInput(*)
{
    ; Saved := MyGui.Submit()  ; Save the contents of named controls into an object.
    Saved := MyGui.Submit(0)  ; 0 so it doesnt close/
    ; MsgBox("You entered '" Saved " '.") ; object..
    ; Run("gui_execute.ahk")
    MsgBox("You entered '" Saved.FirstName " '.", ,"T5")
}

; MyGui.Show()  ; NoActivate avoids deactivating the currently active window.
MyGui.Show(show_opts)  ; NoActivate avoids deactivating the currently active window.
; MyGui.Show("NoActivate")  ; NoActivate avoids deactivating the currently active window.

; Exit(0)

; A_TrayMenu.Add "Hide", (*) => MyGui.Hide()
A_TrayMenu.Add "Hide", (*) => MyGui.Hide()
; A_TrayMenu.Add "Show", (*) => WinRestore(MyGui)
A_TrayMenu.Add "Show", (*) => MyGui.Show()
A_TrayMenu.Default := "Show"
A_TrayMenu.Add "max", (*) => WinMaximize(MyGui)