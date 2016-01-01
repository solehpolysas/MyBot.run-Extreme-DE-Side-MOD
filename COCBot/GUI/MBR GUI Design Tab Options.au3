; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design Options
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......:  lakereng
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

	$tabOptions = GUICtrlCreateTabItem("Options")

	;;;;;;;;;;;;;;;;;
    ;;; SIDE ATTACK
    ;;;;;;;;;;;;;;;;;
	Local $x = 30, $y = 150
            GUICtrlSetOnEvent(-1, "sldDeDistance")
	  $x = 30
	  $y = 150
	  $grpStatsMisc = GUICtrlCreateGroup("Smart Zap Drill", $x - 20, $y - 20, 445, 70)
		 GUICtrlCreateIcon($pIconLib, $eIcnLightSpell, $x, $y, 24, 24)
		 $chkSmartLightSpell = GUICtrlCreateCheckbox("Use Ligthning", $x +30, $y, -1, -1)
			$txtTip = "Check this to drop lightning spells on DE drills"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "SmartLightSpell")
		 $chkTrainLightSpell = GUICtrlCreateCheckbox("Auto train lighting spell", $x +30, $y +20, -1, -1)
			$txtTip = "Check this to always create spell lightning please set 0 lightnig spell on troops tab"
			GUICtrlSetTip(-1, $txtTip)
		$txtMinDark = GUICtrlCreateInput("1000", $x +120, $y, 35, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Input The Min Dark Elixer You Want To Drill Zap"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 4)
			GUICtrlSetOnEvent(-1, "txtMinDark")
			    GUICtrlSetState(-1, $GUI_DISABLE)

	Local $x = 30, $y = 130

	$grpStatuszap = GUICtrlCreateGroup("Status", $x + 210, $y +10, 205, 50)
		$y += 5
		$picSmartZap = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 285, $y + 25, 21, 21)
		$lblSmartZap = GUICtrlCreateLabel("0", $x+200, $y + 23, 80, 30, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
		$txtTip = "The amount of Dark Elixir you zapped."
	    GUICtrlSetTip(-1, $txtTip)
		GUICtrlCreateIcon($pIconLib, $eIcnLightSpell, $x + 375, $y + 25, 21, 21)
		$lblLightningUsed = GUICtrlCreateLabel("0", $x+310, $y + 23,60, 30, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
		$txtTip = "The amount of Lightning Spells Used in zapping."
	    GUICtrlSetTip(-1, $txtTip)

    ;;;;;;;;;;;;;;;;;
    ;;; TROOP Deployment
    ;;;;;;;;;;;;;;;;;
    Local $x = 10, $y = 200
	;For now, the order of the troop string MUST match tne Global Enum for troop deployments
	;The last entry should be $DeDeployEmptyString

    ;Troop string as an array
	;This order must exactly match the troops enum from MBR Global Variables.au3
    Local $aDeployTroopArray[29] = [GetTranslated(1,17,"Barbarians") _
	                               ,GetTranslated(1,18,"Archers") _
								   ,GetTranslated(1,19,"Giants") _
								   ,GetTranslated(1,20,"Goblins") _
								   ,GetTranslated(1,21,"Wall Breakers") _
								   ,GetTranslated(1,22,"Balloons") _
								   ,GetTranslated(1,23,"Wizards") _
								   ,GetTranslated(1,24,"Healers") _
								   ,GetTranslated(1,25,"Dragons") _
								   ,GetTranslated(1,26,"Pekkas") _
								   ,GetTranslated(1,48,"Minions") _
								   ,GetTranslated(1,49,"Hog Riders") _
								   ,GetTranslated(1,50,"Valkyries") _
								   ,GetTranslated(1,51,"Golems") _
								   ,GetTranslated(1,52,"Witches") _
								   ,GetTranslated(1,53,"Lava Hounds") _
								   ,GetTranslated(7,79,"King") _
								   ,GetTranslated(7,81,"Queen") _
								   ,GetTranslated(7,94,"Grand Warden") _
								   ,GetTranslated(7,70,"Clan Castle") _
								   ,GetTranslated(8,15,"Lightning Spell") _
								   ,GetTranslated(8,16,"Healing Spell") _
								   ,GetTranslated(8,17,"Rage Spell") _
								   ,GetTranslated(8,18,"Jump Spell") _
								   ,GetTranslated(8,19,"Freeze Spell") _
								   ,GetTranslated(8,20,"Poison Spell") _
								   ,GetTranslated(8,21,"EarthQuake Spell") _
								   ,GetTranslated(8,22,"Haste Spell") _
								   ,$DeDeployEmptyString]
    ; Convert the array into a string
    Local $troopString = _ArrayToString($aDeployTroopArray, "|")

  	$grpToolboxOptions = GUICtrlCreateGroup("Troop Deployment", $x, $y, 445, 300)

	$btnSave = GUICtrlCreateButton("Save", $x + 370, $y + 260, 60, 20 + 5)
		GUICtrlSetOnEvent(-1, "btnSave")
	$btnLoad = GUICtrlCreateButton("Load", $x + 300, $y + 260, 60, 20 + 5)
		GUICtrlSetOnEvent(-1, "btnLoad")
		;IF $btnColor then GUICtrlSetBkColor(-1, 0x5CAD85)
	    ;GUICtrlSetState(-1, $GUI_DISABLE)

    $y = $y + 15

    ; Troop Deploy Column 1
    $lbltxtWave1 = GUICtrlCreateLabel("#", $x+5, $y+5, -1, -1)
    $lbltxtDeployCol1 = GUICtrlCreateLabel("Deploy", $x+50, $y+5, -1, -1)
    $lbltxtStyleCol1 = GUICtrlCreateLabel("Position", $x+110, $y+5, -1, -1)

    $lbltxtWave01 = GUICtrlCreateLabel("01", $x+5, $y+25, -1, -1)
    $cmbDeDeploy01 = GUICtrlCreateCombo($DeDeployEmptyString, $x + 20, $y+25, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
    GUICtrlSetData(-1, $troopString)
    GUICtrlSetOnEvent(-1, "cmbDeDeploy01")
	$txtDeStyle01 = GUICtrlCreateInput("0", $x + 115, $y + 25, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetLimit(-1, 2)
    GUICtrlSetOnEvent(-1, "txtDeStyle01")

    $lbltxtWave02 = GUICtrlCreateLabel("02", $x+5, $y+50, -1, -1)
    $cmbDeDeploy02 = GUICtrlCreateCombo($DeDeployEmptyString, $x + 20, $y+50, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
    GUICtrlSetData(-1, $troopString)
    GUICtrlSetOnEvent(-1, "cmbDeDeploy02")
	$txtDeStyle02 = GUICtrlCreateInput("0", $x + 115, $y + 50, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetLimit(-1, 2)
    GUICtrlSetOnEvent(-1, "txtDeStyle02")

    $lbltxtWave03 = GUICtrlCreateLabel("03", $x+5, $y+75, -1, -1)
    $cmbDeDeploy03 = GUICtrlCreateCombo($DeDeployEmptyString, $x + 20, $y+75, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
    GUICtrlSetData(-1, $troopString)
    GUICtrlSetOnEvent(-1, "cmbDeDeploy03")
	$txtDeStyle03 = GUICtrlCreateInput("0", $x + 115, $y + 75, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetLimit(-1, 2)
    GUICtrlSetOnEvent(-1, "txtDeStyle03")

    $lbltxtWave04 = GUICtrlCreateLabel("04", $x+5, $y+100, -1, -1)
    $cmbDeDeploy04 = GUICtrlCreateCombo($DeDeployEmptyString, $x + 20, $y+100, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
    GUICtrlSetData(-1, $troopString)
    GUICtrlSetOnEvent(-1, "cmbDeDeploy04")
	$txtDeStyle04 = GUICtrlCreateInput("0", $x + 115, $y + 100, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetLimit(-1, 2)
    GUICtrlSetOnEvent(-1, "txtDeStyle04")

    $lbltxtWave05 = GUICtrlCreateLabel("05", $x+5, $y+125, -1, -1)
    $cmbDeDeploy05 = GUICtrlCreateCombo($DeDeployEmptyString, $x + 20, $y+125, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
    GUICtrlSetData(-1, $troopString)
    GUICtrlSetOnEvent(-1, "cmbDeDeploy05")
	$txtDeStyle05 = GUICtrlCreateInput("0", $x + 115, $y + 125, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetLimit(-1, 2)
    GUICtrlSetOnEvent(-1, "txtDeStyle05")

    $lbltxtWave06 = GUICtrlCreateLabel("06", $x+5, $y+150, -1, -1)
    $cmbDeDeploy06 = GUICtrlCreateCombo($DeDeployEmptyString, $x + 20, $y+150, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
    GUICtrlSetData(-1, $troopString)
    GUICtrlSetOnEvent(-1, "cmbDeDeploy06")
	$txtDeStyle06 = GUICtrlCreateInput("0", $x + 115, $y + 150, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetLimit(-1, 2)
    GUICtrlSetOnEvent(-1, "txtDeStyle06")

    $lbltxtWave07 = GUICtrlCreateLabel("07", $x+5, $y+175, -1, -1)
    $cmbDeDeploy07 = GUICtrlCreateCombo($DeDeployEmptyString, $x + 20, $y+175, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
    GUICtrlSetData(-1, $troopString)
    GUICtrlSetOnEvent(-1, "cmbDeDeploy07")
	$txtDeStyle07 = GUICtrlCreateInput("0", $x + 115, $y + 175, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetLimit(-1, 2)
    GUICtrlSetOnEvent(-1, "txtDeStyle07")

    $lbltxtWave08 = GUICtrlCreateLabel("08", $x+5, $y+200, -1, -1)
    $cmbDeDeploy08 = GUICtrlCreateCombo($DeDeployEmptyString, $x + 20, $y+200, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
    GUICtrlSetData(-1, $troopString)
    GUICtrlSetOnEvent(-1, "cmbDeDeploy08")
	$txtDeStyle08 = GUICtrlCreateInput("0", $x + 115, $y + 200, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetLimit(-1, 2)
    GUICtrlSetOnEvent(-1, "txtDeStyle08")

    ; Troop Deploy Column 2
    $lbltxtWaveCol2 = GUICtrlCreateLabel("#", $x+160, $y+5, -1, -1)
    $lbltxtDeployCol2 = GUICtrlCreateLabel("Deploy", $x+200, $y+5, -1, -1)
    $lbltxtStyleCol2 = GUICtrlCreateLabel("Position", $x+260, $y+5, -1, -1)

    $lbltxtWave09 = GUICtrlCreateLabel("09", $x+155, $y+25, -1, -1)
    $cmbDeDeploy09 = GUICtrlCreateCombo($DeDeployEmptyString, $x + 170, $y+25, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
    GUICtrlSetData(-1, $troopString)
    GUICtrlSetOnEvent(-1, "cmbDeDeploy09")
	$txtDeStyle09 = GUICtrlCreateInput("0", $x + 265, $y + 25, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetLimit(-1, 2)
    GUICtrlSetOnEvent(-1, "txtDeStyle09")

    $lbltxtWave10 = GUICtrlCreateLabel("10", $x+155, $y+50, -1, -1)
    $cmbDeDeploy10 = GUICtrlCreateCombo($DeDeployEmptyString, $x + 170, $y+50, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
    GUICtrlSetData(-1, $troopString)
    GUICtrlSetOnEvent(-1, "cmbDeDeploy10")
	$txtDeStyle10 = GUICtrlCreateInput("0", $x + 265, $y + 50, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetLimit(-1, 2)
    GUICtrlSetOnEvent(-1, "txtDeStyle10")

    $lbltxtWave11 = GUICtrlCreateLabel("11", $x+155, $y+75, -1, -1)
    $cmbDeDeploy11 = GUICtrlCreateCombo($DeDeployEmptyString, $x + 170, $y+75, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
    GUICtrlSetData(-1, $troopString)
    GUICtrlSetOnEvent(-1, "cmbDeDeploy11")
	$txtDeStyle11 = GUICtrlCreateInput("0", $x + 265, $y + 75, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetLimit(-1, 2)
    GUICtrlSetOnEvent(-1, "txtDeStyle11")

    $lbltxtWave12 = GUICtrlCreateLabel("12", $x+155, $y+100, -1, -1)
    $cmbDeDeploy12 = GUICtrlCreateCombo($DeDeployEmptyString, $x + 170, $y+100, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
    GUICtrlSetData(-1, $troopString)
    GUICtrlSetOnEvent(-1, "cmbDeDeploy12")
	$txtDeStyle12 = GUICtrlCreateInput("0", $x + 265, $y + 100, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetLimit(-1, 2)
    GUICtrlSetOnEvent(-1, "txtDeStyle12")

    $lbltxtWave13 = GUICtrlCreateLabel("13", $x+155, $y+125, -1, -1)
    $cmbDeDeploy13 = GUICtrlCreateCombo($DeDeployEmptyString, $x + 170, $y+125, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
    GUICtrlSetData(-1, $troopString)
    GUICtrlSetOnEvent(-1, "cmbDeDeploy13")
	$txtDeStyle13 = GUICtrlCreateInput("0", $x + 265, $y + 125, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetLimit(-1, 2)
    GUICtrlSetOnEvent(-1, "txtDeStyle13")

    $lbltxtWave14 = GUICtrlCreateLabel("14", $x+155, $y+150, -1, -1)
    $cmbDeDeploy14 = GUICtrlCreateCombo($DeDeployEmptyString, $x + 170, $y+150, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
    GUICtrlSetData(-1, $troopString)
    GUICtrlSetOnEvent(-1, "cmbDeDeploy14")
	$txtDeStyle14 = GUICtrlCreateInput("0", $x + 265, $y + 150, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetLimit(-1, 2)
    GUICtrlSetOnEvent(-1, "txtDeStyle14")

    $lbltxtWave15 = GUICtrlCreateLabel("15", $x+155, $y+175, -1, -1)
    $cmbDeDeploy15 = GUICtrlCreateCombo($DeDeployEmptyString, $x + 170, $y+175, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
    GUICtrlSetData(-1, $troopString)
    GUICtrlSetOnEvent(-1, "cmbDeDeploy15")
	$txtDeStyle15 = GUICtrlCreateInput("0", $x + 265, $y + 175, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetLimit(-1, 2)
    GUICtrlSetOnEvent(-1, "txtDeStyle15")

    $lbltxtWave16 = GUICtrlCreateLabel("16", $x+155, $y+200, -1, -1)
    $cmbDeDeploy16 = GUICtrlCreateCombo($DeDeployEmptyString, $x + 170, $y+200, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
    GUICtrlSetData(-1, $troopString)
    GUICtrlSetOnEvent(-1, "cmbDeDeploy16")
	$txtDeStyle16 = GUICtrlCreateInput("0", $x + 265, $y + 200, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetLimit(-1, 2)
    GUICtrlSetOnEvent(-1, "txtDeStyle16")

    ; Troop Deploy Column 3
    $lbltxtWave3 = GUICtrlCreateLabel("#", $x+310, $y+5, -1, -1)
    $lbltxtDeployCol3 = GUICtrlCreateLabel("Deploy", $x+345, $y+5, -1, -1)
    $lbltxtStyleCol3 = GUICtrlCreateLabel("Position", $x+405, $y+5, -1, -1)

    $lbltxtWave17 = GUICtrlCreateLabel("17", $x+305, $y+25, -1, -1)
    $cmbDeDeploy17 = GUICtrlCreateCombo($DeDeployEmptyString, $x + 320, $y+25, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
    GUICtrlSetData(-1, $troopString)
    GUICtrlSetOnEvent(-1, "cmbDeDeploy17")
	$txtDeStyle17 = GUICtrlCreateInput("0", $x + 415, $y + 25, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetLimit(-1, 2)
    GUICtrlSetOnEvent(-1, "txtDeStyle17")

    $lbltxtWave18 = GUICtrlCreateLabel("18", $x+305, $y+50, -1, -1)
    $cmbDeDeploy18 = GUICtrlCreateCombo($DeDeployEmptyString, $x + 320, $y+50, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
    GUICtrlSetData(-1, $troopString)
    GUICtrlSetOnEvent(-1, "cmbDeDeploy18")
	$txtDeStyle18 = GUICtrlCreateInput("0", $x + 415, $y + 50, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetLimit(-1, 2)
    GUICtrlSetOnEvent(-1, "txtDeStyle18")

    $lbltxtWave19 = GUICtrlCreateLabel("19", $x+305, $y+75, -1, -1)
    $cmbDeDeploy19 = GUICtrlCreateCombo($DeDeployEmptyString, $x + 320, $y+75, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
    GUICtrlSetData(-1, $troopString)
    GUICtrlSetOnEvent(-1, "cmbDeDeploy19")
	$txtDeStyle19 = GUICtrlCreateInput("0", $x + 415, $y + 75, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetLimit(-1, 2)
    GUICtrlSetOnEvent(-1, "txtDeStyle19")

    $lbltxtWave20 = GUICtrlCreateLabel("20", $x+305, $y+100, -1, -1)
    $cmbDeDeploy20 = GUICtrlCreateCombo($DeDeployEmptyString, $x + 320, $y+100, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
    GUICtrlSetData(-1, $troopString)
    GUICtrlSetOnEvent(-1, "cmbDeDeploy20")
	$txtDeStyle20 = GUICtrlCreateInput("0", $x + 415, $y + 100, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetLimit(-1, 2)
    GUICtrlSetOnEvent(-1, "txtDeStyle20")

    $lbltxtWave21 = GUICtrlCreateLabel("21", $x+305, $y+125, -1, -1)
    $cmbDeDeploy21 = GUICtrlCreateCombo($DeDeployEmptyString, $x + 320, $y+125, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
    GUICtrlSetData(-1, $troopString)
    GUICtrlSetOnEvent(-1, "cmbDeDeploy21")
	$txtDeStyle21 = GUICtrlCreateInput("0", $x + 415, $y + 125, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetLimit(-1, 2)
    GUICtrlSetOnEvent(-1, "txtDeStyle21")

    $lbltxtWave22 = GUICtrlCreateLabel("22", $x+305, $y+150, -1, -1)
    $cmbDeDeploy22 = GUICtrlCreateCombo($DeDeployEmptyString, $x + 320, $y+150, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
    GUICtrlSetData(-1, $troopString)
    GUICtrlSetOnEvent(-1, "cmbDeDeploy22")
	$txtDeStyle22 = GUICtrlCreateInput("0", $x + 415, $y + 150, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetLimit(-1, 2)
    GUICtrlSetOnEvent(-1, "txtDeStyle22")

    $lbltxtWave23 = GUICtrlCreateLabel("23", $x+305, $y+175, -1, -1)
    $cmbDeDeploy23 = GUICtrlCreateCombo($DeDeployEmptyString, $x + 320, $y+175, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
    GUICtrlSetData(-1, $troopString)
    GUICtrlSetOnEvent(-1, "cmbDeDeploy23")
	$txtDeStyle23 = GUICtrlCreateInput("0", $x + 415, $y + 175, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetLimit(-1, 2)
    GUICtrlSetOnEvent(-1, "txtDeStyle23")

    $lbltxtWave24 = GUICtrlCreateLabel("24", $x+305, $y+200, -1, -1)
    $cmbDeDeploy24 = GUICtrlCreateCombo($DeDeployEmptyString, $x + 320, $y+200, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
    GUICtrlSetData(-1, $troopString)
    GUICtrlSetOnEvent(-1, "cmbDeDeploy24")
	$txtDeStyle24 = GUICtrlCreateInput("0", $x + 415, $y + 200, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetLimit(-1, 2)
    GUICtrlSetOnEvent(-1, "txtDeStyle24")

	GUICtrlCreateGroup("", -99, -99, 1, 1)

