PImage img;

void setup(){
  size(1000,800);
  background(#52F08A);
  plots();
}

void draw(){
  
}

void plots(){
  img = loadImage("basicPlot.png");
  for (int i=0;i<1000;i+=200){
    for (int j=0;j<800;j+=100){
      image(img,i,j);
    }
  }
}
