#SingleInstance Force

WM_DISPLAYCHANGE := 0x7E
OnMessage(WM_DISPLAYCHANGE, "handle_display_change")

handle_display_change(wParam, lParam)
{
    Retile()
}

; You can generate a fresh version of this file with "komorebic ahk-library"
#Include %A_ScriptDir%\komorebic.lib.ahk
#Include %A_ScriptDir%\komorebi-app-config.ahk

; Default to minimizing windows when switching workspaces
WindowHidingBehaviour("minimize")

; Set cross-monitor move behaviour to insert instead of swap
CrossMonitorMoveBehaviour("insert")

; Enable hot reloading of changes to this file
WatchConfiguration("enable")

; Ensure there is 1 workspace created on monitor 0
EnsureWorkspaces(0, 10)
EnsureWorkspaces(1, 10)

; Configure the invisible border dimensions
InvisibleBorders(7, 0, 14, 7)

ContainerPadding(0,0,2)
ContainerPadding(0,1,2)
ContainerPadding(0,2,2)
ContainerPadding(0,3,2)
ContainerPadding(0,4,2)
ContainerPadding(0,5,2)
ContainerPadding(0,6,2)
ContainerPadding(0,7,2)
ContainerPadding(0,8,2)
; This one is higher as I tend to put messaging apps on this Workspace and they look a little better with more padding.
ContainerPadding(0,9,10)

ContainerPadding(1,0,2)
ContainerPadding(1,1,2)
ContainerPadding(1,2,2)
ContainerPadding(1,3,2)
ContainerPadding(1,4,2)
ContainerPadding(1,5,2)
ContainerPadding(1,6,2)
ContainerPadding(1,7,2)
ContainerPadding(1,8,2)
; This one is higher as I tend to put messaging apps on this Workspace and they look a little better with more padding.
ContainerPadding(1,9,10)

WorkspacePadding(0,0,0)
WorkspacePadding(0,1,0)
WorkspacePadding(0,2,0)
WorkspacePadding(0,3,0)
WorkspacePadding(0,4,0)
WorkspacePadding(0,5,0)
WorkspacePadding(0,6,0)
WorkspacePadding(0,7,0)
WorkspacePadding(0,8,0)
WorkspacePadding(0,9,0)

WorkspacePadding(1,0,0)
WorkspacePadding(1,1,0)
WorkspacePadding(1,2,0)
WorkspacePadding(1,3,0)
WorkspacePadding(1,4,0)
WorkspacePadding(1,5,0)
WorkspacePadding(1,6,0)
WorkspacePadding(1,7,0)
WorkspacePadding(1,8,0)
WorkspacePadding(1,9,0)

CompleteConfiguration()

; Change the focused window, Alt + Vim direction keys (HJKL)
!h::
Focus("left")
return

!j::
Focus("down")
return

!k::
Focus("up")
return

!l::
Focus("right")
return

; Move the focused window in a given direction, Alt + Shift + Vim direction keys (HJKL)
!+h::
Move("left")
return

!+j::
Move("down")
return

!+k::
Move("up")
return

!+l::
Move("right")
return


<!1::
FocusMonitorWorkspace(0, 0)
return

<!2::
FocusMonitorWorkspace(0, 1)
return

<!3::
FocusMonitorWorkspace(0, 2)
return

<!4::
FocusMonitorWorkspace(0, 3)
return

<!5::
FocusMonitorWorkspace(0, 4)
return


<!6::
FocusMonitorWorkspace(0, 5)
return

<!7::
FocusMonitorWorkspace(0, 6)
return


<!8::
FocusMonitorWorkspace(0, 7)
return


<!9::
FocusMonitorWorkspace(0, 8)
return


<!0::
FocusMonitorWorkspace(0, 9)
return


<!+1::
SendToMonitorWorkspace(0, 0)
return

<!+2::
SendToMonitorWorkspace(0, 1)
return

<!+3::
SendToMonitorWorkspace(0, 2)
return

<!+4::
SendToMonitorWorkspace(0, 3)
return


<!+5::
SendToMonitorWorkspace(0, 4)
return

<!+6::
SendToMonitorWorkspace(0, 5)
return

<!+7::
SendToMonitorWorkspace(0, 6)
return

<!+8::
SendToMonitorWorkspace(0, 7)
return

<!+9::
SendToMonitorWorkspace(0, 8)
return

<!+0::
SendToMonitorWorkspace(0, 9)
return

; This is technically sort of a duplicate, but this is an older shortcut I use that I sometimes reach for.
<!-::
FocusMonitorWorkspace(1, 0)
return

; Display 2
>!1::
FocusMonitorWorkspace(1, 0)
return

>!2::
FocusMonitorWorkspace(1, 1)
return

>!3::
FocusMonitorWorkspace(1, 2)
return

>!4::
FocusMonitorWorkspace(1, 3)
return

>!5::
FocusMonitorWorkspace(1, 4)
return


>!6::
FocusMonitorWorkspace(1, 5)
return

>!7::
FocusMonitorWorkspace(1, 6)
return


>!8::
FocusMonitorWorkspace(1, 7)
return


>!9::
FocusMonitorWorkspace(1, 8)
return


>!0::
FocusMonitorWorkspace(1, 9)
return

<!+-::
SendToMonitorWorkspace(1, 0)
return

>!+1::
SendToMonitorWorkspace(1, 0)
return

>!+2::
SendToMonitorWorkspace(1, 1)
return

>!+3::
SendToMonitorWorkspace(1, 2)
return

>!+4::
SendToMonitorWorkspace(1, 3)
return

>!+5::
SendToMonitorWorkspace(1, 4)
return

>!+6::
SendToMonitorWorkspace(1, 5)
return

>!+7::
SendToMonitorWorkspace(1, 6)
return

>!+8::
SendToMonitorWorkspace(1, 7)
return

>!+9::
SendToMonitorWorkspace(1, 8)
return

>!+0::
SendToMonitorWorkspace(1, 9)
return

; Cycle through the workspaces
!u::
Run, komorebic.exe cycle-workspace next, , Hide
return

!+u::
Run, komorebic.exe cycle-workspace previous, , Hide
return

; This is a horribly hacky way to get Windows Terminal to get focus, 
; but wt.exe seems to change it's PID so the PID we'd get from 
; `Run` isn't helpful.
!enter::
Run wt.exe
if WinExist("ahk_exe WindowsTerminal.exe") {
    Sleep 500
    WinActivateBottom ahk_exe WindowsTerminal.exe
}
return

!f::
ToggleMaximize()
return

!+space::{
ToggleFloat()
return

; Retile
!+r::{
Retile()
return

!#^+LButton::{
ForceFocus()
return

!+q::
Send !{f4}
return

; Allow komorebi to start managing windows
Run "komorebic complete-configuration", , "Hide"
