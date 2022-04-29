
/**
Coded by Kof @ 
Fri Apr 29 09:08:12 PM CEST 2022
   ,dPYb,                  ,dPYb,
   IP'`Yb                  IP'`Yb
   I8  8I                  I8  8I
   I8  8bgg,               I8  8'
   I8 dP" "8    ,ggggg,    I8 dP
   I8d8bggP"   dP"  "Y8ggg I8dP
   I8P' "Yb,  i8'    ,8I   I8P
  ,d8    `Yb,,d8,   ,d8'  ,d8b,_
  88P      Y8P"Y8888P"    PI8"8888
                           I8 `8,
                           I8  `8,
                           I8   8I
                           I8   8I
                           I8, ,8'
                            "Y8P'
*/

int interval = 30;
boolean render = true;
Agent a;


void setup(){
  size(1920,1080);
  a = new Agent(0);


}

void draw(){
  a.draw();

  if(render)
    saveFrame("output/fr######.tga");

  if(frameCount%interval==0)
    a.randomize();
}

void mousePressed(){
  a.randomize();

}


class Agent{
  int id;
  boolean bits[];
  color c[];
  float rot = 0;

  Agent(int _id){
    id = _id;
    bits = new boolean[48];
    c = new color[2];
    randomize();
  }

  void randomize(){
    for(int i = 0;i < bits.length/2; i++){
      if(random(1000)>500){
        bits[i]=true;
        bits[i+24]=false;
      }else{
        bits[i]=false;
        bits[i+24]=true;
      }
    }
    c[0] = barva(0);
    c[1] = barva(24);

  }

  void draw(){
    rot+=radians(360/30.0/24.0);
    noStroke();
    fill(c[0]);
    rect(0,0,width/2,height);
    fill(c[1]);
    arc(width/2,height/2,1080/2,1080/2,PI+rot,TWO_PI+rot);
    
    fill(c[1]);
    rect(width/2,0,width/2,height);
    fill(c[0]);
    arc(width/2,height/2,1080/2,1080/2,0+rot,PI+rot);
  }


  int barva(int offset){

    String _tmp = "";
    for(int i = 0+offset ; i < 8+offset ; i++){
      if(bits[i])
        _tmp+="1";
      else
        _tmp+="0";
    }
    int R = unbinary(_tmp);

    _tmp = "";
    for(int i = 8+offset ; i < 16+offset ; i++){
      if(bits[i])
        _tmp+="1";
      else
        _tmp+="0";
    }
    int G = unbinary(_tmp);

    _tmp = "";
    for(int i = 16+offset ; i < 24+offset ; i++){
      if(bits[i])
        _tmp+="1";
      else
        _tmp+="0";
    }
    int B = unbinary(_tmp);

    return (int)color(R,G,B);
  }


}

