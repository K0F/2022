

float fr = 28.9352;
boolean render = true;

void setup(){
  size(720,576);
  frameRate(fr);
  textFont(createFont("Calluna",16,true));
  textAlign(CENTER);
}


void draw(){
  background(0);

  rectMode(CENTER);
  pushMatrix();
  translate(width/2,height/2-50);
  rotate(map(frameCount,0,fr,-PI,PI));
  if(frameCount%2==0)
    rect(0,0,30,30);
  popMatrix();
  fill(255);

  text(frameCount,width/2,height/2);

  if(render){
    saveFrame("render/fr######.tga");

    if(frameCount>=6000)
      exit();
  }
}
