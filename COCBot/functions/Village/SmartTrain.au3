#; #FUNCTION# ====================================================================================================================
; Name ..........: SmartTrain
; Description ...: Train the specified troops with an optimized distribution between the barracks
; Syntax ........: SmartTrain()
; Parameters ....:
; Return values .: None
; Author ........: LunaEclipse
; Modified ......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================

Local $totalTrainingTime = 0	; var totalTrainingTime = 0;
Local $averageTrainingTime = 0	; var averageTrainingTimePerBarracks = 0;
Local $eligibleBarracks = 0		; var eligibleBarracks = 0;

Func calculateBarracksInformation()
#cs	totalTrainingTime = 0;
	averageTrainingTimePerBarracks = 0;
	eligibleBarracks = 0;

	for(var i=0; i < troopsArray.length; i++){
		totalTrainingTime = totalTrainingTime + troopsArray[i].calculateTrainingTime();
	}

	for(var j=0; j < barracksArray.length; j++){
		if(barracksArray[j].level > 0){
			eligibleBarracks++;
		}
	}

	if(eligibleBarracks > 0){
		averageTrainingTimePerBarracks = totalTrainingTime / eligibleBarracks;
	}
#ce
EndFunc   ;==> calculateBarracksInformation

Func distributeTroops()
#cs	if(disableDistribution){
		return;
	}
	//resetDistributedQuantity();
	clearError();

	//Normal Troops
	var uneven = unevenDistribution();

	if(unevenDistribution){
		calculateBarracksInformation();
	}

	//call distrobution using both methods
	var results = [['unlocked','lowest',normalTroopDistribution('unlocked','lowest')]
				  ,['housingSpace','lowest',,normalTroopDistribution('housingSpace','lowest')]
				  ,['trainingTime','lowest',,normalTroopDistribution('trainingTime','lowest')]
				  ,['unlockedAscending','lowest',,normalTroopDistribution('unlockedAscending','lowest')]
				  ,['unlocked','highest',normalTroopDistribution('unlocked','lowest')]
				  ,['housingSpace','highest',,normalTroopDistribution('housingSpace','lowest')]
				  ,['trainingTime','highest',,normalTroopDistribution('trainingTime','lowest')]
				  ,['unlockedAscending','highest',,normalTroopDistribution('unlockedAscending','lowest')]
				  ,['unlocked','none',normalTroopDistribution('unlocked','lowest')]
				  ,['housingSpace','none',,normalTroopDistribution('housingSpace','lowest')]
				  ,['trainingTime','none',,normalTroopDistribution('trainingTime','lowest')]
				  ,['unlockedAscending','none',,normalTroopDistribution('unlockedAscending','lowest')]
	];

	var mostEfficient = 0;
	var mostEfficientTime = results[0][2];

	for(var j=1;j<results.length;j++){
		if(results[j][2]<mostEfficientTime){
			mostEfficient = j;
		}
	}

	normalTroopDistribution(results[mostEfficient][0],results[mostEfficient][1]);

	/*
	// var unlockedLength = normalTroopDistribution('unlocked',uneven);
	// var troopSpaceLength = normalTroopDistribution('housingSpace',uneven);
	// var troopTimeLength = normalTroopDistribution('trainingTime',uneven);
	// var unlockedAscending = normalTroopDistribution('unlockedAscending',uneven);*/


	/*
	if(unlockedLength < troopSpaceLength && unlockedLength < troopTimeLength){
		normalTroopDistribution('unlocked',uneven);
	}else if(troopSpaceLength < unlockedLength && troopSpaceLength < troopTimeLength){
		normalTroopDistribution('housingSpace',uneven);
	}else{
		normalTroopDistribution('trainingTime',uneven);
	}*/


	//Normal Troops
	//loop through barracks and populate the html fields
	for(var j=0;j<barracksArray.length;j++){
		//populate troop distribution tables
		for(var k=0;k<barracksArray[j].troopQueue.length;k++){
			var troopQueueElement = document.getElementById('barracks'+String(barracksArray[j].troopQueue[k][0])+String(j));

			if(troopQueueElement){
				if(barracksArray[j].troopQueue[k][1] > 0){
					changeText(troopQueueElement,barracksArray[j].troopQueue[k][1]);
				}else{
					changeText(troopQueueElement,'');
				}
			}
		}

		var availableQueue = document.getElementById('barracksAvailableQueue'+String(j));

		if(availableQueue){
			changeText(availableQueue,barracksArray[j].availableTroopQueue);
		}

		var trainingTime = document.getElementById('barracksTrainingTime'+String(j));

		if(trainingTime){
			if(barracksArray[j].queueTrainingTime > 0){
				changeText(trainingTime,secondstotime(barracksArray[j].queueTrainingTime));
			}else{
				changeText(trainingTime,'00:00:00');
			}
		}
	}

	//Dark Troops
	//distribute highest training time first by looping through array backwards
	for(var i=0; i<darkBarracksArray.length; i++){
		darkBarracksArray[i].initializeTroopQueue();
	}

	//call distrobution using both methods
	var darkUnlockedLength = darkTroopDistribution('unlocked',uneven);
	var darkTroopSpaceLength = darkTroopDistribution('housingSpace',uneven);
	var darkTroopTimeLength = darkTroopDistribution('trainingTime',uneven);

	if(darkUnlockedLength < darkTroopSpaceLength && darkUnlockedLeght < darkTroopTimeLength){
		darkTroopDistribution('unlocked',uneven);
	}else if(darkTroopSpaceLength < darkUnlockedLength && darkTroopSpaceLength < darkTroopTimeLength){
		darkTroopDistribution('housingSpace',uneven);
	}else{
		darkTroopDistribution('trainingTime',uneven);
	}

	//for(var h=(darkTroopsArray.length-1); h > -1; h--){
	//   assignToBarracks(darkTroopsArray[h],darkBarracksArray,false);
	//}

	//Dark Troops
	//loop through barracks and populate the html fields
	for(var j=0;j<darkBarracksArray.length;j++){
		//populate troop distribution tables
		for(var k=0;k<darkBarracksArray[j].troopQueue.length;k++){
			var darkTroopQueueElement = document.getElementById('darkBarracks'+String(darkBarracksArray[j].troopQueue[k][0])+String(j));

			if(darkTroopQueueElement){
				if(darkBarracksArray[j].troopQueue[k][1] > 0){
					changeText(darkTroopQueueElement,darkBarracksArray[j].troopQueue[k][1]);
				}else{
					changeText(darkTroopQueueElement,'');
				}
			}
		}

		var darkAvailableQueue = document.getElementById('darkBarracksAvailableQueue'+String(j));

		if(darkAvailableQueue){
			changeText(darkAvailableQueue,darkBarracksArray[j].availableTroopQueue);
		}

		var darkTrainingTimeElement = document.getElementById('darkBarracksTrainingTime'+String(j));

		if(darkTrainingTimeElement){
			if(darkBarracksArray[j].queueTrainingTime > 0){
				changeText(darkTrainingTimeElement,secondstotime(darkBarracksArray[j].queueTrainingTime));
			}else{
				changeText(darkTrainingTimeElement,'00:00:00');
			}
		}
#ce	}
EndFunc   ;==> distributeTroops

Func normalTroopDistribution(method, barracksMethod)
#cs	//reset distribution
	for(var i=0; i<barracksArray.length; i++){
		barracksArray[i].initializeTroopQueue();
	}

	var maxBarracksTime = 0;

	if(method == 'housingSpace'){
		var troopOrderArray  = new Array(6,4,9,5,8,7,2,1,3,0);

		for (var h =0;h < troopOrderArray.length ; h++){
			assignToBarracks(troopsArray[troopOrderArray[h]],barracksArray,barracksMethod,averageTrainingTimePerBarracks);
		}
	}

	if(method == 'trainingTime'){
		var troopOrderArray  = new Array(9,8,7,5,6,3,4,2,1,0);

		for (var h =0;h < troopOrderArray.length ; h++){
			assignToBarracks(troopsArray[troopOrderArray[h]],barracksArray,barracksMethod,averageTrainingTimePerBarracks);
		}
	}else if (method == 'unlocked'){
		for(var h=(troopsArray.length-1); h > -1; h--){
			assignToBarracks(troopsArray[h],barracksArray,barracksMethod,averageTrainingTimePerBarracks);
		}
	}else if (method == 'unlockedAscending'){
		for(var h=0; h< troopsArray.length; h++){
			assignToBarracks(troopsArray[h],barracksArray,barracksMethod,averageTrainingTimePerBarracks);
		}
	}

	maxBarracksTime = barracksArray[0].queueTrainingTime;

	for(var j=1;j<barracksArray.length;j++){
		if(barracksArray[j].queueTrainingTime > maxBarracksTime){
			maxBarracksTime = barracksArray[j].queueTrainingTime;
		}
	}

#ce	return maxBarracksTime;
EndFunc   ;==> normalTroopDistribution

Func darkTroopDistribution(method, uneven, barracksMethod)
#cs	//reset distribution
	for(var i=0; i<darkBarracksArray.length; i++){
		darkBarracksArray[i].initializeTroopQueue();
	}

	var maxBarracksTime = 0;

	if(method == 'housingSpace'){
		var troopOrderArray  = new Array(4,3,5,2,1,0);

		for (var h =0;h < troopOrderArray.length ; h++){
			assignToBarracks(darkTroopsArray[troopOrderArray[h]],darkBarracksArray,barracksMethod,averageTrainingTimePerBarracks);
		}
	}

	if(method == 'trainingTime'){
		var troopOrderArray  = new Array(3,5,4,2,1,0);

		for (var h =0;h < troopOrderArray.length ; h++){
			assignToBarracks(darkTroopsArray[troopOrderArray[h]],darkBarracksArray,barracksMethod,averageTrainingTimePerBarracks);
		}
	}else if (method == 'unlocked'){
		for(var h=(darkTroopsArray.length-1); h > -1; h--){
			assignToBarracks(darkTroopsArray[h],darkBarracksArray,barracksMethod,averageTrainingTimePerBarracks);
		}
	}

	maxBarracksTime = darkBarracksArray[0].queueTrainingTime;

	for(var j=1;j<darkBarracksArray.length;j++){
		if(barracksArray[j].queueTrainingTime > maxBarracksTime){
			maxBarracksTime = darkBarracksArray[j].queueTrainingTime;
		}
	}

#ce	return maxBarracksTime;
EndFunc   ;==> darkTroopDistribution

Func assignToBarracks(troop, localBarracksArray, barracksMethod, trainingTimePerBarracks)
#cs	//loop through all the goblins and assign them to a barracks
	var leastTrainingTime;
	var leastTrainingTimeIndex = -1;
	var leastTrainingBarracksLevel = 0;

	//distribute to all barracks
	for(var i=0; i < troop.quantity; i++){
		//placement of old uneven distro logic
		for(var j=0; j < localBarracksArray.length; j++){
			if(localBarracksArray[j].level >= troop.barracksLevelRequired && localBarracksArray[j].availableTroopQueue >= troop.housingSpace){
				//calculate the training time for the troop based on whether the barracks is boosted
				//find the barracks that has the least training time after the troop is added.  this should account
				//for less training time for the boosted barracks
				var trainingTimeSeconds = localBarracksArray[j].boosted == true ?  (troop.trainingTimeSeconds / localBarracksArray[j].boostFactor) : troop.trainingTimeSeconds;

				if(leastTrainingTimeIndex < 0){
					leastTrainingTime = localBarracksArray[j].queueTrainingTime + trainingTimeSeconds;
					leastTrainingTimeIndex = j;
					leastTrainingBarracksLevel = localBarracksArray[j].level;
				}else if((localBarracksArray[j].queueTrainingTime + trainingTimeSeconds) < leastTrainingTime){
					leastTrainingTime = localBarracksArray[j].queueTrainingTime + trainingTimeSeconds;
					leastTrainingTimeIndex = j;
					leastTrainingBarracksLevel = localBarracksArray[j].level;
				}else if((localBarracksArray[j].queueTrainingTime + trainingTimeSeconds) == leastTrainingTime && barracksMethod != 'none'){
					if((barracksMethod == 'lowest' && localBarracksArray[j].level < leastTrainingBarracksLevel) ||
					   (barracksMethod == 'highest' && localBarracksArray[j].level > leastTrainingBarracksLevel)){
							leastTrainingTime = localBarracksArray[j].queueTrainingTime + trainingTimeSeconds;
							leastTrainingTimeIndex = j;
							leastTrainingBarracksLevel = localBarracksArray[j].level;
					}
				}
			}
		}

		if(leastTrainingTimeIndex >= 0){
			if(!localBarracksArray[leastTrainingTimeIndex].addTroopToQueue(troop)){
				return false;
			}

			troopsDistributed = true;
			troop.distributedQuantity++;
		}else{
			setError('Distribution Not Complete: Either You Do Not Have A Barracks That Can Produce a ' + troop.name + ' Or You Do Not Have Enough Available Barracks Queue For One.');
			return false;
		}

		leastTrainingTime = 0;
		leastTrainingTimeIndex = -1;
	}

#ce	return true;
EndFunc   ;==> assignToBarracks

Func incrementBarracksCounter(counter, maxSize)
#cs	counter++;

	if(counter > maxSize){
		counter = 1;
	}

#ce	return counter;
EndFunc   ;==> incrementBarracksCounter

Func unevenDistribution()
#cs	//disable for now
	return false;
	//determine if the barracks with the least space will fit the average amount of troops needed
	//if not a more advance algorithm is necessary for the allocation
	var armyCampUsedElem = document.getElementById('armyCampUsed');
	var armyCampUsed = getText(armyCampUsedElem);
	var activeBarracks = 0;

	for(var i=0; i<barracksArray.length; i++){
		if(barracksArray[i].level > 0){
			activeBarracks++;
		}
	}

	if(activeBarracks > 0 && Number(armyCampUsed) > 0){
		var troopsPerBarrack = armyCampUsed / activeBarracks;

		for(var i=0; i<barracksArray.length; i++){
			if(barracksArray[i].level > 0 && barracksArray[i].maxTroopQueue < troopsPerBarrack){
				return true;
			}
		}
	}

#ce	return false;
EndFunc   ;==> unevenDistribution

#cs /*
if(unevenDistro){
	//settle the under sized barracks with the larger troops first
	for(var j=0; j < localBarracksArray.length; j++){
		if(localBarracksArray[j].maxTroopQueue < (regularTroopTotal/eligibleBarracks)){
			if(troop.trainingTimePerHousingSpace() > localBarracksArray[j].averageHousingSpaceForAverageTime(trainingTimePerBarracks)){
				if(localBarracksArray[j].level >= troop.barracksLevelRequired && localBarracksArray[j].availableTroopQueue >= troop.housingSpace){
					if(leastTrainingTimeIndex < 0){
						leastTrainingTime = localBarracksArray[j].queueTrainingTime;
						leastTrainingTimeIndex = j;
					}else if(localBarracksArray[j].queueTrainingTime < leastTrainingTime){
						leastTrainingTime = localBarracksArray[j].queueTrainingTime;
						leastTrainingTimeIndex = j;
					}
				}
			}
		}
	}

	if(leastTrainingTimeIndex < 0){
		for(var j=0; j < localBarracksArray.length; j++){
			if(localBarracksArray[j].level >= troop.barracksLevelRequired && localBarracksArray[j].availableTroopQueue >= troop.housingSpace){
				if(leastTrainingTimeIndex < 0){
					leastTrainingTime = localBarracksArray[j].queueTrainingTime;
					leastTrainingTimeIndex = j;
				}else if(localBarracksArray[j].queueTrainingTime < leastTrainingTime){
					leastTrainingTime = localBarracksArray[j].queueTrainingTime;
					leastTrainingTimeIndex = j;
				}
			}
		}
	}
}
#ce */
