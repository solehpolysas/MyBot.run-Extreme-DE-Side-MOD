; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design Options
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......: solehpolysas a.k.a Rizor
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

	$tabExtra = GUICtrlCreateTabItem("Extra")

;Gready SWT
	Local $x = 30, $y = 150
	$grpOnGready = GUICtrlCreateGroup(GetTranslated(10,2, "Greedy Option"), $x - 20, $y - 20, 450, 65)
	$chkSWTGreedy = GUICtrlCreateCheckbox("Activate Greedy in SWT Only", $x-10, $y, -1, -1)
		$txtTip = "Check if you want activate greedy when bot Snipe While Train."
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetState(-1, $GUI_CHECKED)
	$y += 22
;Gready Snipe Combo top
	$chkGreedy = GUICtrlCreateCheckbox("Activate Greedy in Snipe Combo", $x - 10 , $y, -1, -1)
	$txtTip = "Check if you want activate greedy in Snipe Combo."
	GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetState(-1, $GUI_CHECKED)
	$y += 22
;Gready Snipe Combo bottom

;Skip Function Top
Local $x = 30, $y = 220
	$grpSkip = GUICtrlCreateGroup("Skip Functions", $x - 20, $y - 20, 450, 75)
	$chkSkipActive = GUICtrlCreateCheckbox("When Camps are", $x - 10, $y, -1, -1)
	GUICtrlSetOnEvent(-1, "chkSkipActive")

	$txtSkipHowMuch = GUICtrlCreateInput("90", $x + 85, $y, 35, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
		GUICtrlSetLimit(-1, 2)
	$lblSkipFunctionSec = GUICtrlCreateLabel("% Full :", $x + 122, $y + 3, -1, -1)

	$chkSkipCollect = GUICtrlCreateCheckbox("Collect", $x + 160, $y - 10 , -1, -1)
	$chkSkipTombstones = GUICtrlCreateCheckbox("Tombstones", $x + 160, $y + 8 , -1, -1)
	$chkSkipRearm = GUICtrlCreateCheckbox("Rearm", $x + 160, $y + 26 , -1, -1)

	$chkSkipLab = GUICtrlCreateCheckbox("Lab Upgrades", $x + 250, $y - 10 , -1, -1)
	$chkSkipWall = GUICtrlCreateCheckbox("Wall Upgrades", $x + 250, $y + 8 , -1, -1)
	$chkSkipBuilding = GUICtrlCreateCheckbox("Building Upgrades", $x + 250, $y + 26 , -1, -1)

	$chkSkipDonate = GUICtrlCreateCheckbox("Donate", $x + 350, $y - 10 , -1, -1)

	GUICtrlCreateGroup("", -99, -99, 1, 1)
;Skip Function Bottom

GUICtrlCreateTabItem("")
