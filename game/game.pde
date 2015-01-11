PImage img;

void setup(){
  size(1000,800);
  background(#52F08A);
  plots();
}

void draw(){
  
}

void plots(){
  img = loadImage("pictures/basicPlot.png");
  for (int i=0;i<1000;i+=200){
    for (int j=0;j<800;j+=100){
      image(img,i,j);
    }
  }
  for (int x=100;x<900;x+=200){
    for (int y=50;y<750;y+=100){
      image(img,x,y);
    }
  }
}


