PImage img;

void setup(){
  size(1000,800);
  background(#52F08A);
  plots();
}

void draw(){
  
}

void plots(){
  img = loadImage("resized/basicplot.png");
  for (int i=0;i<1000;i+=100){
    for (int j=0;j<800;j+=50){
      image(img,i,j);
      noFill();
      quad(i,j+25,i+50,j+50,i+100,j+25,i+50,j);
    }
  }
  for (int x=50;x<950;x+=100){
    for (int y=25;y<775;y+=50){
      image(img,x,y);
      noFill();
      quad(x,y+25,x+50,y+50,x+100,y+25,x+50,y);
    }
  }
}


