var gameEngineClass = (function() {
	return function make_gameEngine() {
		var generated;
		var numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

		init();

		function init() {
			generateNumber();
		}

		function generateNumber() {
			var length = 4;
			var rnd;
			var output = '';
			
			//loop 4 times
			for (var x = 0; x < length; x++) {
				//pick a random item from the list
				rnd = Math.floor(Math.random() * numbers.length);
		  		
		  		//append the value at that index
		  		output = output + numbers[rnd];

		  		//remove the item at that index	
		  		numbers.splice(rnd, 1);
			}
			
			generated = output;
		}

		function getEl(id) {
			return document.getElementById(id);
		}

		function showEl(id) {
			getEl(id).style.display = 'block';
		}

		function hideEl(id) {
			getEl(id).style.display = 'none';
		}

		function validateGuess(guess) {
			var idx;
			var lidx;
			
			//4 chars, 1-9 only.
			if (!new RegExp(/^[1-9]{4}$/).test(guess)) {
				return false;
			}

			//No duplicates
			for (var n = 0; n < numbers.length; n++) {
				idx = guess.indexOf(numbers[n]);
				lidx = guess.lastIndexOf(numbers[n]);
				console.log(idx + ', ' + lidx);
				if (idx >= 0 & idx != lidx) {
					//duplicate detected
					return false;
				}
			}
			return true;
		}

		function compareValues(guess) {
			var result = {
				isValid: false,
				match: false,
				bulls: 0,
				cows: 0
			};
			//var foo = [null, null, null, null];

			if (validateGuess(guess)) {
				result.isValid = true

				//
				/*for (var i = 0; i < length; i++) {
					foo[i] = guess[i] === generated[i];

					//if it doesn't match, check to see if it matches any others
					if (!foo[i]) {

					}
				}*/
			
				for (var x = 0; x < generated.length; x++) {
					for (var y = 0; y < guess.length; y++) {
						if (generated[x] == guess[y]) {
							(x === y) ? result.bulls = result.bulls + 1 : result.cows = result.cows + 1;
						}
					}
				}
			}
			return result;
		}

		function resetResults() {
			//Reset
			getEl('bullCount').innerText = 0;
			getEl('cowCount').innerText = 0;
			hideEl('results');
			hideEl('invalid');
			hideEl('partialMatch');
			hideEl('exactMatch');
		}

		var checkGuess = function() {
			var guess = getEl('guess').value;
			
			resetResults();

			var result = compareValues(guess);

			//Handle result
			if (!result.isValid) {
				showEl('invalid');
				return;
			}

			showEl('results');	
			
			if (result.bulls === 4) {
				showEl('exactMatch');	
			} else {
				showEl('partialMatch');	
				getEl('bullCount').innerText = result.bulls;
				getEl('cowCount').innerText = result.cows;
			}
		};

		return {
			checkGuess: checkGuess
		};
	};
}());

var gameEngine = new gameEngineClass();

function test() {
	console.log(gameEngine);
}
