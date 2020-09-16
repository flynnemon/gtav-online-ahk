#NoEnv
SetWorkingDir %A_ScriptDir%
CoordMode, ToolTip, Screen
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
sendmode, input
#SingleInstance Off
SetTitleMatchMode 2
SetControlDelay 1
SetWinDelay 0
SetKeyDelay -1
SetMouseDelay -1
SetBatchLines -1
 
CD := GCD(A_ScreenWidth, A_ScreenHeight)
XRatio := Round(A_ScreenWidth / CD)
YRatio := Round(A_ScreenHeight / CD)
 
If XRatio / YRatio >= 4
{
    ScreenWidthCalc := Round(A_ScreenWidth / 3)
   
    XP1 := (ScreenWidthCalc / 6) + ScreenWidthCalc
    XP2 := (ScreenWidthCalc / 2) + ScreenWidthCalc
 
    XK1 := (ScreenWidthCalc / 6) + ScreenWidthCalc
    XK2 := (ScreenWidthCalc - (ScreenWidthCalc / 3)) + ScreenWidthCalc
   
    X := (ScreenWidthCalc / 2) + ScreenWidthCalc
    Z := (ScreenWidthCalc - (ScreenWidthCalc / 4)) + ScreenWidthCalc
}
Else
{
    ScreenWidthCalc := A_ScreenWidth
   
    XP1 := A_ScreenWidth / 6
    XP2 := A_ScreenWidth / 2
 
    XK1 := A_ScreenWidth / 6
    XK2 := A_ScreenWidth - (A_ScreenWidth / 3)
   
    X := A_ScreenWidth / 2
    Z := A_ScreenWidth - (A_ScreenWidth / 4)
}
 
YP1 := A_ScreenHeight / 6
YP2 := A_ScreenHeight - (A_ScreenHeight / 6)
 
YK1 := A_ScreenHeight / 6
YK2 := A_ScreenHeight - (A_ScreenHeight / 6)
 
Y := A_ScreenHeight / 6
 
IfNotExist, %A_ScriptDir%\%ScreenWidthCalc%x%A_ScreenHeight%\1.bmp
{
ToolTip , Unsuported Resolution, 1, 1, 17
Sleep, 4000
ToolTip , Exiting script, 1, 1, 17
Sleep, 4000
Exitapp
}
 
Loop
{
ToolTip , Script idle %A_ScreenWidth%x%A_ScreenHeight%, 1, 1, 17
Sleep, 5000
}
 
^R::
{
Run %A_ScriptDir%\Casino Solver.ahk
Exitapp
}
 
^T::Exitapp
 
^E::
Loop
{  
    ImageSearch,,, %X%, 0, %Z%, %Y%, *transBlack *50 %A_ScriptDir%\%ScreenWidthCalc%x%A_ScreenHeight%\print.bmp
    If ErrorLevel = 0
    {
        ToolTip , FPS Minigame, 1, 1, 17
        Pmatch(XP1, YP1, XP2, YP2, ScreenWidthCalc)
    }
    Else
    {
        ImageSearch,,, %X%, 0, %Z%, %Y%, *transBlack *50 %A_ScriptDir%\%ScreenWidthCalc%x%A_ScreenHeight%\keypad.bmp
        If ErrorLevel = 0
        {
            ToolTip , KC Minigame, 1, 1, 17
            Kmatch(XK1, YK1, XK2, YK2, ScreenWidthCalc)
        }
    Else
    {
        Clear()
        ToolTip , Hack not found, 1, 1, 17
    }
    }  
}
Return
 
Pmatch(XP1, YP1, XP2, YP2, ScreenWidthCalc)
{
    C := ScreenWidthCalc / 40
    N := 0
    Loop 16
    {
        N := N+1
        ImageSearch, FoundX, FoundY, %XP1%, %YP1%, %XP2%, %YP2%, *transBlack *50 %A_ScriptDir%\%ScreenWidthCalc%x%A_ScreenHeight%\%N%.bmp
        ;ToolTip ,%N%, FoundX, FoundY,%N%
        If (ErrorLevel = 0)
        {
            M := 0
            Loop
            {  
                ImageSearch, FoundCX, FoundCY, %XP1%, %YP1%, %XP2%, %YP2%, *transBlack *220 %A_ScriptDir%\%ScreenWidthCalc%x%A_ScreenHeight%\cursor.bmp
                FoundCX := FoundCX + 20
                FoundCY := FoundCY + 20
                ;X := (Abs(FoundCX-FoundX))
                ;Y := (Abs(FoundCY-FoundY))
                ;ToolTip , x, FoundCX, FoundCY-20,18
                ;ToolTip ,%X%x%FoundCX%, 0, 20,19
                ;ToolTip ,%Y%x%FoundCY%, 0, 40,20
                ;ToolTip ,x%C%, 0, 60,18
                If (ErrorLevel = 0)
                {  
                   
                    If (FoundX > FoundCX) && (Abs(FoundX-FoundCX) > C)
                    {  
                        Send {Right down}
                        Sleep 50
                        Send {Right up}
                        ;SoundBeep, 500, 500
                        Sleep, 10
                    }
                    Else
                    {
                        If (FoundX < FoundCX) && (Abs(FoundX-FoundCX) > C)
                        {  
                            Send {Left down}
                            Sleep 50
                            Send {Left up}
                            ;SoundBeep, 500, 500
                            Sleep, 10
                        }
                    }
                   
                    If (FoundY > FoundCY) && (Abs(FoundY-FoundCY) > C)
                    {
                        Send {Down down}
                        Sleep 50
                        Send {Down up}
                        ;SoundBeep, 500, 500
                        Sleep, 10
                    }
                    Else
                    {
                       
                        If (FoundY < FoundCY) && (Abs(FoundY-FoundCY) > C)
                        {
                            Send {Up down}
                            Sleep 50
                            Send {Up up}
                            ;SoundBeep, 500, 500
                            Sleep, 10
                        }
                    }                      
                    Sleep, 10
                    }
            } Until (Abs(FoundY-FoundCY) < C) && (Abs(FoundX-FoundCX) < C)
            If (Abs(FoundY-FoundCY) < C) && (Abs(FoundX-FoundCX) < C)
            {
            Send {Enter down}
            Sleep 50
            Send {Enter up}
            ;SoundBeep, 1000, 500
            Sleep, 10
            M := M+1
            }  
        }
        Else
        {
            ToolTip ,, FoundX, FoundY,%N%
        }
    }
}
 
Kmatch(XK1, YK1, XK2, YK2, ScreenWidthCalc)
{
    N := 0
    Loop 6
    {
    N := N+1
    ImageSearch, FoundX, FoundY, %XK1%, %YK1%, %XK2%, %YK2%, *transBlack *180 %A_ScriptDir%\%ScreenWidthCalc%x%A_ScreenHeight%\key.bmp
        If ErrorLevel = 0
    {
        ToolTip , Match%N%, FoundX, FoundY,%N%
    }
    }
}
 
Clear()
{
    N := 0
    Loop 16
    {
    N := N+1
    ToolTip,,,,%N%
    }
}
 
GCD(a, b) {
    while b
        b := Mod(a | 0x0, a := b)
    return a
}