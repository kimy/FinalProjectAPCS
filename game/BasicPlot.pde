class BasicPlot{
  String status,imgPath;
  PImage img;
  
  
  BasicPlot(){
    this("plowed","resized/basicplot.png");
  }
  
  BasicPlot(String cond, String p){
    setStatus(cond);
    setImg(p);
  }
  
  void setStatus(String cond){
    status=cond;
  }
  
  String getStatus(){
    return status;
  }
  
  void setImg(String p){
    imgPath = p;
    img=loadImage(p);
  }
  
  String getImgPath(){
    return imgPath;
  }
}
