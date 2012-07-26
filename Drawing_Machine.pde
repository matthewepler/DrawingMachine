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


float scalar = 0.20;   // change this to fit all your drawing on the screen. All other settings should
                      // be for the actual dimensions of the plotter.

PrintWriter output;  // our output text file that will be pasted into Arduino
boolean printing = false;  // marks the current shape being printed with color red.
boolean done = false;      // marks any shape already drawn with color blue. Remaining shapes appear black.

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
//ArrayList<Arc> allArcs = new ArrayList();
//ArrayList<Ellipse> allEllipses = new ArrayList();
ArrayList<Lyne> allLynes= new ArrayList();
//ArrayList<Point> allPoints = new ArrayList();
//ArrayList<Quad> allQuads = new ArrayList();
ArrayList<Rectangle> allRectangles = new ArrayList();
//ArrayList<Tri> allTris = new ArrayList();


void setup(){
  output = createWriter("drawing_1.txt");   
  size(int(plotter_width_px*scalar), int(plotter_height_px*scalar));
  background(255);  

}

void draw(){
  //scale(scalar);

  // CREATE SHAPES HERE
  for(int i=0; i<width; i+=15){
    Rectangle r = new Rectangle(i, 20, 10, 10);
    allRectangles.add(r);
  }
  
  for(int j=0; j<width; j+=20){
   Lyne l = new Lyne(j, 40, j+20, 80);
   allLynes.add(l);
  }
  
  // RENDER SHAPES HERE
  for(Rectangle r:allRectangles){
   r.render(printing, done); 
  }
  
  for(Lyne l:allLynes){
   l.render(printing, done); 
  }
  
  // render shapes here
  
  noLoop();
}
