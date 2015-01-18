PImage img, basicPlot;
int[][] icors, scors;
int index, n;
int shop, buy;
String[] seeds;
String newSeed;

BasicPlot[] farm;

void setup() {
  shop=1;
  buy=1;
  size(1000, 800);
  background(#5BA751);
  farm = new BasicPlot[295];
  plots();

  //hoverSelect();
}

void draw() {
  if (shop==-1){
    shop();
    if (buy==-1){
      buy();
    }
  }else{
    background(#5BA751);
    buttonShop();
    hoverSelect();
    farming();
    grow();
  }
}

void plots() {
  img = loadImage("resized/basicplot.png");
  int x=0;
  icors=new int[276][4];

  for (int i=0; i<1000; i+=100) {
    for (int j=0; j<750; j+=50) {
      image(img, i, j);
      
      icors[x][0]=i;
      icors[x][1]=i+100;
      icors[x][2]=j;
      icors[x][3]=j+50;
      farm[x] = new BasicPlot("empty", "resized/basicplot.png", i, j);

      if (i==900) {
        x+=1;
      } else {
        x+=2;
      }

      noFill();
    }
    x--;
  }

  x=1;

  for (int a=50; a<950; a+=100) {
    for (int y=25; y<725; y+=50) {
      image(img, a, y);
      
      icors[x][0]=a;
      icors[x][1]=a+100;
      icors[x][2]=y;
      icors[x][3]=y+50;
      farm[x] = new BasicPlot("empty", "resized/basicplot.png", a, y);

      x+=2;
      noFill();
    }
    x++;
  }
}


void farming() {
  PImage plot; 
  for (int i=0; i<276; i++) {
    
    BasicPlot temp = farm[i];
    String temp2 = temp.getStatus();
    boolean temp3 = temp2.equals("plowed");
    if (farm[i].getStatus().equals("plowed")) {
      plot = loadImage(farm[i].getImgPath());
      image(plot, farm[i].getXcor(), farm[i].getYcor());
    } else {
      if (farm[i].getStatus().equals("seed")) {
        plot = loadImage(farm[i].getImgPath());
        image(plot, farm[i].getXcor(), farm[i].getYcor() - 50);
      }
    }
  }
}


boolean mouseInRng() {
  for (int i=0; i<276; i++) {
    if (((mouseX>icors[i][0]+20) && (mouseX<=icors[i][1]-20)) &&
      ((mouseY>icors[i][2]+15) && (mouseY<=icors[i][3]-15))) {
      index = i;
      return true;
    }
  }
  return false;
}

boolean mouseInBox(){
  if (((mouseX>900) && (mouseX<=940)) &&
      ((mouseY>750) && (mouseY<=775))){
        return true;
      }
  return false;
}

void hoverSelect() {
  if (mouseInRng()) {
    stroke(#FA780D);
    noFill();
    quad(icors[index][0], icors[index][2]+25, icors[index][0]+50, icors[index][2]+50, icors[index][0]+100, icors[index][2]+25, icors[index][0]+50, icors[index][2]);
  } else {
    noStroke();
  }
}

void mouseClicked() {
  if (mouseInRng() && farm[index].getStatus().equals("plowed") && (shop==1)) {
    plant(newSeed);
  }else if(mouseInRng() && farm[index].getStatus().equals("empty") && (shop==1)){
    plow();
  }else if (mouseInBox()){
    shop=shop*-1;
  }else if (mouseInSeed()){
    buy=buy*-1;
    newSeed=seeds[n];
  }
}
  



void plow() {  
  //basicPlot = loadImage("resized/basicplot.png");
  //image(basicPlot, icors[x][0], icors[x][2]);
  farm[index].setImg("resized/basicplot.png");
  farm[index].setStatus("plowed");
}

void plant(String type) {
  BasicPlot temp = new BasicPlot(farm[index].getStatus(), farm[index].getImgPath(), farm[index].getXcor(), farm[index].getYcor());
  farm[index] = new Seed(temp.getStatus(), temp.getImgPath(), temp.getXcor(), temp.getYcor(),5,100);
  farm[index].setImg("pictures/"+type+"_00.png");
  farm[index].setStatus("seed");
  //seed = loadImage(farm[index].getImgPath());
  //image(seed, farm[index].getXcor(), farm[index].getYcor() - 50);
}


void grow(){
  for (int i=0;i<276;i++){
    if (farm[i].getStatus().equals("seed")){
      if (farm[i].getType().equals("English_Pea")){
        if (second()==farm[i].getEndTime()){
          farm[i].setImg("pictures/"+farm[i].getType()+"_33.png");
          image(farm[i].getImg(),farm[i].getXcor(),farm[i].getYcor()-50);
        }
      }
    }
  }
}

void buttonShop(){
  fill(#FFFDFC);
  text("Shop",900,750);
 
  
  noStroke();
  fill(#934825);
  rect(900,750,40,25,7);
  
}

void buttonExit(){
  fill(#FFFDFC);
  text("Exit",900,750);
 
  
  noStroke();
  fill(#934825);
  rect(900,750,40,25,7);
}
void shop(){
  seeds=new String[7];
  scors=new int[7][4];
  seeds[0]="English_Pea";
  seeds[1]="Long_Onion";
  seeds[2]="Organic_Blueberries";
  seeds[3]="Super_Cranberry";
  seeds[4]="Super_Pepper";
  seeds[5]="Super_Strawberry";
  seeds[6]="White_Corn";
 
  background(#DBD873);
  buttonExit();
  int x=150;
  int y=100;
  int interval=0;
  for (int i=0;i<7;i++){
    image(loadImage("pictures/"+seeds[i]+"-icon.png"),x,y);
    scors[i][0]=x;
    scors[i][1]=x+100;
    scors[i][2]=y;
    scors[i][3]=y+100;
    x+=200;
    interval++;
    if (interval==3){
      interval=0;
      x=150;
      y+=200;
    }
  }  
}

boolean mouseInSeed(){
  for (int i=0;i<7;i++){
    if (((mouseX>scors[i][0]) && (mouseX<=scors[i][1])) &&
      ((mouseY>scors[i][2]) && (mouseY<=scors[i][3]))) {
        n=i;
        return true;
      }
  }
  return false;
}

boolean mouseInBuy(){
  if (((mouseX>200) && (mouseX<=240)) &&
      ((mouseY>750) && (mouseY<=775))){
        return true;
      }
  return false;
}
void buy(){
  fill(#FFFDFC);
  text("Buy",200,750);
 
  
  noStroke();
  fill(#934825);
  rect(200,750,40,25,7);
}

