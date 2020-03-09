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
var r = 0; //background color rgb
var g = 0; //background color rgb
var b = 0; //background color rgb
var backgroundOpacity = 0;
let prickles = [];
let icicles = [];


function setup() {
  createCanvas(500,400); 
  background(r, g, b); //to make color editing easier
	
	for (let i = 0; i < 30000; i = i + 10){ //make 10 random prickles as long as			
		var prickleX = random(0,500);					//the amount of prickles is less than
		var prickleY = random(0,400);					//3000
		prickles[i] = new Prickle (prickleX,prickleY,1,1); 
	}  
	
	for (let i = 0; i < 60; i = i + 1){ //make one new random icicle as long as 	
		var icicleX = random(0,500);			//icicle count is under 60
		var icicleY = 0;
		var icicleHeight = random(-400,0);//randomize height to make them uneven
		icicles[i] = new Icicle (icicleX,icicleY,icicleX+30,icicleY,icicleX+15,icicleHeight); 
	} 																	//^ triangle parameters																	
}


function draw(){
  background(r, g, b); //customize bg color in variables
  pupil();						//brown circle displayed
  shutter1();					//top eyelid moves	
  shutter2();					//bottom eyelid moves
	shutterSpeed();			//time-based sequence plays after click
 }




function mousePressed(){ //triggers sequence with 1 mouse click
	index++;
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
	if (index == 1){ //default slow blink pre-click
		 firstBlink();
	//	index = index + 1;
	}
	
	if (index == 2){ //triggered sequence when mouse is clicked
		
	  fastBlink();
		wideEyes();
		bloodLossSequence();
		
		if (millis() > 4500) {	//pause after blood loss
			clear();							//I did this because I thought it might keep  
			background(173,16,47);//things from spawning in the background?
		}
		
		if (millis() > 4550) { //icicle sequence starts
			growIce();
		}
		
		if (millis() > 23500) { //fade to black
		  darken();
		}
		
		if (millis() > 24000) {
			redHeart();
		}
		
		if (millis() > 24050) {
			blackHeart();
		}
		
		if (millis() > 24100) {
			redHeart();
		}
		
		if (millis() > 24150) {
			blackHeart();
		}
		
		if (millis() > 24200) {
			redHeart();
		}
		
		if (millis() > 24250) {
			blackHeart();
		}
		
	if (index > 2){
	 index = 3;
	}
}
}





function firstBlink(){ //slow blink
	if (shutter1x <= 30 ){ //if upper eyelid is above the midway line
			 shutter1x = shutter1x + 0.4;//move down in increments
		 }

		 if (shutter1x > 30 ){//if upper eyelid has reached the midway line
			 shutter1x = 0;			//reset to start
			 shutter1x = shutter1x + 1;
		 }

		 if (shutter2x <= 30 ){//if lower eyelid is below the midway line
			 shutter2x = shutter2x + 0.4;//move up in increments
		 }

		 if (shutter2x > 30 ){//if lower eyelid has reached the midway line
			 shutter2x = 0;			//reset to start
			 shutter2x = shutter2x + 1;
		 }
}




function fastBlink(){//fast blink, same code with increased speed
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
}




function wideEyes(){ //pupil enlargements with no eyelids
	if (millis() > 1600) {
		  background(r, g, b); //reset bg color
		}
		
		if (millis() > 2000) {//hold first enlargement
			enlargePupil(); 
		}
		
		if (millis() > 2200) {//second one goes by faster
			enlargePupil2();
		}
		
		if (millis() > 2250) {//and so on
			enlargePupil3();
		}
}

function enlargePupil(){//first enlargement
		push();
			scale(2);						//doubled
			translate(-125,-100);//re-center
			pupil();
		pop();
}

function enlargePupil2(){ //second enlargement
	  background(r, g, b);
		push();
			scale(2);
			translate(-125,-100);//re-center
			enlargePupil();			//building off of first
		pop();
}

function enlargePupil3(){	//third enlargement
  background(r, g, b);	
	push();
			scale(1.2);
			translate(-40,-35);//re-center
			enlargePupil2();   //building off of second
		pop();
}



function bloodLossSequence (){ //start prickles sequence
	if (millis() > 2300) {
		  background(r, g, b); //clear bg
			bloodLoss();         //fade to white
		}
		
		if (millis() > 2700) {//first set of random prickles
			for (let i = 0; i < 10; i = i + 10){
				prickles[i].display();
			}
		}
		
		if (millis() > 3000) {//second set of random prickles
			for (let i = 0; i < 50; i = i + 10){
				prickles[i].display();
			}
		}
		
		if (millis() > 3200) {//prickles keep being created
			for (let i = 0; i < 100; i = i + 10){//getting faster
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
		
		if (millis() > 4300) {//final amount of prickles
			for (let i = 0; i < 30000; i = i + 10){
				prickles[i].display();
			}
		}
}


function bloodLoss(){ //lighten screen for prickles
	background(r,g,b);
	r = r + 10;
	g = g + 10;
	b = b + 10;
}
	
	
	
	
function growIce(){ 									//icicle sequence!
	for (let i = 0; i < 60; i = i + 1){//make one new icicle per loop, max 60
					icicles[i].display();				//show icicle
					icicles[i].grow();				//extend down the screen
			}
		
		if (millis() > 4750) {//second set of icicles, staggered a bit
			for (let i = 0; i < 60; i = i + 1){
					icicles[i].display();
					icicles[i].grow();
			}
		}
}




function darken(){ //fade to black
	background(0,0,0,backgroundOpacity)
	if (backgroundOpacity < 255){
		backgroundOpacity = backgroundOpacity + 25; //slowly gets darker
	}
}

function redHeart(){ //red circle for heartbeat
	fill(255,0,0);
	ellipse(width/2,height/2,70,70);
 // filter(BLUR, 5);
}

function blackHeart(){ //black version of circle for stutter effect
	fill(0,0,0);
	ellipse(width/2,height/2,80,80);
}


class Prickle { //class for red dots
	constructor(x,y,w,h){ //constructors for the dots
		this.x = x;
		this.y = y;
		this.w = w;
		this.h = h; 
	}
	
	display(){ //show circle
		fill(173,16,47); //make it red
		noStroke();
		ellipse(this.x,this.y,this.w,this.h);
	}
}


class Icicle { //class for blue icicles
	constructor(x1,y1,x2,y2,x3,y3){ //constructors to make the triangles
		this.x1 = x1;
		this.x2 = x2;
		this.x3 = x3;
		this.y1 = y1;
		this.y2 = y2;
		this.y3 = y3;
	}
	
	display(){ //show triangle
		fill(0,255,255,150); //blue + transparent
		noStroke();
		triangle(this.x1,this.y1,this.x2,this.y2,this.x3,this.y3);
	}
	
	grow(){ //extend downwards
		var icicleHeight = random(-400,0); //randomly generated except backwards (-)
		if(this.y3 < 1500){ 					//(out of canvas) so that they come in unevenly
			this.y3 = this.y3 + 1; //this pulls the y of the tip out so that it "grows"
		}
	}
}
