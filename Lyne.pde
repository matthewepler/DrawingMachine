class Lyne{
 
  float x1, y1, x2, y2;
  
  Lyne(float _x1, float _y1, float _x2, float _y2){
   x1 = _x1;
   y1 = _y1;
   x2 = _x2;
   y2 = _y2; 
  }
  
  void render(){

      stroke(0);
      noFill();
      line(x1, y1, x2, y2);
    
  }
 
  
}
