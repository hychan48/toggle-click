#SingleInstance, force
; https://www.autohotkey.com/board/topic/56470-best-way-to-minimize-gui-to-tray/
Gui, show, w200 h200

Menu, Tray, Add, Restore, Restore
Menu, Tray, default, Restore
Menu, Tray, Click, 2
return

GuiSize:
  if (A_EventInfo = 1)
    WinHide
  return

Restore:
  gui +lastfound
  WinShow
  WinRestore
  return

GuiClose:
ExitApp