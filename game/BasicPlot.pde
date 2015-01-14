class BasicPlot {
  String status, imgPath;
  PImage img;
  int xcor, ycor;

  BasicPlot() {
    this("plowed", "resized/basicplot.png");
  }

  BasicPlot(String cond) {
    setStatus(cond);
    setImg("resized/basicplot.png");
  }

  BasicPlot(String cond, String p) {
    setStatus(cond);
    setImg(p);
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
}

