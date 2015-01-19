class BasicPlot {
  String type, status, imgPath;
  PImage img;
  int xcor, ycor;

  BasicPlot() {
    this("plowed", "resized/basicplot.png");
    //setType("basic");
  }

  BasicPlot(String cond) {
    setStatus(cond);
    setImg("resized/basicplot.png");
    //setType("basic");
  }

  BasicPlot(String cond, String p) {
    setStatus(cond);
    setImg(p);
    //setType("basic");
  }


  BasicPlot(String cond, String p, int x, int y) {
    setStatus(cond);
    setImg(p);
    setXcor(x);
    setYcor(y);
  }   

  void setXcor(int x) {
    xcor = x;
  }

  int getXcor() {
    return xcor;
  }

  void setYcor(int y) {
    ycor = y;
  }

  int getYcor() {
    return ycor;
  }

  void setStatus(String cond) {
    status=cond;
  }

  String getStatus() {
    return status;
  }

  void setImg(String p) {
    imgPath = p;
    img=loadImage(p);
  }

  String getImgPath() {
    return imgPath;
  }


  void setType(String x){
    type = x;
  }
  
  String getType(){
    return type;
  }
  

  PImage getImg(){
    return img;
  }
  
  void setStartTime(){
  }
  
  void setEndTime(int duration){
  }
  
  int getEndTime(){
    return 0;
  }
  
  void setVal(int v){
  }
  
  int getVal(){
    return 0;
  }
  
  void setEXP(int e){
  }
  
  int getEXP(){
    return 0;
  }

}

