var peg = require('pegjs');
var parser = require("./parser.js");

const readline = require("readline");
readline.emitKeypressEvents(process.stdin);
const rl = readline.createInterface({ input: process.stdin, output: process.stdout });
process.stdin.setRawMode(true);

let expression = "";
process.stdin.on("keypress", (str, key) => {
    if (str === "Q") {
	process.exit();
    } else {
	expression += str;
	if (str === "=") {
	    try {
	        rl.write(" " + parser.parse(expression) + "\n");
            } catch (e) {
		rl.write(" Error in parsei!: " + e.message);
		rl.write("\n");
	    }
	    expression = "";
	}
    }
});
