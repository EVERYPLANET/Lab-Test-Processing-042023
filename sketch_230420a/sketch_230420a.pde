void setup(){
  size(1600,900);
  colorMode(HSB);
  newFlag = new flag(200,100,6,0,0);
  
  
}

flag newFlag;

void draw(){
  newFlag.render();

}
