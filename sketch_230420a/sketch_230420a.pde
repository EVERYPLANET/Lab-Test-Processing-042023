void setup(){
  size(1600,900);
  colorMode(HSB);
  newFlag = new flag(200,100,6,1,0,0);
  
  
}

flag newFlag;

void draw(){
  background(255);
  newFlag.render();

}
