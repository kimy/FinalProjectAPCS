PImage img;
int[][] icors;

void setup(){
  size(1000,800);
  background(#52F08A);
  plots();
}

void draw(){
  setup();
  mouseInRng();
}

void plots(){
  img = loadImage("resized/basicplot.png");
  int index=0;
  icors=new int[1000][4];
  for (int i=0;i<1000;i+=100){
    for (int j=0;j<800;j+=50){
      image(img,i,j);
      icors[index][0]=i;
      icors[index][1]=i+100;
      icors[index][2]=j;
      icors[index][3]=j+50;
      index+=2;
      noFill();
     // quad(i,j+25,i+50,j+50,i+100,j+25,i+50,j);
    }
  }
  index=1;
  for (int x=50;x<950;x+=100){
    for (int y=25;y<775;y+=50){
      image(img,x,y);
      icors[index][0]=x;
      icors[index][1]=x+100;
      icors[index][2]=y;
      icors[index][3]=y+50;
      index+=2;
      noFill();
     // quad(x,y+25,x+50,y+50,x+100,y+25,x+50,y);
    }
  }
}



void mouseInRng(){
  for (int[] element : icors){
    if (((mouseX>element[0]) && (mouseX<=element[1])) &&
        ((mouseY>element[2]) && (mouseY<=element[3]))){
          stroke(#FA780D);
          quad(element[0],element[2]+25,element[0]+50,element[2]+50,element[0]+100,element[2]+25,element[0]+50,element[2]);
          break;
        }
  }
}





