PImage img, basicPlot;
int[][] icors;
int x;
String[][] pics;
boolean placed;

void setup(){
  size(1000,800);
  background(#52F08A);
  plots();
  if (placed){
    image(basicPlot, icors[x][0], icors[x][2]);
  }
}

void draw(){
  setup();
  hoverSelect();
}

BasicPlot a = new BasicPlot("plowed", "resized/basicplot.png");

void plots(){
  setPics();
  img = loadImage(a.getImgPath());
  int index=0;
  icors=new int[500][4];
  for (int i=0;i<1000;i+=100){
    for (int j=0;j<800;j+=50){
      //image(img,i,j);
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
      //image(img,x,y);
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


boolean mouseInRng(){
  for (int i=0;i<500;i++){
    if (((mouseX>icors[i][0]+30) && (mouseX<=icors[i][1]-30)) &&
        ((mouseY>icors[i][2]+15) && (mouseY<=icors[i][3]-15))){
          x = i;
          return true;
        }
  }
  //x = 0;
  return false;
}

void hoverSelect(){
  if (mouseInRng()){
    stroke(#FA780D);
    quad(icors[x][0],icors[x][2]+25,icors[x][0]+50,icors[x][2]+50,icors[x][0]+100,icors[x][2]+25,icors[x][0]+50,icors[x][2]);
  }
}

void mouseClicked(){
  if (mouseInRng()){
    stroke(#FA780D);
    basicPlot = loadImage("resized/basicplot.png");
    placed=true;
    //quad(icors[x][0],icors[x][2]+25,icors[x][0]+50,icors[x][2]+50,icors[x][0]+100,icors[x][2]+25,icors[x][0]+50,icors[x][2]);
  }
}

void setPics(){
  pics=new String[6][6];
  for (int i=0;i<5;i++){
    pics[i][0]="resized/field_bean_";
    pics[i][1]="resized/long_onion_";
    pics[i][2]="resized/super_cranberry_";
    pics[i][3]="resized/super_pepper_";
    pics[i][4]="resized/super_strawberry_";
    pics[i][5]="resized/white_corn_";
  }
  for (int j=0;j<5;j++){
    pics[0][j]+="00.png";
    pics[1][j]+="33.png";
    pics[2][j]+="66.png";
    pics[3][j]+="100.png";
    pics[4][j]+="extra100.png";
  }
}



