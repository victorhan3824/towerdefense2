

class Bullet {
  float x, y, vx, vy, d;
  float startX, startY; //bullet's start pos
  float R; //range, user give radius
  
  Bullet(float X, float Y, float VX, float VY, float R) {
    x = startX = X;
    y = startY = Y;
    vx = VX;
    vy = VY;
    d = 8; //the diameter of bullet; used for collision
    this.R = R;
  }

//===============================================================
  
  void show() {
    fill(black);
    circle(x,y,d);
  }
  
  void act() {
    x += vx;
    y += vy;
    outRange(); //check outside range
  }
  
//===============================================================

  void outRange() {
    if (dist(x,y,startX,startY) > R) { //check if outside range
      shells.remove(this);
    }
  }
  
  
  
}
