public class flag{

  int fWidth,fHeight;
  PVector pos;
  int stripes;
  int currentStripe;
  
  color[] triColors = {color(22,10,11),color(22,187,147),color(230,100,250),color(40,255,255)};
  
  flag(){
    this(100,100,6,0,0);
  }
  
  flag(int fWidth, int fHeight,int stripes, int x, int y){
    this.fWidth = fWidth;
    this.fHeight = fHeight;
    this.pos = new PVector(x,y);
    this.stripes = stripes;
  }
  
  void update(){
    fWidth ++;
  }
  
  void render(){
    currentStripe = 0;
    pushMatrix();
    
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
      triangle(0,0+interval,0,fHeight-interval,round(fWidth/2.3)-interval*2,fHeight/2);
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
}
