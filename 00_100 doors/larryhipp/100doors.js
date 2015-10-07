var doors = [].slice.apply(new Uint8Array(100)); //setup array of all 0s

function openClose(skip, visualize) {
	for(var i=skip; i<doors.length; i = i + skip + 1)
		doors[i] = 1 - doors[i]; //toggle the door
	
	if(visualize === true) //visualize it just for fun
		console.log(doors.join(''));

	if(skip < doors.length)
		openClose(skip + 1, visualize);	
}

openClose(0, true); //do it