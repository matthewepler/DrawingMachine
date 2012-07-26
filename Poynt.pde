class Poynt{
  
 float x,y;

 Poynt(float _x, float _y){
  x = _x;
  y = _y;
 } 
 
 void render(){
  strokeWeight(4);
  point(x, y);
  strokeWeight(1); 
 }
  
}
