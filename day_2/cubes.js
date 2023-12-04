#!/usr/bin/env node

var readline = require('readline');

var lineRead = readline.createInterface({
    input: require('fs').createReadStream('input.txt'),
});

var lines = [];

lineRead.on('line', (line) => {
    lines.push(line);
});

lineRead.on('close', () => {
	let games = [];

	var max_colors = {
		red: 12,
		green: 13,
		blue: 14,
	}

    games = lines.map((line) => line.split(':')[1]);
    
    var possibleIds = games.map((allsets, index) => {
	var setArray = allsets.split(';');
	let valid = true;

	setArray.forEach((set) => {
	    var individualColors = set.split(',');

	    var colours = {
		red: 0,
		blue: 0,
		green: 0,
	    }

	    individualColors.forEach((numberColor) => {
		var [number, color] = numberColor.trim().split(' ');

		colours[color] += Number(number);
	    });

	    for (let [color, number] of Object.entries(colours)) {
		if (number > max_colors[color]) {
		    valid = false;
		}
	    }
	});

	if (valid) {
	    return index + 1;
	} else {
	    return -1;
	}
    });

    var ids = possibleIds.filter((e) => e !== -1);

    var sum = ids.reduce((x, y) => Number(x) + Number(y));

    console.log(ids);
    console.log(sum);
});
