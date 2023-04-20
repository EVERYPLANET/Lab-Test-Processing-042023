public class flag{

  
  //variables
  int fWidth,fHeight;
  float speed;
  PVector pos;
  int stripes;
  int currentStripe;
  int currentSecond = second();
  boolean direction = true;
  int leftRight = 1;
  float pie = 0;
  
  int wWidth,wHeight;
  
  float currentScaleX = 1;
  float currentScaleY = 1;
  
  color[] triColors = {color(22,10,11),color(22,187,147),color(230,100,250),color(40,255,255)};
  
  /////////////////////////////////////////////////////////////////////////////////////////////
  
  //default constructor
  flag(){
    this(100,100,6,2,0,0,1);
  }
  
  //constructor
  flag(int fWidth, int fHeight,int stripes,float speed, int x, int y, int leftRight){
    this.fWidth = fWidth;
    this.fHeight = fHeight;
    this.pos = new PVector(x,y);
    this.stripes = stripes;
    this.speed = speed;
    this.leftRight = leftRight;
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////////
  
  //render
  void render(){
    currentStripe = 0;
    pie += PI/160;
    if(pie >= PI*2){
      pie = 0;
    }
    
    pushMatrix();
    
    //transaltions-----------------------------------------------------------------//////////
    updatePosition();
    translate(pos.x - fWidth/2,pos.y - fHeight/2);
    updateDirection(speed);
    
    if(direction){
      currentScaleX += (sin(pie)/140);
      currentScaleY -= (cos(pie)/100);
    }else{
      currentScaleX -= sin(pie)/100;
      currentScaleY += cos(pie)/100;
    }
    
    scale(currentScaleX,currentScaleY);
    
    //------------------------------------------------------------------------------//////////
    
    
    //Base Stripes------------------------------------------------------------------//////////
    for(int i = 0; i< fHeight-fHeight/6+5; i+= fHeight/(stripes)){
        int hue = (255/stripes)*currentStripe;
        noStroke();
        fill(hue,255,255);
        rect(0,i,fWidth,fHeight/(stripes));
        currentStripe++;
    }
    
    //------------------------------------------------------------------------------//////////
    
    //Arrow Stripes-----------------------------------------------------------------//////////
    for (int i = 0; i<4; i++){
      int interval = (fWidth/25*i);
      fill(triColors[i]);
      triangle(0,0+interval,0,fHeight-interval-(stripes-2),round(fWidth/2.3)-interval*2,fHeight/2);
    }
    
    //------------------------------------------------------------------------------//////////
    
    //intersex circle--------------------------------------------------------------//////////
    stroke(200,255,255);
    strokeWeight(fWidth/70);
    noFill();
    circle(fWidth/14,fHeight/2,fWidth/10);
    
    //------------------------------------------------------------------------------//////////
    
    popMatrix();
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////////
  
    //used to initialise canvas height
  void initialiseDimensions(int wWidth,int wHeight){
    this.wWidth = wWidth;
    this.wHeight = wHeight;
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////////
  
  //updates the direction of the contortions of the flags
  void updateDirection(float speed){
    if(abs(currentSecond - second())>speed){
      direction = !direction;
      currentSecond = second();
    }
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////////
  
  //updates the positions of the flags, also wraps them when off screen
  void updatePosition(){
    pos = new PVector(pos.x + 0.5, pos.y + 1);
    if(pos.x > wWidth + fWidth || pos.y > wHeight + fHeight){
      pos = new PVector(random(-100,wWidth), random(-100,wHeight/2));
    }
  }
}
