
boolean DEBUG = false;
int MODE = 0; // 0 = Tags, 1 = Entities


String raw[];
Tag[] tags;
PFont font;


void setup(){
  size(800,1080);

  if(MODE==0)
    raw = loadStrings("/tmp/tags.txt");

  if(MODE==1)
    raw = loadStrings("/tmp/entities.txt");

  tags = scrape(raw);

  font = createFont("Calluna",127,true);
  textAlign(CENTER);
}

void draw(){
  background(255);

  fill(0,5);

  for(int i = 0 ; i < tags.length;i++){
    textFont(font,pow(tags[i].relevance,1.33)+10);
    fill(0,255-tags[i].relevance*10);
    text(tags[i].word,width/2,height-(tags[i].relevance*30));
  }

}

boolean sel(int _mode, String _input){


  switch(_mode){
    case 0:
      if((_input.indexOf("Tag")>-1 && _input.indexOf("relevance")>-1))
        return true;
    case 1:
      if((_input.indexOf("Entity")>-1) )
        return true;
      break;
  }
  return false;
}

void keyPressed(){
  save("screenshot.png");
}

Tag[] scrape(String [] _input){
  ArrayList tmp = new ArrayList();

  int counter = 0;
  for(int i = 0; i < _input.length;i++){
    String [] line = splitTokens(_input[i],",");

    for(int ii= 0 ; ii < line.length;ii++){
      String name = "";
      String val = "";


      if(sel(MODE,line[ii])){
        String zlom[] = splitTokens(line[ii],"\"'=></\t\n, ");
        if(DEBUG){
          println(line[ii]);
          println(zlom);
        }

        if(MODE==0){
          val = zlom[4];
          name = zlom[5];
          tmp.add(new Tag(name,val,true));
        }else if(MODE == 1){
          val = zlom[5];
          name = zlom[4];
          tmp.add(new Tag(name,val));

        }
      }

    }
  }


  Tag[] tmptags = new Tag[tmp.size()];
  for(int i = 0 ; i < tmp.size();i++)
    tmptags[i] = (Tag)tmp.get(i);

  println("Parse ok, got "+tmptags.length+" tags");
  return tmptags;

}


class Tag{
  String word;
  int type;
  float relevance;

  Tag( String _word,String _type){
    if(_type.equals("number"))
      type = 0;
    if(_type.equals("date"))
      type = 1;
    if(_type.equals("location"))
      type = 2;
    if(_type.equals("person"))
      type = 3;
    if(_type.equals("general"))
      type = 4;
    if(_type.equals("organization"))
      type = 5;

    word = _word;
  }

  Tag(String _word,String _relevance,boolean istag){
    word = _word+"";
    relevance = parseFloat(_relevance);
  }
}
