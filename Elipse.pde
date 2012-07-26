class Elipse {

  float x, y, eWidth, eHeight; 

  Elipse(float _x, float _y, float _eWidth, float _eHeight) {
    x = _x;
    y = _y;
    eWidth = _eWidth;
    eHeight = _eHeight;
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
      ellipse(x, y, eWidth, eHeight);
    }
  }
}

