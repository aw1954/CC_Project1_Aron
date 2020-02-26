void setup() {
  size(500,400);
  background(#eeeeee); //make this color darker
}

void draw(){
  background(#eeeeee);
  pupil();
  shutter1();
  shutter2();
}

void shutter1 (){ //top lid
  fill(#eeeeee);//match to bg
  noStroke();
  quad(230,190,230,170,270,170,270,190);
}

void shutter2 (){ //bottom lid
//  fill(#eeeeee);
  noStroke();
  quad(230,230,230,210,270,210,270,230);
}

void pupil (){ //middle circle
  fill(#6E4513); //brown
  ellipse(width/2,height/2,20,20);
  noStroke();
}

//basically make shutters move up/down like blinks
//pupil disappears, then appears again scaled bigger
//scaled bigger twice more w no transition, then disappears
//bg steadily gets more white
//tiny red dots randomizing around the edgelike a vignette
//blue shards "growing" down screen like ice
//made up of large rectangle lined with irregular triangles
//red "heartbeat" fuzzy circle in the middle fades in
//starts beating faster & faster
//bg gets darker with each beat 
//(possibly starting from the corners in?)
