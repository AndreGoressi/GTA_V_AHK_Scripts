#Include Script_Base.ahk
#Include Configuration.ahk

WindowName := "Grand Theft Auto V"
; --- AUTO-EXIT SETUP ---
SetTimer(CheckGameStatus, 1000) ; 

Toggle := false

CheckGameStatus() {
    global WindowName
    ;//
    ; Modify hotkeys ONLY in "".
    Hotkey("~$numpad0", AmmoBuy) ; Numpad 0 buys ammo
    Hotkey("~$^mbutton", PersonalVehicleCall) ; Ctrl + Mouse Wheel
    Hotkey("~$^e", BSTBuy) ; Ctrl + E
    Hotkey("~$^q", ArmorBuy) ; Ctrl + Q
    Hotkey("~$^del", AFK) ; Ctrl + Del

    AmmoBuy(Hotkey) {
        if (!Active()) {
            return
        }
        Send("{" . KeyBindUnarmed . " down}")
        ExactSleep(50)
        Send("{" . KeyBindUnarmed . " up}")
        ExactSleep(50)
        Send("{" . KeyBindInteractionMenu . " down}")
        ExactSleep(50)
        Send("{" . KeyBindInteractionMenu . " up}")
        ExactSleep(50)
        loop (4) {
            Send("{" . KeyBindDownArrow . " down}")
            ExactSleep(50)
            Send("{" . KeyBindDownArrow . " up}")
            ExactSleep(50)
        }
        loop (2) {
            Send("{" . KeyBindEnter . " down}")
            ExactSleep(50)
            Send("{" . KeyBindEnter . " up}")
            ExactSleep(50)
        }
        ExactSleep(200)
        Send("{" . KeybindLeftArrow . " down}")
        ExactSleep(50)
        Send("{" . KeybindLeftArrow . " up}")
        ExactSleep(50)
        Send("{" . KeyBindDownArrow . " down}")
        ExactSleep(50)
        Send("{" . KeyBindDownArrow . " up}")
        ExactSleep(50)
        Send("{" . KeyBindEnter . " down}")
        ExactSleep(50)
        Send("{" . KeyBindEnter . " up}")
        ExactSleep(50)
        Send("{" . KeyBindInteractionMenu . " down}")
        ExactSleep(50)
        Send("{" . KeyBindInteractionMenu . " up}")
    }

    PersonalVehicleCall(Hotkey) {
        if (!Active()) {
            return
        }
        Send("{" . KeyBindInteractionMenu . " down}")
        ExactSleep(50)
        Send("{" . KeyBindInteractionMenu . " up}")
        ExactSleep(100)
        loop (2) {
            Send("{" . KeyBindDownArrow . " down}")
            ExactSleep(50)
            Send("{" . KeyBindDownArrow . " up}")
            ExactSleep(50)
        }
        loop (2) {
            Send("{" . KeyBindEnter . " down}")
            ExactSleep(50)
            Send("{" . KeyBindEnter . " up}")
            ExactSleep(50)
        }
        Send("{" . KeyBindInteractionMenu . " down}")
        ExactSleep(50)
        Send("{" . KeyBindInteractionMenu . " up}")
    }

    BSTBuy(Hotkey) {
        if (!Active()) {
            return
        }
        Send("{" . KeyBindInteractionMenu . " down}")
        ExactSleep(50)
        Send("{" . KeyBindInteractionMenu . " up}")
        ExactSleep(100)
        Send("{" . KeyBindEnter . " down}")
        ExactSleep(50)
        Send("{" . KeyBindEnter . " up}")
        ExactSleep(50)
        loop (4) {
            Send("{" . KeyBindDownArrow . " down}")
            ExactSleep(50)
            Send("{" . KeyBindDownArrow . " up}")
            ExactSleep(50)
        }
        Send("{" . KeyBindEnter . " down}")
        ExactSleep(50)
        Send("{" . KeyBindEnter . " up}")
        ExactSleep(50)
        Send("{" . KeyBindDownArrow . " down}")
        ExactSleep(50)
        Send("{" . KeyBindDownArrow . " up}")
        ExactSleep(50)
        Send("{" . KeyBindEnter . " down}")
        ExactSleep(50)
        Send("{" . KeyBindEnter . " up}")
        ExactSleep(50)
    }

    ArmorBuy(Hotkey) {
        if (!Active()) {
            return
        }
        Send("{" . KeyBindInteractionMenu . " down}")
        ExactSleep(50)
        Send("{" . KeyBindInteractionMenu . " up}")
        ExactSleep(100)
        Send("{" . KeyBindEnter . " down}")
        ExactSleep(50)
        Send("{" . KeyBindEnter . " up}")
        ExactSleep(50)
        loop (4) {
            Send("{" . KeyBindDownArrow . " down}")
            ExactSleep(50)
            Send("{" . KeyBindDownArrow . " up}")
            ExactSleep(50)
        }
        Send("{" . KeyBindEnter . " down}")
        ExactSleep(50)
        Send("{" . KeyBindEnter . " up}")
        ExactSleep(50)
        loop (3) {
            Send("{" . KeyBindDownArrow . " down}")
            ExactSleep(50)
            Send("{" . KeyBindDownArrow . " up}")
            ExactSleep(50)
        }
        Send("{" . KeyBindEnter . " down}")
        ExactSleep(50)
        Send("{" . KeyBindEnter . " up}")
        ExactSleep(50)
    }

    ;Toggle := false
    AFK(Hotkey) {
        global Toggle ; Access the global Toggle variable
        Toggle := !Toggle ; Toggle the loop on/off

        if (Toggle) {
            ; Start the loop
            while (Toggle) { ; Loop as long as Toggle is true
                if (!Active()) {
                    return
                }
                Send("{" . KeyBindMoveLeft . " down}")
                ExactSleep(500)
                Send("{" . KeyBindMoveLeft . " up}")
                ExactSleep(500)
                Send("{" . KeyBindMoveRight . " down}")
                ExactSleep(500)
                Send("{" . KeyBindMoveRight . " up}")
                ExactSleep(500)
            }
        } else {
            ; Toggle is false, so the loop will exit naturally
        }
    }
    if !WinExist(WindowName) {
        ExitApp()
    }
}
