//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {
  
  float x, y, vx, vy, s, d;
  int hp;
  
  Mob(float X, float Y, float VX, float VY, float S, int HP) {
    x = X;
    y = Y;
    vx = VX;
    vy = VY;
    s = S; //speed variable
    d = 30; //diameter of mob, used for collision
    hp = HP;
  }
  
  void show() {
    fill(purple);
    noStroke();
    circle(x,y,d);
  }
  
  void act() {
    x += vx*s;
    y += vy*s;
    
    turning();
    getHit();
  }
  
  void turning() { //performing a turn
    //turning when encountering nodes
    for (int i=0; i < nodes.length; i ++) {
      Node n = nodes[i];
      if (dist(n.x, n.y, this.x, this.y) < 3) { //check if the mob is close enough to the node
        if (i == nodes.length-1) { //if it reach the end Node
          parsas.remove(this);
          health--; //remove the user's health
        }
        else { //if it is not at end node
          // copies over direction from the node
          this.vx = n.dx;
          this.vy = n.dy;
        }
      }    
    }
  }
  
  void getHit() { //check if hit by bullet
    for (int i=0; i < shells.size(); i++) {
      Bullet bNow = shells.get(i);
      if (dist(bNow.x, bNow.y, this.x, this.y) < this.d/2 + bNow.d/2) {
        //check for collision
        this.hp--;
        money++; //add money to the user
        shells.remove(bNow);
      }
    }
  }
}
