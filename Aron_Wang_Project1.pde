//original sketch summary:
//basically I want to make shutters move up/down like blinks
//The pupil disappears, then appears again scaled bigger
//& bigger before it disappears
//the background steadily gets more white and
//tiny red dots randomize around the edgelike a vignette
//blue shards "grow" down the screen like ice
//(made up of large rectangle lined with irregular triangles)
//red "heartbeat" fuzzy circle in the middle fades in
//starts beating faster & faster
//bg gets darker with each beat 
//(possibly starting from the corners in?)


var shutter1x = 0; //variables to move top lid
var shutter2x = 0; //variables to move bottom lid
var index = 1;
var r = 0;
var g = 0;
var b = 0;
var backgroundOpacity = 0;
var redHeart = 0;
let prickles = [];
let icicles = [];


function setup() {
  createCanvas(500,400);
  background(r, g, b); 
	for (let i = 0; i < 30000; i = i + 10){ 			
		var prickleX = random(0,500);
		var prickleY = random(0,400);
		prickles[i] = new Prickle (prickleX,prickleY,1,1); 
	}  
	for (let i = 0; i < 60; i = i + 1){ 			
		var icicleX = random(0,500);
		var icicleY = 0;
		var icicleHeight = random(-400,0);
		icicles[i] = new Icicle (icicleX,icicleY,icicleX+30,icicleY,icicleX+15,icicleHeight); 
	} 																				
}


function draw(){
  background(r, g, b);
  pupil();
  shutter1();
  shutter2();
	shutterSpeed();
 }



function shutter1 (){ //top lid
  fill(r, g, b);//match to bg
  noStroke();
  quad(210,170+shutter1x,210,130+shutter1x,290,130+shutter1x,290,170+shutter1x);
}


function shutter2 (){ //bottom lid
//  fill(r, g, b);
  noStroke();
  quad(210,270-shutter2x,210,230-shutter2x,290,230-shutter2x,290,270-shutter2x);
}


function pupil (){ //middle circle
  fill(43,29,14); //brown
  ellipse(width/2,height/2,60,60);
  noStroke();
}


function shutterSpeed (){
	if (index == 1){
		 if (shutter1x <= 30 ){
			 shutter1x = shutter1x + 0.4;
		 }

		 if (shutter1x > 30 ){
			 shutter1x = 0;
			 shutter1x = shutter1x + 1;
		 }

		 if (shutter2x <= 30 ){
			 shutter2x = shutter2x + 0.4;
		 }

		 if (shutter2x > 30 ){
			 shutter2x = 0;
			 shutter2x = shutter2x + 1;
		 }
	//	index = index + 1;
	}
	if (index == 2){
		 if (shutter1x <= 30 ){
			 shutter1x = shutter1x + 2.5;
		 }

		 if (shutter1x > 30 ){
			 shutter1x = 0;
			 shutter1x = shutter1x + 1;
		 }

		 if (shutter2x <= 30 ){
			 shutter2x = shutter2x + 2.5;
		 }

		 if (shutter2x > 30 ){
			 shutter2x = 0;
			 shutter2x = shutter2x + 1;
		 }	
		
		if (millis() > 1600) {
		  background(r, g, b);
		}
		
		if (millis() > 2000) {
			enlargePupil();
		}
		
		if (millis() > 2200) {
			enlargePupil2();
		}
		
		if (millis() > 2250) {
			enlargePupil3();
		}
		
		if (millis() > 2300) {
		  background(r, g, b);
			bloodLoss();
		}
		
		if (millis() > 2700) {
			for (let i = 0; i < 10; i = i + 10){
				prickles[i].display();
			}
		}
		
		if (millis() > 3000) {
			for (let i = 0; i < 50; i = i + 10){
				prickles[i].display();
			}
		}
		
		if (millis() > 3200) {
			for (let i = 0; i < 100; i = i + 10){
				prickles[i].display();
			}
		}
		
		if (millis() > 3400) {
			for (let i = 0; i < 500; i = i + 10){
				prickles[i].display();
			}
		}
		
		if (millis() > 3700) {
			for (let i = 0; i < 1000; i = i + 10){
				prickles[i].display();
			}
		}
		
		if (millis() > 3900) {
			for (let i = 0; i < 3000; i = i + 10){
				prickles[i].display();
			}
		}
		
		if (millis() > 4000) {
			for (let i = 0; i < 5000; i = i + 10){
				prickles[i].display();
			}
		}
		
		if (millis() > 4100) {
			for (let i = 0; i < 10000; i = i + 10){
				prickles[i].display();
			}
		}
		
		if (millis() > 4200) {
			for (let i = 0; i < 20000; i = i + 10){
				prickles[i].display();
			}
		}
		
		if (millis() > 4300) {
			for (let i = 0; i < 30000; i = i + 10){
				prickles[i].display();
			}
		}
		
		if (millis() > 4500) {
			clear();
			background(173,16,47);
		}
		
		if (millis() > 4550) {
			for (let i = 0; i < 60; i = i + 1){
					icicles[i].display();
					icicles[i].grow();
			}
		}
		
		if (millis() > 4750) {
			for (let i = 0; i < 60; i = i + 1){
					icicles[i].display();
					icicles[i].grow();
			}
		}
		
		if (millis() > 24000) {
		  darken();
		}
		
		if (millis() > 24000) {
			heart();
		  heartUp();
		}
		
		if (millis() > 24050) {
		  heartDown();
		}
		
		if (millis() > 24100) {
		  heartUp();
		}
		
		if (millis() > 24125) {
		  heartDown();
		}
		
		if (millis() > 24140) {
		  heartUp();
		}
		}
		
		if (millis() > 24155) {
		  heartDown();
		}
		
		if (millis() > 24160) {
		  heartUp();
		}
		
		if (millis() > 24165) {
		  heartDown();
		}
		
	if (index > 2){
	 index = 3;
	}
}

function mousePressed(){
	index++;
}

function enlargePupil(){
		push();
			scale(2);
			translate(-125,-100);
			pupil();
		pop();
}

function enlargePupil2(){
	  background(r, g, b);
		push();
			scale(2);
			translate(-125,-100);
			enlargePupil();
		pop();
}

function enlargePupil3(){	
  background(r, g, b);	
	push();
			scale(1.2);
			translate(-40,-35);
			enlargePupil2();
		pop();
}

function bloodLoss(){
	background(r,g,b);
	r = r + 10;
	g = g + 10;
	b = b + 10;
}

function darken(){
	background(0,0,0,backgroundOpacity)
	if (backgroundOpacity < 255){
		backgroundOpacity = backgroundOpacity + 25;
	}
}

function heart(){
	fill(redHeart,0,0);
	ellipse(width/2,height/2,70,70);
  filter(BLUR, 5);
}

function heartUp(){
	redHeart = 255;
}

function heartDown(){
	redHeart = 0;
}

/*
function heartUp(){
	heart();
	if(redHeart < 255){
		redHeart = redHeart + 63;
	}
}

function heartDown(){
	heart();
	if(redHeart > 0){
		redHeart = redHeart - 63;
	}
}
*/
