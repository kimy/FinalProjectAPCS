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
      noFill();
      quad(i,j+50,i+100,j+100,i+200,j+50,i+100,j);
    }
  }
  for (int x=100;x<900;x+=200){
    for (int y=50;y<750;y+=100){
      image(img,x,y);
      noFill();
      quad(x,y+50,x+100,y+100,x+200,y+50,x+100,y);
    }
  }
}


