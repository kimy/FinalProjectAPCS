class Seed extends BasicPlot {
  String type, status, imgPath;  
  int itime, ftime;  
  int dPixels;
  int cost, value, exp;

  Seed() {
    super("00");
  }

  Seed(String cond) {
    super(cond);
  }

  Seed(String cond, String p) {
    super(cond, p);
  }

  Seed(String cond, String p, int x, int y, int endT, String t) {
    super(cond, p, x, y);
    setStartTime();
    setEndTime(endT);
    setType(t);
  }

  void setType(String t) {
    type = t;
  }

  String getType() {
    return type;
  }

  void setdPixel(int x) {
    dPixels = x;
  }

  int getdPixel(int x) {
    return dPixels;
  }

  void setStartTime() {
    itime=second();
  }

  int getStartTime() {
    return itime;
  }

  void setEndTime(int span) {
    ftime=itime+span;
  }

  int getEndTime() {
    return ftime;
  }
  
  void setCost(int c){
    cost=c;
  }
  
  int getCost(){
    return cost;
  }
  
  void setVal(int v){
    value=v;
  }
  
  int getVal(){
    return value;
  }
  
  void setEXP(int e){
    exp=e;
  }
  
  int getEXP(){
    return exp;    
  }
}

