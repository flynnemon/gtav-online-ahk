; Options (should be fine out of the box)
DoConfirmKill        := true  ; If true the KillGame action will ask for confirmation before killing the process
DoConfirmDisconnect  := true  ; If true the ForceDisconnect action will ask for confirmation before suspending the process
IntDisconnectDelay   := 10    ; Amount of seconds to freeze the process for, 10 works fine
IsVIPActivated       := false ; Initial status of CEO/VIP mode (after (re)loading script)
IsAFKActivated       := false ; Initial status of AFK mode (should always be false)
IsClickerActivated   := false ; Initial status of Clicker (should always be false)
DisableCapsOnAction  := true  ; Disable caps lock before executing macros, some macros might fail if caps lock is on


; Delays (you normally don't want to change these, you can try to play with these values if you have a slow/fast PC)
IntFocusDelay        := 100  ; delay (in ms) after focussing game when AHK-GUI took focus.
IntMenuDelay         := 120  ; delay (in ms) after opening interaction menu.
IntPhoneMenuDelay    := 1850 ; delay (in ms) after opening phone menu.
IntPhoneMenuDelay2   := 250  ; delay (in ms) after selecting phone menu entries.
IntPhoneScrollDelay  := 75   ; delay (in ms) between scrolls in the phone menu.
IntKeySendDelay      := 25   ; delay (in ms) delay between send key commands.
IntKeyPressDuration  := 5    ; duration (in ms) each key press is held down.


; In case you changed your ingame bindings:
IGB_Interaction := "m"
IGB_Phone := "up"
IGB_Pause := "p"