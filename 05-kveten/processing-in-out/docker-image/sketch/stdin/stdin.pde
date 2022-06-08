ArrayList input;

boolean RENDER = false;

class KeyVal{
  String key,val;
  
  KeyVal(String _key, String _val){
    key=_key+"";
    val=_val+"";
  }

  float floatVal(){
    return parseFloat(val);
  }
}

void setup() {
  parseArgs();
  size(320,240);
  PGraphics g = createGraphics(width,height,JAVA2D);  

  textFont(createFont("Semplice Regular",8));
}

void parseArgs(){
  input = new ArrayList();
  println(args.length);
  if (args != null) {
    for (int i = 0; i < args.length;i+=2) {
      String[] key = splitTokens(args[i],"- ");
      String[] val = splitTokens(args[i+1]," ");
      try{
        KeyVal pair = new KeyVal(key[0],val[0]);
        input.add(pair);
      }catch(Exception e){
        println(e);
      }
    }
  } else {
    println("args == null");
  }
}

void draw(){

  background(0);
  fill(255);

  for(int i = 0 ;i < input.size();i++){
    KeyVal tmp = (KeyVal)input.get(i);
    fill((sin(TAU*(RENDER?frameCount/60.0:millis()/1000.0)*tmp.floatVal())+1)*127.0);
    text(tmp.key + "=" + tmp.val,20,i*10+20);
  }

}

