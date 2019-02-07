float [] nX,nY,oldX,oldY;

PImage h,v;

PGraphics buffer;

void setup(){
  size(800,800);
  colorMode(HSB,14,8,8);
  noFill();
  
  h=loadImage("h_dotted.png");
  v=loadImage("v_dotted.png");
  
  nX=new float[7];
  nY=new float[7];
  for(int i=0; i<7; i++){
    nX[i]=cos((float(i+1))*(float(frameCount)/100));
    nY[i]=sin((float(i+1))*(float(frameCount)/100));
  }
  
  buffer=createGraphics(width,height);
  buffer.beginDraw();
  buffer.colorMode(HSB,14,8,8);
  buffer.noFill();
  buffer.endDraw();
}

void keyPressed(){
  buffer.clear();
  frameCount=0;
}

void draw(){
  background(0,1,1);
  
  oldX=nX;
  oldY=nY;
  for(int i=0; i<7; i++){
    nX[i]=cos((float(i+1))*(float(frameCount)/100));
    nY[i]=sin((float(i+1))*(float(frameCount)/100));
  }
  
  tint(14,60);
  
  for(int i=0; i<width-100; i+=100){
    stroke((i/100)*2,5,8);
    noFill();
    circle(i+150,50,80);
    stroke(0,0,7);
    fill(0,0,8);
    circle(i+150+(40*nX[i/100]),50+(40*nY[i/100]),5);
    image(v,i+150+(40*nX[i/100]),50+(40*nY[i/100]));
  }
  
  for(int i=0; i<height-100; i+=100){
    noFill();
    stroke((i/100)*2,5,8);
    circle(50,i+150,80);
    stroke(0,0,7);
    fill(0,0,8);
    circle(50+(40*nX[i/100]),i+150+(40*nY[i/100]),5);
    image(h,50+(40*nX[i/100]),i+150+(40*nY[i/100]));
  }
  
  buffer.beginDraw();
  for(int x=100; x<width; x+=100){
    for(int y=100; y<height; y+=100){
      tint(14,255);
      buffer.stroke((x/100)+(y/100),5,8);
      buffer.line(x+50+(40*oldX[(x/100)-1]),y+50+(40*oldY[(y/100)-1]),x+50+(40*nX[(x/100)-1]),y+50+(40*nY[(y/100)-1]));
    }
  }
  buffer.endDraw();
  image(buffer,0,0);
}
