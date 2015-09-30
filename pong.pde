# pong


//str8 stunner

int p1score = 0;
int p2score = 0;



void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
       p2.vy=-6;
    } else if (keyCode == DOWN) {
      p2.vy=+6;
    } 
  }
   if (key == 'w') {
      p.vy=-6;
    } else if (key == 's') {
      p.vy=6;
    } 
}

void keyReleased() {
if (key == CODED) {
    if (keyCode == UP) {
       p2.vy=0;
    } else if (keyCode == DOWN) {
      p2.vy=0;
    } 
  }
  if (key == 'w' || key == 'W') {
      p.vy=0;
    } else if (key == 's') {
      p.vy=0;
    } 
}



class Paddle {
  float x, y,vy;
  int c;

  Paddle(float x) {
    this.x = x;
    this.y =y;
    c = 255;
  }


  void draw() {
    noStroke();
    fill(255);
    rect(x,y, 10, 70);
  }

 void move() {
  y += vy;
  }
}
class Ball {
  float x, y;
  float vx, vy;
  float size = 10;
  color c;

  Ball(float x, float y) {
    this.x = x;
    this.y = y;
    c = color(255);
    vx = 4+random(4);
    vy = random(4);
  }

  void draw() {
    noStroke();
    fill(c);
    ellipse(x, y, size*2, size*2);
  }

  void move() {
    x += vx;
    y += vy;
    if (x < size || x > width-size) {
      vx = -vx;
    }
    if (y < size || y > height-size) {
      vy = -vy;
    }
    if (x < 40 && y > p.y && y < p.y+70) {
      vx = -vx;
    
    }
    if (x > 660 && y > p2.y && y < p2.y+70) {
      vx = -vx;
      println("RIGHT");
    }
    if (x > 690) {
      p1score++;
    }
    if (x < 10) {
      p2score++;
    }
  }
}

Ball b;
Paddle p;
Paddle p2;

void setup() {
  frameRate(60);
  size(700, 500);
  colorMode(HSB); 
  b = new Ball(250,250);
  p = new Paddle(20);
  p2 = new Paddle(670);
}

void draw() {
  background(0);
  b.draw();
  b.move();
  p.draw();
  p.move();
  p2.draw();
  p2.move();
  textSize(26); 
  text(p1score+":"+p2score, 350, 30);


}
