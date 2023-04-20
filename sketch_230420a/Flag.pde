public class flag{

  int fWidth,fHeight,speed;
  PVector pos;
  int stripes;
  int currentStripe;
  int currentSecond = second();
  boolean direction = true;
  
  float currentScaleX = 1;
  float currentScaleY = 1;
  
  color[] triColors = {color(22,10,11),color(22,187,147),color(230,100,250),color(40,255,255)};
  
  flag(){
    this(100,100,6,2,0,0);
  }
  
  flag(int fWidth, int fHeight,int stripes,int speed, int x, int y){
    this.fWidth = fWidth;
    this.fHeight = fHeight;
    this.pos = new PVector(x,y);
    this.stripes = stripes;
    this.speed = speed;
  }
  
  void update(){
    fWidth ++;
  }
  
  void render(){
    currentStripe = 0;
    pushMatrix();
    
    translate(pos.x,pos.y);
    updateDirection(speed);
    
    if(direction){
      currentScaleX += speed/100.0;
      currentScaleY -= speed/100.0;
    }else{
      currentScaleX -= speed/100.0;
      currentScaleY += speed/100.0;
    }
    
    scale(currentScaleX,currentScaleY);
    print(speed);
    
    
    //Base Stripes
    for(int i = 0; i< fHeight-fHeight/6; i+= fHeight/(stripes)){
        int hue = (255/stripes)*currentStripe;
        noStroke();
        fill(hue,255,255);
        rect(0,i,fWidth,fHeight/(stripes));
        currentStripe++;
    }
    
    //Arrow Stripes
    for (int i = 0; i<4; i++){
      int interval = (fWidth/25*i);
      fill(triColors[i]);
      triangle(0,0+interval,0,fHeight-interval-(stripes-2),round(fWidth/2.3)-interval*2,fHeight/2);
    }
    
    //intersex circle
    stroke(200,255,255);
    strokeWeight(fWidth/70);
    noFill();
    circle(fWidth/14,fHeight/2,fWidth/10);
    
    popMatrix();
  }
  
  void updateSize(int newWidth,int newHeight){
    this.fWidth = newWidth;
    this.fHeight = newHeight;
  }
  
  void updateDirection(int speed){
    if(abs(currentSecond - second())>speed){
      direction = !direction;
      currentSecond = second();
    }
  }
}
