void setup(){
  frameRate(60);
  size(1000,900);
  colorMode(HSB);
  
  
  for (int i = 0; i <= numberOfFlags; i++){
    flags.add(new flag(round(random(170,200)),round(random(130,150)),6,random(0,2),round(random(0,width)),round(random(0,height)),round(random(-1,1))));
  }
}

flag newFlag;
int numberOfFlags = 10;
ArrayList<flag> flags = new ArrayList<flag>();

void draw(){
  background(255);
  for(int i = 0; i <= numberOfFlags; i++){
    flags.get(i).render();
    flags.get(i).initialiseDimensions(width,height);
  }
  print(flags.get(0).pos.x);
}
