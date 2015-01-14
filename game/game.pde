PImage img, basicPlot;
int[][] icors;
int x;
BasicPlot[] farm = new BasicPlot[320];

void setup() {
  size(1000, 800);
  background(#5BA751);
  plots();
  //hoverSelect();
}

void draw() {
  setup();
  //size(1000, 800);
  //background(#5BA751);
  //plots();
  hoverSelect();
}

void plots() {
  //img = loadImage("resized/basicplot.png");
  int index=0;
  icors=new int[320][4];

  for (int i=0; i<1000; i+=100) {
    for (int j=0; j<800; j+=50) {
      //image(img,i,j);
      icors[index][0]=i;
      icors[index][1]=i+100;
      icors[index][2]=j;
      icors[index][3]=j+50;
      farm[index] = new BasicPlot("empty", "revised/basicplot.png", i, j);
      index+=2;
      noFill();
      // quad(i,j+25,i+50,j+50,i+100,j+25,i+50,j);
    }
  }

  index=1;

  for (int x=50; x<950; x+=100) {
    for (int y=25; y<775; y+=50) {
      //image(img,x,y);
      icors[index][0]=x;
      icors[index][1]=x+100;
      icors[index][2]=y;
      icors[index][3]=y+50;
      farm[index] = new BasicPlot("empty", "revised/basicplot.png", x, y);
      index+=2;
      noFill();
      // quad(x,y+25,x+50,y+50,x+100,y+25,x+50,y);
    }
  }
}


boolean mouseInRng() {
  for (int i=0; i<320; i++) {
    if (((mouseX>icors[i][0]+20) && (mouseX<=icors[i][1]-20)) &&
      ((mouseY>icors[i][2]+15) && (mouseY<=icors[i][3]-15))) {
      x = i;
      return true;
    }
  }
  return false;
}

void hoverSelect() {
  if (mouseInRng()) {
    stroke(#FA780D);
    quad(icors[x][0], icors[x][2]+25, icors[x][0]+50, icors[x][2]+50, icors[x][0]+100, icors[x][2]+25, icors[x][0]+50, icors[x][2]);
  } else {
    noStroke();
  }
}

void mouseClicked() {
  if (mouseInRng()) {
    //stroke(#FA780D);
    plow();
    //quad(icors[x][0],icors[x][2]+25,icors[x][0]+50,icors[x][2]+50,icors[x][0]+100,icors[x][2]+25,icors[x][0]+50,icors[x][2]);
  }
}

void plow() {  
  basicPlot = loadImage("resized/basicplot.png");
  image(basicPlot, icors[x][0], icors[x][2]);
  farm[x].setImg("resized/basicplot.png");
  farm[x].setStatus("plowed");
}

