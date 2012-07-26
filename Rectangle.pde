class Rectangle {

  float x, y, rectWidth, rectHeight; 

  Rectangle(float _x, float _y, float _rectWidth, float _rectHeight) {
    x = _x;
    y = _y;
    rectWidth = _rectWidth;
    rectHeight = _rectHeight;
  }

  void render() {
      stroke(0);
      noFill();
      rect(x, y, rectWidth, rectHeight);
    }
  
}

