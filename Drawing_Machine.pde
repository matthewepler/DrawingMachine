/*
DRAWING MACHINE
 Matthew Epler, 2012
 Github source:
 http://mepler.com
 
 For creating Arduino code that will operate a dual stepper motor
 XY plotter. No G-Code or extra firmware needed. Just export the 
 results of this sketch by pressing ENTER, open the .txt file in 
 your sketch's data folder, and copy the contents. Paste the code 
 into the Arduino sketch and voila!
 
 There is a corresponding Arduino sketch that can be found on the 
 github for this project (see link above). In that sketch, I use 
 a servo to operate the pen-up and pen-down functionality of my 
 drawing machine (which can be seen here: XXXXX). You can remove 
 or alter that variable depending on your needs - both in this 
 sketch and the Arduino sketch.
 
 If you have questions/problems, email me: matthewepler@gmail.com
 
 NOTES: 
 Some primitive shape class names are spelled strangely to avoid conflict with 
 Processing's core function library.
 > "Ellipse" is spelled as "Elipse" 
 > "Line" is spelled as "Lyne"
 
 All calculations are based on these stepper motors:
 http://www.sparkfun.com/products/9238
 
 1 step = approx 0.06cm, 0.023in, 1.74px
 
 SETUP STEPS
 1.) Measure the width and height dimensions (in inches - we'll be using dpi to 
 calculate other dimensions) of your plotter. Make sure to measure the effective 
 dimensions (the dimensions of where it can actually draw).
 2.) Run the calibration function on the Arduino side and set the width and height 
 values for your plotter accordingly.
 
 If you're anywhere outside the USA, forgive me for using inches. We know it's 
 silly to use inches. There are many of us who believe in the metric system, but we're stuck with
 inches. So what's a nerd to do? Use 1" = 2.54cm to convert your figures accordingly, but you'll have to go through all the math
 in here and verify it's working correctly. Sorry y'all.
 
 */

boolean render = true;     // toggles rendering to screen

float scalar = 0.20;   // change this to fit all your drawing on the screen. All other settings should
// be for the actual dimensions of the plotter.

PrintWriter output;  // our output text file that will be pasted into Arduino


// FILL THESE IN 
float plotter_width_in = 50;      // effective drawing dimensions in inches
float plotter_height_in = 50;
int steps_width = 1222;       // get these from the Arduino sketch (use the Serial Monitor)
int steps_height = 1222; 

int plotter_width_px = int(plotter_width_in * 300); // calculated at 300 dpi. Change this if your resolution is different.
int plotter_height_px = int(plotter_height_in * 300);
float one_step = plotter_width_px/steps_width;    // how many px's = one step?

float current_px = 0;       // where are we?
float current_py = 0;

// Place to keep all of our shapes
ArrayList<Arcc> allArccs = new ArrayList();
ArrayList<Ellypse> allEllypses = new ArrayList();
ArrayList<Lyne> allLynes= new ArrayList();
ArrayList<Poynt> allPoynts = new ArrayList();
ArrayList<Quadri> allQuadris = new ArrayList();
ArrayList<Rectangle> allRectangles = new ArrayList();
ArrayList<Tri> allTris = new ArrayList();
ArrayList<Curvve> allCurvvs = new ArrayList();


void setup() {
  output = createWriter("drawing_1.txt");   
  if (render) {
    size(int(plotter_width_px*scalar), int(plotter_height_px*scalar));
  } 
  else {
    background(255); 
    size(100, 100);
    fill(0);
    text("render OFF", 20, 50);
  }
}

void draw() {
  //scale(scalar);
  int limit = 500;

  // ****************************************** CREATE SHAPES HERE
  for (int i=0; i<limit; i+=15) {
    Rectangle r = new Rectangle(i, 20, 10, 10);
    allRectangles.add(r);
  }

  for (int i=0; i<limit; i+=20) {
    Lyne l = new Lyne(i, 40, i+20, 80);
    allLynes.add(l);
  }

  for (int i=0; i<limit; i+=50) {
    Ellypse e = new Ellypse(i, 200, 100, 200);
    allEllypses.add(e);
  }

  for (int i=0; i<limit; i+=60) {
    Poynt p = new Poynt(i, 335);
    allPoynts.add(p);
  }
  
  for (int i=0; i<limit; i+=90){
   Quadri q = new Quadri(i, 420, i+30, 370, i+80, 470, i, 600); 
   allQuadris.add(q);
  }
  
  for (int i=25; i<limit; i+= 100){
   Tri t = new Tri(i, 625, i-50, 750, i+50, 750);
   allTris.add(t);
  }
  
  for (int i=20; i<limit; i+=60){
   Arcc a = new Arcc(i, 800, 45, 45, PI, 2*PI);
   allArccs.add(a); 
  }



  // *******************************************RENDER SHAPES HERE
  if (render) {
    for (Rectangle r:allRectangles) {
      r.render();
    }

    for (Lyne l:allLynes) {
      l.render();
    }

    for (Ellypse e:allEllypses) {
      e.render();
    }

    for (Poynt p:allPoynts) {
      p.render();
    }
    
    for(Quadri q:allQuadris){
     q.render(); 
    }
    
    for(Tri t:allTris){
     t.render(); 
    }
    
    for(Arcc a:allArccs){
     a.render(); 
    }
  }


  noLoop();
}

