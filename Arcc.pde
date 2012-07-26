class Arcc{
  
 float x, y, arcWidth, arcHeight, arcStart, arcStop;
 
 Arcc(float _x, float _y, float _arcWidth, float _arcHeight, float _arcStart, float _arcStop){
  x = _x;
  y = _y;
  arcWidth = _arcWidth;
  arcHeight = _arcHeight;
  arcStart = _arcStart;
  arcStop = _arcStop;
 }
 
 void render(){
  stroke(0);
  noFill();
  arc(x, y, arcWidth, arcHeight, arcStart, arcStop); 
 }
  
}
