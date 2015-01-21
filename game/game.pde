PImage img, basicPlot, plowTool, harvestTool;
int[][] icors, scors;
int index, n;
int shop, buy, done, myHarvest, totalProfit, money, exp, expTemp, level;
String[] seeds;
String newSeed, harvestedSeed;
boolean bought, harvestSelected;
ArrayList<PImage> crops;

BasicPlot[] farm;

void setup() {
  cursor(HAND);
  setBooleans();
  money=10000;
  level=1;
  size(1000, 800);
  background(#5BA751);
  farm = new BasicPlot[295];
  plots();

  //hoverSelect();
}

void draw() {
  if (shop==-1) {
    shop();
    if (buy==-1) {
      buy();
    }
  } else if (myHarvest==1) {
    myHarvest();

    if (totalProfit==0) {
      background(#DBD873);
    }
    sell();
  } else {
    background(#5BA751);
    plower();
    harvester();
    buttonShop();
    buttonHarvest();
    hoverSelect();
    farming();
    grow();
    levelup();
  }
  stats();
}

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


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
    } else if (farm[i].getStatus().equals("seed")) {
      plot = loadImage(farm[i].getImgPath());
      image(plot, farm[i].getXcor(), farm[i].getYcor() - 50);
    }
  }
}

void hoverSelect() {
  if (mouseInRng()) {
    if (farm[index].getStatus().equals("empty")) {
      if (done==1) {
        if (harvestSelected) {
          invalidSpace();
        } else {
          neutralSpace();
        }
      } else {
        if (done==-1) {
          validSpace();
        }
      }
    } else {
      if (farm[index].getStatus().equals("plowed")) {
        if (done==1) {
          if (harvestSelected) {
            invalidSpace();
          } else {
            neutralSpace();
          }
        } else {
          if (done==-1) {
            invalidSpace();
          }
        }
      } else {
        if (farm[index].getStatus().equals("100")) {
          if (harvestSelected) {
            validSpace();
          }
        } else {
          if (farm[index].getStatus().equals("withered") ){
            if (harvestSelected) {
              validSpace();
            }
          }
        }
      }
    }
  }
}


    //-----------------------------------------------------------------------------------------------------------------------------------------------------------------------


    void plow() {  
      //basicPlot = loadImage("resized/basicplot.png");
      //image(basicPlot, icors[x][0], icors[x][2]);
      farm[index].setImg("resized/basicplot.png");
      farm[index].setStatus("plowed");
      exp += 20;
    }

    void plant(String type) {
      BasicPlot temp = new BasicPlot(farm[index].getStatus(), farm[index].getImgPath(), farm[index].getXcor(), farm[index].getYcor());
      farm[index] = new Seed(temp.getStatus(), temp.getImgPath(), temp.getXcor(), temp.getYcor(), 30, type);
      farm[index].setImg("pictures/"+type+"_00.png");
      farm[index].setStatus("seed");
      farm[index].setVal(300+100*n);
      farm[index].setEXP(100+100*n);
      exp += 50;
      //seed = loadImage(farm[index].getImgPath());
      //image(seed, farm[index].getXcor(), farm[index].getYcor() - 50);
    }


    void grow() {
      for (int i=0; i<276; i++) {
        if ((second()>=farm[i].getEndTime()-25) && (farm[i].getStatus().equals("seed"))) {
          farm[i].setStatus("33");
        } 
        if (farm[i].getStatus()=="33") {
          println(1);
          farm[i].setImg("pictures/"+farm[i].getType()+"_33.png");
          image(farm[i].getImg(), farm[i].getXcor(), farm[i].getYcor()-50);
        }
        if ((second()>=farm[i].getEndTime()-20) && (farm[i].getStatus()=="33")) {
          farm[i].setStatus("66");
        }
        if (farm[i].getStatus()=="66") {
          println(2);
          farm[i].setImg("pictures/"+farm[i].getType()+"_66.png");
          image(farm[i].getImg(), farm[i].getXcor(), farm[i].getYcor()-50);
        }
        if ((second()>=farm[i].getEndTime()-15) && (farm[i].getStatus()=="66")) {
          farm[i].setStatus("100");
        }
        if (farm[i].getStatus()=="100") {
          println(3);
          farm[i].setImg("pictures/"+farm[i].getType()+"_100.png");
          image(farm[i].getImg(), farm[i].getXcor(), farm[i].getYcor()-50);
        }

        if ((second()>= farm[i].getEndTime()) && (farm[i].getStatus()=="100")) {
          farm[i].setStatus("withered");
        }

        if (farm[i].getStatus() =="withered") {
          println(4);
          farm[i].setImg("pictures/"+farm[i].getType()+"_withered.png");
          image(farm[i].getImg(), farm[i].getXcor(), farm[i].getYcor()-50);
        }
      }
    }

    void harvest() {
      if (farm[index].getStatus() == "100") {
        harvestedSeed=farm[index].getType();
        println(harvestedSeed);
        PImage ptemp=loadImage("pictures/"+harvestedSeed+"_Bushel-icon.png");

        crops.add(ptemp);
        totalProfit+=farm[index].getVal();
        expTemp=farm[index].getEXP();
        BasicPlot temp=new BasicPlot("empty", "resized/basicplot.png", farm[index].getXcor(), farm[index].getYcor());
        farm[index]=new BasicPlot("empty", "resized/basicplot.png", temp.getXcor(), temp.getYcor());
        exp+=expTemp;
      } else {
        //if withered
        if (farm[index].getStatus() == "withered") {
          exp += 5;
          BasicPlot a = new BasicPlot("plowed", "resized/basicplot.png", farm[index].getXcor(), farm[index].getYcor());
          farm[index] = new BasicPlot("plowed", "resized/basicplot.png", a.getXcor(), a.getYcor());
        }
      }
    }



    //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    void plower() {
      plowTool=loadImage("pictures/plow.png");
      image(plowTool, 350, 750);
    }

    void harvester() {
      harvestTool=loadImage("pictures/harvest.png");
      harvestTool.resize(0, 70);
      image(harvestTool, 400, 730);
    }



    boolean mouseInPlow() {
      if (((mouseX>350) && (mouseX<=387)) &&
        ((mouseY>750) && (mouseY<=798))) {
        return true;
      }
      return false;
    }

    boolean mouseInHarvest() {
      if (((mouseX>400) && (mouseX<=440)) &&
        ((mouseY>730) && (mouseY<=800))) {
        return true;
      }
      return false;
    }

    boolean mouseInHarvestButton() {
      if (((mouseX>800) && (mouseX<=840)) &&
        ((mouseY>750) && (mouseY<=775))) {
        return true;
      }
      return false;
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

    boolean mouseInBox() {
      if (((mouseX>900) && (mouseX<=940)) &&
        ((mouseY>750) && (mouseY<=775))) {
        return true;
      }
      return false;
    }



    //lights up the space green
    void validSpace() {
      stroke(#14F524);
      strokeWeight(3);
      noFill();
      quad(icors[index][0], icors[index][2]+25, icors[index][0]+50, icors[index][2]+50, icors[index][0]+100, icors[index][2]+25, icors[index][0]+50, icors[index][2]);
    }

    //lights up the space red
    void invalidSpace() {
      stroke(#F51436);
      strokeWeight(3);
      noFill();
      quad(icors[index][0], icors[index][2]+25, icors[index][0]+50, icors[index][2]+50, icors[index][0]+100, icors[index][2]+25, icors[index][0]+50, icors[index][2]);
    }

    //lights up the space yellow
    void neutralSpace() {
      stroke(#FAFF08);
      strokeWeight(3);
      noFill();
      quad(icors[index][0], icors[index][2]+25, icors[index][0]+50, icors[index][2]+50, icors[index][0]+100, icors[index][2]+25, icors[index][0]+50, icors[index][2]);
    }


    void mouseClicked() {
      if (mouseInRng() && farm[index].getStatus().equals("plowed") && (shop==1) && (bought) && (myHarvest==-1)) {
        plant(newSeed);
        bought=false;
      } else if (mouseInPlow() && (done==1) && (myHarvest==-1)) {
        cursor(plowTool);
        done=-1;
      } else if (mouseInPlow() && (myHarvest==-1)) {
        cursor(HAND);
        done=1;
      } else if (mouseInHarvest() && (!harvestSelected)) {
        cursor(harvestTool);
        harvestSelected=true;
      } else if (mouseInHarvest()) {
        cursor(HAND);
        harvestSelected=false;
      } else if (mouseInRng() && farm[index].getStatus().equals("empty") && (shop==1) && (done==-1) && (myHarvest==-1)) {
        plow();
      } else if (mouseInRng() && (shop==1) && (done==1) && (myHarvest==-1) && (harvestSelected)) {

        harvest();
      } else if (mouseInHarvestButton() && (done==1) && (!harvestSelected)) {
        myHarvest=myHarvest*-1;
      } else if (mouseInBuySell() && (buy==1)) {
        money+=totalProfit;
        totalProfit=0;
        crops.clear();
      } else if (mouseInBox() && (done==1) && (myHarvest==-1)) {
        shop=shop*-1;
        buy=1;
      } else if ((shop==-1) && (mouseInSeed())) {
        buy=-1;
      } else if (mouseInBuySell() && (buy==-1)) {
        newSeed=seeds[n];
        buy=1;
        bought=true;
        destroyWallet(newSeed);
      }
    }



    void myHarvest() {

      background(#DBD873);

      int x=150;
      int y=100;
      int interval=0;
      for (int i=0; i<crops.size (); i++) {
        image(crops.get(i), x, y);
        x+=200;
        interval++;
        if (interval==3) {
          interval=0;
          x=150;
          y+=100;
        }
      }
      /*
  for (int i=0;i<276;i++){
       
       if (farm[i].getStatus()=="harvested"){
       
       image(temp,x,y);
       x+=200;
       interval++;
       if (interval==3){
       interval=0;
       x=150;
       y+=100;
       }
       }
       }*/
    }


    void buttonExit2() {
      fill(#FFFDFC);
      text("Exit", 800, 750);


      noStroke();
      fill(#934825);
      rect(800, 750, 40, 25, 7);
    }

    void buttonHarvest() {
      fill(#FFFDFC);
      text("Harvest", 800, 750);

      noStroke();
      fill(#934825);
      rect(800, 750, 40, 25, 7);
    }

    void buttonShop() {
      fill(#FFFDFC);
      text("Shop", 900, 750);


      noStroke();
      fill(#934825);
      rect(900, 750, 40, 25, 7);
    }

    void buttonExit() {
      fill(#FFFDFC);
      text("Exit", 900, 750);


      noStroke();
      fill(#934825);
      rect(900, 750, 40, 25, 7);
    }
    void shop() {
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
      for (int i=0; i<7; i++) {
        image(loadImage("pictures/"+seeds[i]+"-icon.png"), x, y);
        text(seeds[i], x, y);
        scors[i][0]=x;
        scors[i][1]=x+100;
        scors[i][2]=y;
        scors[i][3]=y+100;
        x+=200;
        interval++;
        if (interval==3) {
          interval=0;
          x=150;
          y+=200;
        }
      }
    }

    boolean mouseInSeed() {
      for (int i=0; i<7; i++) {
        println(i);
        int temp=scors[i][0];
        if (((mouseX>scors[i][0]) && (mouseX<=scors[i][1])) &&
          ((mouseY>scors[i][2]) && (mouseY<=scors[i][3]))) {
          n=i;
          return true;
        }
      }
      return false;
    }

    boolean mouseInBuySell() {
      if (((mouseX>600) && (mouseX<=640)) &&
        ((mouseY>750) && (mouseY<=775))) {
        return true;
      }
      return false;
    }

    void buy() {
      fill(#FFFDFC);
      text("Buy", 600, 750);


      noStroke();
      fill(#934825);
      rect(600, 750, 40, 25, 7);
    }

    void sell() {
      fill(#FFFDFC);
      text("Sell All", 600, 750);


      noStroke();
      fill(#934825);
      rect(600, 750, 40, 25, 7);
      buttonExit2();
    }

    void clearance() {
      background(#DBD873);
    }


    void destroyWallet(String type) {
      if (type=="English_Pea") {
        money-=100;
      } else if (type=="Long_Onion") {
        money-=200;
      } else if (type=="Organic_Blueberries") {
        money-=300;
      } else if (type=="Super_Cranberry") {
        money-=400;
      } else if (type=="Super_Pepper") {
        money-=500;
      } else if (type=="Super_Strawberry") {
        money-=600;
      } else if (type=="White_Corn") {
        money-=700;
      }
    }

    void levelup() {
      if (exp>=level*1000) {
        exp=exp-level*1000;
        level+=1;
        money += 1000;
      }
    }

    void setBooleans() {
      shop=1;
      buy=1;
      done=1;
      harvestSelected=false;
      myHarvest=-1;
      totalProfit=0;
      crops=new ArrayList<PImage>(10);
    }

    void stats() {
      fill(#FFFDFC);
      text("Moneys: "+money, 100, 750);
      text("EXP: "+exp+"/"+1000*level, 200, 750);
      text("LEVEL: "+level, 300, 750);
    }

