;Drops Clan Castle troops, given the slot and x, y coordinates.

; #FUNCTION# ====================================================================================================================
; Name ..........: dropSpell
; Description ...: Drops Spell, given the spell and x, y coordinates.
; Syntax ........: dropSpell($x, $y, $spell)
; Parameters ....: $x                   - X location.
;                  $y                   - Y location.
;                  $spell               - spell
; Return values .: None
; Author ........:
; Modified ......:Knowskones 31/7/15 updated for new troop bar.
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func dropEarth($x, $y, $spell)
   	Local $numSpells, $minespell
	$numSpells = 0
	$minespell = 4

   If $spell <> -1 Then
     For $i = 0 To UBound($atkTroops) - 1
        If $atkTroops[$i][0] = $eEspell Then
		   $Spell = $i
		   $numSpells = $atkTroops[$i][1]
        If _Sleep(100) Then Return
	    If $debugsetlog = 1 Then SetLog("Dropping spell in slot " & $i, $COLOR_BLUE)
             Click(GetXPosOfArmySlot($i, 68), 595 + $bottomOffsetY,1,0,"#0094")
			 If $debugsetlog = 1 Then SetLog("Number of Earth Spells: " & $numSpells, $COLOR_PURPLE)
			If $numSpells < $minespell Then Return
			SetLog(" Dropping EARTHQUAKE SPELL" , $COLOR_RED)
           Click($x, $y, 4, 50)
		 exitloop
        Endif
     Next
   EndIf
EndFunc   ;==>dropSpell
