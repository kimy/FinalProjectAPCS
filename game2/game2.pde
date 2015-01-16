BasicPlot[] farm;

void setup() {
  size(1200, 700);
  background(#5BA751);
plots();

}

void draw() {
}

void plots() {
  PImage test;
  test = loadImage("basicplot.png");
  image(test, 0, 0);
}

