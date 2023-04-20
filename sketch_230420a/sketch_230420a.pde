void setup(){
  frameRate(60);
  size(600,600);
  colorMode(HSB);
  //newFlag = new flag(200,100,6,1,100,100);
  
  for (int i = 0; i <= numberOfFlags; i++){
    flags.add(new flag(round(random(150,200)),round(random(100,150)),6,round(random(1,3)),round(random(0,width)),round(random(0,height)),round(random(-1,1))));
  }
}

flag newFlag;
int numberOfFlags = 6;
ArrayList<flag> flags = new ArrayList<flag>();

void draw(){
  background(255);
  for(int i = 0; i <= numberOfFlags; i++){
    flags.get(i).render();
  }

}
