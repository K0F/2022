


void setup(){
  size(320,240);
  background(0);

}




void draw(){

  loadPixels();
 
  int cnt = 0;
  for(int x=0,y=0 ; cnt<width*height ; x++, y++){
    int idx = y*width+x;
    if(pixels[idx] != 0){
    pixels[idx]=color(255);
    }else{
    pixels[idx]=0;
    };
    cnt++;
  }


  updatePixels();





}
