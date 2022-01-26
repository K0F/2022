


void setup(){
  size(1280,1024);
  rectMode(CENTER);

}



void draw(){
  float x = pow((sin(millis()/1000.0*TAU/(121.35/120.0*24.0))+1.0),20.0)*height/2.0;

  background(0);
  rect(width/2.0,x,width,300);


}
