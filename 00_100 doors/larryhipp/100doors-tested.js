var doors = [].slice.apply(new Uint8Array(100)); //setup array of all 0s

function openClose(skip, visualize, callback) {
	for(var i=skip; i<doors.length; i = i + skip + 1)
		doors[i] = 1 - doors[i]; //toggle the door

	if(visualize === true) //visualize it just for fun
		console.log(doors.join(''));

	if(skip < doors.length) {
		openClose(skip + 1, visualize, callback);
	}
	else {
		callback(); //callback so we can test that is worked
	}
}

openClose(0, true, function() {
	var solution = '1001000010000001000000001000000000010000000000001000000000000001000000000000000010000000000000000001';

	if(solution === doors.join('')) {
		console.log('Pass');
	} else {
		console.log('Fail');
	}
});
