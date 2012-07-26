class Quadri{
  
 float x1, y1, x2, y2, x3, y3, x4, y4;

 Quadri(float _x1, float _y1, float _x2,float _y2, float _x3, float _y3, float _x4, float _y4){
   x1 = _x1; 
   y1 = _y1;
   x2 = _x2;
   y2 = _y2;
   x3 = _x3;
   y3 = _y3;
   x4 = _x4; 
   y4 = _y4;
 }
  
  
  void render(){
   stroke(0);
   noFill();
   quad(x1, y1, x2, y2, x3, y3, x4, y4); 
  }
}
