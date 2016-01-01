Func LaunchSideAttackTroop($listInfoDeploy, $CC, $King, $Queen, $Warden)
	If $debugSetlog =1 Then SetLog("LaunchTroop2 with CC " & $CC & ", K " & $King & ", Q " & $Queen & ", W " & $Warden , $COLOR_PURPLE)
	Local $listListInfoDeployTroopPixel[0]

	 If $iMatchMode = $LB And $iChkDeploySettings[$LB] >= 5 Then ; Used for DE or TH side attack
		Local $RandomEdge = $Edges[$BuildingEdge]
		Local $RandomXY = 2
	 Else
		Local $RandomEdge = $Edges[Round(Random(0, 3))]
		Local $RandomXY = Round(Random(0, 4))
	 EndIf
	 For $i = 0 To UBound($listInfoDeploy) - 1
		 if string($listInfoDeploy[$i][0]) <> $DeDeployEmptyString Then
			Select
				 Case $listInfoDeploy[$i][0] = "HEROES"
					 dropHeroes($RandomEdge[$RandomXY][0], $RandomEdge[$RandomXY][1], $King, $Queen, $Warden)
				 Case $listInfoDeploy[$i][0] = $eKing
					 dropHeroes($RandomEdge[$RandomXY][0], $RandomEdge[$RandomXY][1], $King, -1, -1)
				 Case $listInfoDeploy[$i][0] = $eQueen
					 dropHeroes($RandomEdge[$RandomXY][0], $RandomEdge[$RandomXY][1], -1, $Queen, -1)
				 Case $listInfoDeploy[$i][0]= $eWarden
					 dropHeroes($RandomEdge[$RandomXY][0], $RandomEdge[$RandomXY][1], -1, -1, $Warden)
				 Case $listInfoDeploy[$i][0] = $eCastle Or $listInfoDeploy[$i][0] = "CC"
					 dropCC($RandomEdge[$RandomXY][0], $RandomEdge[$RandomXY][1], $CC)
				 Case $listInfoDeploy[$i][0] = $eRSpell Or $listInfoDeploy[$i][0] = $eHSpell Or $listInfoDeploy[$i][0] = $eJSpell Or $listInfoDeploy[$i][0] = $eHaSpell Or $listInfoDeploy[$i][0] = $eFSpell Or $listInfoDeploy[$i][0] = $ePSpell
					 SetLog("Dropping spell " & $listInfoDeploy[$i][0] & " at " & $listInfoDeploy[$i][4] & "% distance")
					 If $BuildingLoc = 1 Then
						 ;drop spell towards the DE storage
						 dropSpell(ceiling((((100-$listInfoDeploy[$i][4])*$RandomEdge[$RandomXY][0])+($listInfoDeploy[$i][4]*$BuildingLocx))/100), _
								   ceiling((((100-$listInfoDeploy[$i][4])*$RandomEdge[$RandomXY][1])+($listInfoDeploy[$i][4]*$BuildingLocy))/100), _
								   $listInfoDeploy[$i][0])
					 Else
						 ;drop spell towards the center
						 dropSpell(ceiling((((100-$listInfoDeploy[$i][4])*$RandomEdge[$RandomXY][0])+($listInfoDeploy[$i][4]*430))/100), _
								   ceiling((((100-$listInfoDeploy[$i][4])*$RandomEdge[$RandomXY][1])+($listInfoDeploy[$i][4]*313))/100), _
								   $listInfoDeploy[$i][0])
					 EndIf
				 Case $listInfoDeploy[$i][0] = $eESpell
					 SetLog("Dropping earth at " & $listInfoDeploy[$i][4] & "% distance")
					 ;4 quakes or go home
					 Local $numEarthSpells = 0
					 For $j = 0 To UBound($atkTroops) - 1
						 If $atkTroops[$j][0] = $eESpell Then
							;With donate spells, there might be more than one slot with earth spell
							If $CCSpellType = $eESpell Then
								; Clan castle spell is earthquake so add one extra to the total
								SetLog($atkTroops[$j][1] & " earthquake spells in slot " & $j & " and 1 earthquake spell in the clan castle")
								$numEarthSpells = $numEarthSpells + $atkTroops[$j][1] + 1
							Else
								SetLog($atkTroops[$j][1] & " earthquake spells in slot " & $j)
								$numEarthSpells = $numEarthSpells + $atkTroops[$j][1]
							EndIf
						 EndIf
					 Next
					 If $numEarthSpells >= 4 Then
						 If $BuildingLoc = 1 Then
							 ;drop spell towards the DE storage
							 dropEarth(ceiling((((100-$listInfoDeploy[$i][4])*$RandomEdge[$RandomXY][0])+($listInfoDeploy[$i][4]*$BuildingLocx))/100), _
									   ceiling((((100-$listInfoDeploy[$i][4])*$RandomEdge[$RandomXY][1])+($listInfoDeploy[$i][4]*$BuildingLocy))/100), _
									   $listInfoDeploy[$i][0])
						 Else
							 ;drop spell towards the center
							 dropEarth(ceiling((((100-$listInfoDeploy[$i][4])*$RandomEdge[$RandomXY][0])+($listInfoDeploy[$i][4]*430))/100), _
									   ceiling((((100-$listInfoDeploy[$i][4])*$RandomEdge[$RandomXY][1])+($listInfoDeploy[$i][4]*313))/100), _
									   $listInfoDeploy[$i][0])
						 EndIf
					 Else
						 SetLog("Only " & $numEarthSpells & " earthquakes available.  Waiting for 4.")
					 EndIf
				 Case Else
					 If LauchTroop($listInfoDeploy[$i][0], $listInfoDeploy[$i][1], $listInfoDeploy[$i][2], $listInfoDeploy[$i][3], $listInfoDeploy[$i][4]) Then
						 If _Sleep(SetSleep(1)) Then Return
					 EndIf
			 EndSelect
		 EndIf
	  Next
	Return True
EndFunc   ;==>LaunchSideAttackTroop
