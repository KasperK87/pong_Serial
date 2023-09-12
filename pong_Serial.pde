import processing.serial.*;

//variabler for bolden
float x, y;
float vx, vy;

//variable for spillernes y
//koordinates
float p1;
float p2;


void setup() {
  size(600, 400);
  setupSerial();
  
  frameRate(60);

  //bolds starts position
  x = width/2;
  y = height/2;

  //start bevægelse for bolden
  vx = -1;
  vy = 1;
}

void draw() {
  background(0);
  if (readSerial() != 0)
    p1 = map(readSerial(), 766, 1023, 0, height-100);

  //bevæger bolden i en retning
  x += vx;
  y += vy;

  //tegner bolden
  circle(x, y, 15);

  //paddle p1
  rect(25, p1, 25, 100);

  //collision x axis
  if (x < 0 || x > width) {
    vx = -vx;
  }
  //collision y axis
  if (y < 0 || y > height) {
    vy = -vy;
  }

  //collision for spiller 1
  if (x < 50 && x > 25 && p1 < y && p1+100 > y ) {
    vx = -vx;
  }

  //paddle p2
  rect(width-50, p2, 25, 100);

  //collision for spiller 2
  if (x > width-50 && x < width-25 && p2 < y && p2+100 > y ) {
    vx = -vx;
  }
}

void keyPressed() {
  if (key == 'w') {
    p1 -= 5;
  }
  if (key == 's') {
    p1 += 5;
  }

  //pile taster er special taster
  //derfor checker vi først om tasten er
  //special, også tjekker vi hvilken tast
  if (key == CODED) {
    if (keyCode == UP) {
      p2 -= 5;
    }

    if (keyCode == DOWN) {
      p2 += 5;
    }
  }
}

//OPGAVER
//grøn
//få spiller 1 og 2 til at starte i midten af skærmen
//lav lydeffekter for bolden
//går så spillerens paddle ikke kan forlade skærmen
//gul
//hvis en spiller scorer skal bolden in på midten
//skrev scorer på skærmen
//bolden skal starte i en tilfældig retning
//få bolden til at blive hurtiger og hurtiger
//rød
//få spillerens paddle til at bevæge sig uden delay
//påvirk boldens retning alt efter hvor den rammer paddlen
//lav en AI modstander som er svær men mulig at vinde over.
