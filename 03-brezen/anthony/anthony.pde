
Dvorak dvorak;
String input;

void setup(){
  size(640,480);
  dvorak = new Dvorak();
  textFont(createFont("Calluna",24));
}

void keyPressed(){
  dvorak.input+=""+key;
  if(keyCode==BACKSPACE && dvorak.input.length()>1)
    dvorak.input=dvorak.input.substring(0,dvorak.input.length()-1);
}

void draw(){
  background(0);
  dvorak.draw();
}

class Dvorak{
  char[] X = {'A','E','I','Y','O','U','Ǎ','É','Í','Ý','Ó','Ú','Ů'}; // 13
  char[] Y = {'H','K','R','D','T','N','Ž','Š','Č','Ř','C','J','Ď','Ť','Ň','B','F','L','M','P','S','V','Z','G','Q','W','X'}; // 28
  String input = "";
  ArrayList uhly;

  Dvorak(){
    input = "";
    uhly = new ArrayList();
  }

  int identify(char _c){
    for(int i = 0; i < X.length;i++){
      if(_c==X[i] || _c==((X[i]+"").toLowerCase()).charAt(0))
        return i;
    }

    for(int i = 0; i < Y.length;i++){
      if(_c==Y[i] || _c==((Y[i]+"").toLowerCase()).charAt(0))
        return i+13;
    }
    return -1;
  }

  void add(char k){
    if(k>20&&k<64)
      input = ""+input+k;
  }

  void draw(){
    fill(255);
    stroke(255);
    textAlign(CENTER);
    text(input,width/2,height/2+20);
    translate(width/2,height/2-20);
    String words[] = splitTokens(input," ");
    pushMatrix(); 
    for(int ii = 0 ; ii < words.length;ii++){
      translate(textWidth(words[ii])/2+16,0);
      pushMatrix();
      int lastcc =0;
      int cc=0;
      for(int i = 0 ; i < words[ii].length();i++){
        char tmp = (char)words[ii].charAt(i);
        lastcc = cc; 

        cc = identify(tmp);

        int diff = (lastcc-cc);
        if(cc<13){
          rotate(radians(180)/(diff+1.0)-HALF_PI);
          stroke(255,120);
          line(0,(100.0/diff)*2.0,0,0);
          translate(0,-(100.0/diff)*2.0);
        }else{
          rotate(radians(180)/(diff+1.0)+HALF_PI);
          stroke(255);
          translate(0,(100.0/diff)*2.0);
          line(0,(100.0/diff)*2.0,0,0);
        }
      }
      popMatrix();
    }
    popMatrix();
  }
}

