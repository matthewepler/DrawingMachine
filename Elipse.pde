class Elipse {

  float x, y, eWidth, eHeight; 

  Elipse(float _x, float _y, float _eWidth, float _eHeight) {
    x = _x;
    y = _y;
    eWidth = _eWidth;
    eHeight = _eHeight;
  }

  void render() {
      stroke(0);
      noFill();
      ellipse(x, y, eWidth, eHeight);
    }
  
}

