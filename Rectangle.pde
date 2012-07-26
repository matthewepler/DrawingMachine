class Rectangle {

  float x, y, rectWidth, rectHeight; 

  Rectangle(float _x, float _y, float _rectWidth, float _rectHeight) {
    x = _x;
    y = _y;
    rectWidth = _rectWidth;
    rectHeight = _rectHeight;
  }

  void render(boolean printing, boolean done) {
    color c = color(0, 0, 0);
    if (printing) {
      c = color (255, 0, 0);
    } 
    else if (done) {
      c = color (0, 0, 255);
    } 
    else {
      stroke(0);
      noFill();
      rect(x, y, rectWidth, rectHeight);
    }
  }
}

