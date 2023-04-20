void setup(){
  frameRate(60);
  size(1000,900);
  colorMode(HSB);
  
  //Create the ArrayList and populate it
  for (int i = 0; i <= numberOfFlags; i++){
    flag newFlag = new flag(round(random(170,200)),round(random(130,150)),6,random(0,2),round(random(0,width)),round(random(0,height)),round(random(-1,1)));
    newFlag.initialiseDimensions(width,height);
    flags.add(newFlag);
  }
}

//variables
flag newFlag;
int numberOfFlags = 20;
ArrayList<flag> flags = new ArrayList<flag>();



void draw(){
  //background hue
  float hue = frameCount%255;
  background(hue,80,255);
  
  //render flags
  for(int i = 0; i <= numberOfFlags; i++){
    flags.get(i).render();
  }
  
  
  //text
  fill(255);
  textSize(100);
  text("Happy Pride",100,100);
  textSize(30);
  text("In April",550,150);
}
