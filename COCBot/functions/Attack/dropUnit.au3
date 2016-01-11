;Drops troops, given the slot and x, y coordinates.

; #FUNCTION# ====================================================================================================================
; Name ..........: dropUnit
; Description ...: Drops Unit, given the Unit and x, y coordinates.
; Syntax ........: dropUnit($x, $y, $kind, $number)
; Parameters ....: $x                   - X location.
;                  $y                   - Y location.
;                  $kind                - Unit
;                  $number              - number to drop
; Return values .: None
; Author ........:
; Modified ......:Knowskones 31/7/15 updated for new troop bar.
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func dropUnit($x, $y, $kind, $number) ;Drop Unit
   If $kind <> -1 Then
     For $i = 0 To 11
        If $atkTroops[$i][0] = $kind Then
        If _Sleep(100) Then Return
           SetLog("Dropping Unit in slot " & $i, $COLOR_BLUE)
             Click(GetXPosOfArmySlot($i, 68), 595 + $bottomOffsetY,1,0,"#0094") ;Select Unit
           ;Click(68 + (72 * $i), 595) ;Select Unit (FIXME: add debug info)
           If _Sleep(500) Then Return
			SetLog(" Dropping troops" & $i, $COLOR_RED)
		   For $j = 1 to $number
		      Click($x, $y) ; drop it (FIXME: add debug info)
			  If _Sleep(100) Then Return
		   Next
           exitloop
        Endif
     Next
   EndIf
EndFunc   ;==>dropTroopXY
