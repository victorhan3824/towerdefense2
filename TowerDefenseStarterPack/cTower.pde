//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Sniper Tower: These towers automatically target the first
//              mob no matter where they are on the scren.

class Tower {
  final int PLACING = 0; //this mode is when we are selcting locations, 
                         //tower follows the mouse
  final int PLACED = 1; //this mode means tower is in place
  
  float x, y;
  int charge, threshold;
  int status; //sets the placing status
  String type; //determine the type of tower
  
  Tower(String T) {
    x = mouseX;
    y = mouseY;
    status = PLACING;
    type = T;
    
    if (this.type == "GUN") {
      charge = 0;
      threshold = 20;
    }  
    
    if (this.type == "SNP") {
      charge = 0;
      threshold = 40;
    }
  }
//=================================================== 
  void show() {
    stroke(black);
    strokeWeight(4);
    fill(nBlue);
    animatingTower();
  }
  
  void act() {
    if (type == "GUN") actGUN();
    if (type == "SNP") actSNP();
  }
  
//===================================================
  void animatingTower() {
    if (status == PLACED) {
      square(x,y,40);
    } else if (status == PLACING) {
      square(mouseX, mouseY, 40); //towers follow mouse
      if (mousePressed) { //when user have click on desired location
        status = PLACED;
        x = mouseX;
        y = mouseY;
      }
    }
  }
  
  void actGUN() { //fire bullets and calculate cooldown
    charge++; 
    if (charge >= threshold) { //when charge reach the threshold
      charge = 0;
      shells.add(new Bullet(this.x, this.y, 0, -20,100)); //upward shell
      shells.add(new Bullet(this.x, this.y, 0, 20,100)); //down
      shells.add(new Bullet(this.x, this.y, 20, 0,100)); //right
      shells.add(new Bullet(this.x, this.y, -20, 0,100)); //left
    }      
  }
  
  void actSNP() {
    if (charge < threshold) {
      charge++;
    }
    if (charge >= threshold && parsas.size() > 0) {
      charge = 0;
      float dx = parsas.get(0).x - x;
      float dy = parsas.get(0).y - y;
      
      shells.add(new Bullet(x, y, dx/20, dy/20,400));
       
    }
  }
}  
