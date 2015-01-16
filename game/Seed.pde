class Seed extends BasicPlot{
 String type, status, imgPath;  
 int time;  
 int dPixels;
 
 Seed(){
  super("00");
 }

Seed(String cond){
  super(cond);
}

Seed(String cond, String p){
 super(cond, p);
}

Seed(String cond, String p, int x, int y){
  super(cond, p, x, y);
}

void setType(String t){
  type = t;
}

String getType(){
  return type;
}

void setdPixel(int x){
  dPixels = x;
}

int getdPixel(int x){
  return dPixels;
}

}
