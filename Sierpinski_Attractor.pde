// Sierpinski Triangle Attractor
// I got the idea from this youtube video: https://youtu.be/kbKtFN71Lfs

// Construct a triangle made of three vertices
// Then you randomly choose another point P on the plane
// Iterate performing the following steps:
//   * Choose a random vertex in the original triangle
//   * Move P halfway towards that vertex
//   * Place a mark at P

PVector p1, p2, p3; // vertices of a triangle
PVector cur; // point that starts random

void setup() {
   size(640, 560);

   p1 = new PVector(random(width), random(height));
   p2 = new PVector(random(width), random(height));
   p3 = new PVector(random(width), random(height));
   
   cur = new PVector(random(width), random(height));
   
  strokeWeight(3);
  
  // Initial triangle
  point(p1.x, p1.y);
  point(p2.x, p2.y);
  point(p3.x, p3.y);
}

void halfwayTo(PVector pt, PVector to) {
  pt.x = (to.x + pt.x)/2;
  pt.y = (to.y + pt.y)/2;
}

void draw() {
  for (int i=0; i<10; i++) { // this loop is to speed things up (don't redraw the whole screen every time)
    point(cur.x, cur.y);
    int rand = int(random(3)); // 0, 1, or 2
    switch(rand) {
      case 0:
        halfwayTo(cur, p1);
        break;
      case 1:
        halfwayTo(cur, p2);
        break;
      case 2:
        halfwayTo(cur, p3);
        break;
    }
  }
  
}
