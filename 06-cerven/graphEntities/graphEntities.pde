import java.time.Instant;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.temporal.IsoFields;

String [] raw;
ArrayList entries;
String names[] = {"person","location","general","organization"};
PFont labelFont,headerFont;
int week;

void setup(){
  size(1080,1920);
  
  labelFont = createFont("Droid Sans",9,false);
  headerFont = createFont("Caluuna",24);

  ZonedDateTime now = ZonedDateTime.ofInstant(Instant.now(), ZoneId.systemDefault());
  week = now.get(IsoFields.WEEK_OF_WEEK_BASED_YEAR);


  for(int i = 0 ; i < names.length;i++){
    raw = loadStrings("/tmp/"+names[i]+".txt");

    entries = new ArrayList();

    parse(raw);
    plot(names[i]);

    save(names[i]+"_graph.png");
  }
  noLoop();
  exit();
}

int getMax(){
  int mx = 0;
  for(int i = 0 ; i < entries.size();i++){
    Entry e = (Entry)entries.get(i);
    mx = max(e.count,mx);
  }
  return mx;
}

void parse(String [] _raw){

  for(int i = 0 ; i < _raw.length;i++){
    String line = _raw[i];
    int number = parseInt(line.substring(0,7).strip());
    String name = line.substring(8,line.length());
    println(number+" "+name);
    entries.add(new Entry(name,number));
  }


}

class Entry{
  String name;
  int count;

  Entry(String _name, int _count){
    name = _name+"";
    count = _count;
  }
}

void plot(String _title){
  background(255);
  fill(0);
  noStroke();
  textAlign(CENTER);
  textFont(headerFont);
  text("Výskyt entit typu " + _title.toUpperCase() + " na portále IRozhlas.cz - " + week +". týden",width/2,40);
  textFont(labelFont);
  pushMatrix();
  translate(100,60);
  for(int i = 0; i < entries.size();i++){
    Entry tmp = (Entry)entries.get(i);
    if(tmp.count>20){
      float val = map(tmp.count,0,getMax(),0,width-300);
      fill(0);
      textAlign(RIGHT);
      text(tmp.name,100,i*9+10);
      fill(64);
      rect(108,i*9+2,val,8);
      textAlign(LEFT);
      fill(0);
      text(tmp.count,val+112,i*9+10);
    }
  }
  popMatrix();



}


void draw(){
}

