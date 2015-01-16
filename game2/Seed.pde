class Seed extends BasicPlot{
 String type, status, imgPath;  
 int time;  
 
 Seed(){
  super("00");
 }

Seed(String cond){
  super(cond);
}

Seed(String cond, String p){
 super(cond, p);
}

void setType(String t){
  type = t;
}

String getType(){
  return type;
}




}
