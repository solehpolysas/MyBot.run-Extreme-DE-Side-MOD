; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Controls Options
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

;MBR GUI_OPTIONS CONTROLS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  Func SmartLightSpell()
	If GUICtrlRead($chkSmartLightSpell) = $GUI_CHECKED Then
		GUICtrlSetState($txtMinDark, $GUI_ENABLE)
		GUICtrlSetState($chkTrainLightSpell, $GUI_ENABLE)
		$ichkSmartLightSpell = 1
	Else
		GUICtrlSetState($txtMinDark, $GUI_DISABLE)
		GUICtrlSetState($chkTrainLightSpell, $GUI_DISABLE)
		GUICtrlSetState($chkTrainLightSpell, $GUI_UNCHECKED)
		$ichkSmartLightSpell = 0

	EndIf
 EndFunc   ;==>GUILightSpell

Func autoLightSpell()
	If GUICtrlRead($chkTrainLightSpell) = $GUI_CHECKED Then
	  $ichkTrainLightSpell = 1
	  Else
      $ichkTrainLightSpell = 0
    EndIf

EndFunc


  Func DrillZapTH()
    If GUICtrlRead($chkDrillZapTH) = 1 Then
	  DEDropSmartSpell()
   ElseIf GUICtrlRead($chkDrillZapTH) = 0 Then
	  Return False
   EndIf
EndFunc
Func txtMinDark()
$itxtMinDark = GUICtrlRead($txtMinDark)
IniWrite($config, "options", "txtMinDark", $itxtMinDark)
EndFunc

Func cmbDeDeploy01()
   cmbDeDeploy("01")
EndFunc
Func cmbDeDeploy02()
   cmbDeDeploy("02")
EndFunc
Func cmbDeDeploy03()
   cmbDeDeploy("03")
EndFunc
Func cmbDeDeploy04()
   cmbDeDeploy("04")
EndFunc
Func cmbDeDeploy05()
   cmbDeDeploy("05")
EndFunc
Func cmbDeDeploy06()
   cmbDeDeploy("06")
EndFunc
Func cmbDeDeploy07()
   cmbDeDeploy("07")
EndFunc
Func cmbDeDeploy08()
   cmbDeDeploy("08")
EndFunc
Func cmbDeDeploy09()
   cmbDeDeploy("09")
EndFunc
Func cmbDeDeploy10()
   cmbDeDeploy("10")
EndFunc
Func cmbDeDeploy11()
   cmbDeDeploy("11")
EndFunc
Func cmbDeDeploy12()
   cmbDeDeploy("12")
EndFunc
Func cmbDeDeploy13()
   cmbDeDeploy("13")
EndFunc
Func cmbDeDeploy14()
   cmbDeDeploy("14")
EndFunc
Func cmbDeDeploy15()
   cmbDeDeploy("15")
EndFunc
Func cmbDeDeploy16()
   cmbDeDeploy("16")
EndFunc
Func cmbDeDeploy17()
   cmbDeDeploy("17")
EndFunc
Func cmbDeDeploy18()
   cmbDeDeploy("18")
EndFunc
Func cmbDeDeploy19()
   cmbDeDeploy("19")
EndFunc
Func cmbDeDeploy20()
   cmbDeDeploy("20")
EndFunc
Func cmbDeDeploy21()
   cmbDeDeploy("21")
EndFunc
Func cmbDeDeploy22()
   cmbDeDeploy("22")
EndFunc
Func cmbDeDeploy23()
   cmbDeDeploy("23")
EndFunc
Func cmbDeDeploy24()
   cmbDeDeploy("24")
EndFunc
Func txtDeStyle01()
   txtDeStyle("01")
EndFunc
Func txtDeStyle02()
   txtDeStyle("02")
EndFunc
Func txtDeStyle03()
   txtDeStyle("03")
EndFunc
Func txtDeStyle04()
   txtDeStyle("04")
EndFunc
Func txtDeStyle05()
   txtDeStyle("05")
EndFunc
Func txtDeStyle06()
   txtDeStyle("06")
EndFunc
Func txtDeStyle07()
   txtDeStyle("07")
EndFunc
Func txtDeStyle08()
   txtDeStyle("08")
EndFunc
Func txtDeStyle09()
   txtDeStyle("09")
EndFunc
Func txtDeStyle10()
   txtDeStyle("10")
EndFunc
Func txtDeStyle11()
   txtDeStyle("11")
EndFunc
Func txtDeStyle12()
   txtDeStyle("12")
EndFunc
Func txtDeStyle13()
   txtDeStyle("13")
EndFunc
Func txtDeStyle14()
   txtDeStyle("14")
EndFunc
Func txtDeStyle15()
   txtDeStyle("15")
EndFunc
Func txtDeStyle16()
   txtDeStyle("16")
EndFunc
Func txtDeStyle17()
   txtDeStyle("17")
EndFunc
Func txtDeStyle18()
   txtDeStyle("18")
EndFunc
Func txtDeStyle19()
   txtDeStyle("19")
EndFunc
Func txtDeStyle20()
   txtDeStyle("20")
EndFunc
Func txtDeStyle21()
   txtDeStyle("21")
EndFunc
Func txtDeStyle22()
   txtDeStyle("22")
EndFunc
Func txtDeStyle23()
   txtDeStyle("23")
EndFunc
Func txtDeStyle24()
   txtDeStyle("24")
EndFunc

Func cmbDeDeploy($troopSlot)
   If GUICtrlRead(@GUI_CtrlId) <> $DeDeployEmptyString Then
      $DeDeployType[$troopSlot - 1] = _GUICtrlComboBox_GetCurSel(@GUI_CtrlId) - 1
   Else
	  $DeDeployType[$troopSlot - 1] = $DeDeployEmptyString
   EndIf
EndFunc   ;==>cmbDeDeploy

Func txtDeStyle($troopSlot)
	local $inputValue = StringUpper(GUICtrlRead(@GUI_CtrlId))
	IF StringRight($inputValue,1) = "R" OR StringRight($inputValue,1) = "L" Then
		If $DeDeployType[$troopSlot - 1] = $DeDeployEmptyString Then
			$DeDeployPosition[$troopSlot - 1] = String(number($inputValue))
		ElseIf 	Number($DeDeployType[$troopSlot - 1])  >= 20 Then
			if StringLen($inputValue) > 1 Then
				$DeDeployPosition[$troopSlot - 1] = String(number(StringLeft($inputValue,StringLen($inputValue)-1))) & StringRight($inputValue,1)
			Else
				$DeDeployPosition[$troopSlot - 1] = $inputValue
			EndIf
		Else
			$DeDeployPosition[$troopSlot - 1] = StringRight($inputValue,1)
		EndIf
	Else
		$DeDeployPosition[$troopSlot - 1] = String(number($inputValue))
	EndIf
	GUICtrlSetData( @GUI_CtrlId, $DeDeployPosition[$troopSlot - 1])
    ;$DeDeployPosition[$troopSlot - 1] = GUICtrlRead(@GUI_CtrlId)
EndFunc   ;==>cmbDeDeploy

Func TroopNumberToEnum($TroopEnumValue)
Switch $TroopEnumValue
CASE 0
   return "$eBarb"
CASE 1
   return "$eArch"
CASE 2
   return "$eGiant"
CASE 3
   return "$eGobl"
CASE 4
   return "$eWall"
CASE 5
   return "$eBall"
CASE 6
   return "$eWiza"
CASE 7
   return "$eHeal"
CASE 8
   return "$eDrag"
CASE 9
   return "$ePekk"
CASE 10
   return "$eMini"
CASE 11
   return "$eHogs"
CASE 12
   return "$eValk"
CASE 13
   return "$eGole"
CASE 14
   return "$eWitc"
CASE 15
   return "$eLava"
CASE 16
   return "$eKing"
CASE 17
   return "$eQueen"
CASE 18
   return "$eWarden"
CASE 19
   return "$eCastle"
CASE 20
   return "$eLSpell"
CASE 21
   return "$eHSpell"
CASE 22
   return "$eRSpell"
CASE 23
   return "$eJSpell"
CASE 24
   return "$eFSpell"
CASE 25
   return "$ePSpell"
CASE 26
   return "$eESpell"
CASE 27
   return "$eHaSpell"
CASE Else
   return $TroopEnumValue
EndSwitch
EndFunc ;==> TroopNumberToEnum

Func TroopEnumToNumber($TroopEnumString)
;MsgBox($MB_SYSTEMMODAL, "", $TroopEnumString)
Switch $TroopEnumString
CASE "$eBarb"
   return "0" ; doesn't work if the function returns numeric 0
CASE "$eArch"
   return 1
CASE "$eGiant"
   return 2
CASE "$eGobl"
   return 3
CASE "$eWall"
   return 4
CASE "$eBall"
   return 5
CASE "$eWiza"
   return 6
CASE "$eHeal"
   return 7
CASE "$eDrag"
   return 8
CASE "$ePekk"
   return 9
CASE "$eMini"
   return 10
CASE "$eHogs"
   return 11
CASE "$eValk"
   return 12
CASE "$eGole"
   return 13
CASE "$eWitc"
   return 14
CASE "$eLava"
   return 15
CASE "$eKing"
   return 16
CASE "$eQueen"
   return 17
CASE "$eWarden"
   return 18
CASE "$eCastle"
   return 19
CASE "$eLSpell"
   return 20
CASE "$eHSpell"
   return 21
CASE "$eRSpell"
   return 22
CASE "$eJSpell"
   return 23
CASE "$eFSpell"
   return 24
CASE "$ePSpell"
   return 25
CASE "$eESpell"
   return 26
CASE "$eHaSpell"
   return 27
EndSwitch
EndFunc ;==> TroopEnumToNumber

Func btnLoad()
   ; Create a constant variable in Local scope of the message to display in FileOpenDialog.
    Local Const $sMessage = "Select the deployment file to load."

    ; Display an open dialog to select a list of file(s).
    Local $loadFileName = FileOpenDialog($sMessage, "..\SideAttack", "csv (*.csv)", $FD_FILEMUSTEXIST )
    If @error Then
        ; Display the error message.
        MsgBox($MB_SYSTEMMODAL, "", "No file was selected.")
        Return
    Else
        ;MsgBox($MB_SYSTEMMODAL, "", "Loading deployment file:" & @CRLF & $loadFileName)
	EndIf

    Local $loadFile = FileOpen($loadFileName, 0)
	If $loadFile = -1 Then
       MsgBox(0, "error", "File doesn't exist or can't be read")
       Return
    EndIf

   ;Ignore headers
   Local $line = FileReadLine($loadFile)

	; Read in lines of text until the EOF is reached
	Local $lineNumber = 0
   While 1
      Local $line = FileReadLine($loadFile)
      If @error = -1 Or $lineNumber > 23 Then ExitLoop
	  $input = StringSplit($line, ",")
	  If StringIsDigit($input[1]) Or $input[1] = $DeDeployEmptyString Then
		 $DeDeployType[$lineNumber] = $input[1]
	  Else
		 $DeDeployType[$lineNumber] = TroopEnumToNumber($input[1])
		 ;$DeDeployType[$lineNumber] = $DeDeployEmptyString
	  EndIf
	  $DeDeployPosition[$lineNumber] = $input[2]
	  $lineNumber = $lineNumber +1
   WEnd
   While $lineNumber <= 23
      $DeDeployType[$lineNumber] = $DeDeployEmptyString
	  $DeDeployPosition[$lineNumber] = 0
	  $lineNumber = $lineNumber +1
   Wend

   FileClose($loadFile)

   For $i = 1 to 24
	 GUICtrlSetData(Eval("txtDeStyle" & StringRight("0" & $i,2)), $DeDeployPosition[$i-1])
	 If $DeDeployType[$i-1] <> $DeDeployEmptyString Then
		 _GUICtrlComboBox_SetCurSel(Eval("cmbDeDeploy" & StringRight("0" & $i,2)), $DeDeployType[$i-1]+1)
	  Else
		 _GUICtrlComboBox_SetCurSel(Eval("cmbDeDeploy" & StringRight("0" & $i,2)), $DeDeployEmptyString)
	  EndIf
    Next

EndFunc
Func btnSave()
    ; Create a constant variable in Local scope of the message to display in FileSaveDialog.
    Local Const $sMessage = "Choose a filename."

    ; Display a save dialog to select a file.
    Local $saveFileName = FileSaveDialog($sMessage, "..\SideAttack", "csv (*.csv)", $FD_PATHMUSTEXIST)
    If @error Then
        ; Display the error message.
        MsgBox($MB_SYSTEMMODAL, "", "No file was saved.")
    Else

       ; Retrieve the filename from the filepath e.g. Example.au3.
        Local $sFileName = StringTrimLeft($saveFileName, StringInStr($saveFileName, "\", $STR_NOCASESENSE, -1))

        ; Check if the extension .au3 is appended to the end of the filename.
        Local $iExtension = StringInStr($sFileName, ".", $STR_NOCASESENSE)

        ; If a period (dot) is found then check whether or not the extension is equal to .au3.
        If $iExtension Then
            ; If the extension isn't equal to .au3 then append to the end of the filepath.
            If Not (StringTrimLeft($sFileName, $iExtension - 1) = ".csv") Then $saveFileName &= ".csv"
        Else
            ; If no period (dot) was found then append to the end of the file.
            $saveFileName &= ".csv"
        EndIf

        ; Display the saved file.
        MsgBox($MB_SYSTEMMODAL, "", "You saved the following file:" & @CRLF & $saveFileName)

		FileDelete($saveFileName)

		FileWrite($saveFileName,"DeDeployType,DeDeployPosition")

		For $i = 0 to 23
		   If $DeDeployType[$i] = $DeDeployEmptyString Then
		      FileWrite($saveFileName, '' & @CRLF & $DeDeployEmptyString & "," & $DeDeployPosition[$i])
		   Else
		      FileWrite($saveFileName, '' & @CRLF & TroopNumberToEnum($DeDeployType[$i]) & "," & $DeDeployPosition[$i])
		   EndIf
	    Next

		FileClose($saveFileName)

    EndIf
EndFunc

Func txtAPIKey()
   $stxtAPIKey  = GUICtrlRead($txtAPIKey)
   IniWrite($config, "Stats", "txtAPIKey", $stxtAPIKey)
   $MyApiKey = $stxtAPIKey
EndFunc ;==> txtAPIKey

 Func chkCoCStats()
   If GUICtrlRead($chkCoCStats) = $GUI_CHECKED Then
	  $ichkCoCStats = 1
	  GUICtrlSetState($txtAPIKey, $GUI_ENABLE)
   Else
	  $ichkCoCStats = 0
	  GUICtrlSetState($txtAPIKey, $GUI_DISABLE)
EndIf
IniWrite($config, "Stats", "chkCoCStats",$ichkCoCStats)
EndFunc ;==> chkCoCStats

Func cmbSniperTroop()
	$iSniperTroop = _GUICtrlComboBox_GetCurSel($cmbSniperTroop)
	setlog("$iSniperTroop = " & $iSniperTroop)
EndFunc