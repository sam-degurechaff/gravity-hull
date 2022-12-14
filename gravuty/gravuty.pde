import fisica.*;
//pallete
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);
//assets
PImage redBird;
PImage img;
int x, gyo, addo, gy2;
boolean gy,add;

color pink=#f76ddc;

color black=#000000;
color white=#ffffff;
button[] mybuttons;
boolean mouseReleased;
boolean waspressed;
boolean touchingmouse;
color bkg;

button gravity, objadd;
//fisica
FWorld world;
void setup() {
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);

  //make window
  fullScreen();

  //load resources
  redBird = loadImage("red-bird.png");
  //initialize world
  makeWorld();
  //add terrain to world
  makeTopPlatform();
  makeBottomPlatform();

  gravity=new button("gravity", 50, 100, 200, 200, blue, green);
  objadd=new button("add", 50, 300, 200, 200, blue, green);
}
//=====================================================================================================================================
void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}
//=====================================================================================================================================
void makeTopPlatform() {
  FPoly p = new FPoly();
  //plot the vertices of this platform
  p.vertex(-100, height*.1);
  p.vertex(400, height*.1);
  p.vertex(400, height*-.1);
  p.vertex(800, height*-.1);
  p.vertex(width*0.8, height*0.4);
  p.vertex(width*0.8, height*0.4+100);
  p.vertex(-100, height*0.1+100);
  p.vertex(-200, height*-.1);
  // define properties
  p.setStatic(true);
  p.setFillColor(brown);
  p.setFriction(0.1);
  //put it in the world
  world.add(p);
}
//=====================================================================================================================================
void makeBottomPlatform() {
  FPoly p = new FPoly();
  //plot the vertices of this platform
  p.vertex(width+100, height*0.6);
  p.vertex(300, height*0.8);
  p.vertex(300, height*0.8+100);
  p.vertex(width+100, height*0.6+100);
  // define properties
  p.setStatic(true);
  p.setFillColor(brown);
  p.setFriction(0);
  //put it in the world
  world.add(p);
}

//=====================================================================================================================================
void draw() {
  click();
  //println("x: " + mouseX + " y: " + mouseY);
  background(blue);
  circle(x, 100, 80);
  x=x+10;
  if (frameCount % 20 == 0&&add==true) {  //Every 20 frames ...
    makeCircle();
    makeBlob();
    makeBox();
    makeBird();
  }

  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw

  circle(x, 200, 80);
  if (x>=width) {
    x=-100;
  }

  gravity.show();
  if (gravity.clicked) {
    gy=!gy;
  }
  if (gy==true) {
    gyo=0;
  } else {
    gyo=900;
  }
  objadd.show();
  if (objadd.clicked) {
    add=!add;
  }
  if(add==true){}
  //println(gy, gyo);
  world.setGravity(0, gyo);
}

//=====================================================================================================================================
void makeCircle() {
  FCircle circle = new FCircle(50);
  circle.setPosition(random(width), -5);
  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);
  //set physical properties
  circle.setDensity(0.2);
  circle.setFriction(1);
  circle.setRestitution(1);
  //add to world
  world.add(circle);
}
//=====================================================================================================================================
void makeBlob() {
  FBlob blob = new FBlob();
  //set visuals
  blob.setAsCircle(random(width), -5, 50);
  blob.setStroke(0);
  blob.setStrokeWeight(2);
  blob.setFillColor(yellow);
  //set physical properties
  blob.setDensity(0.2);
  blob.setFriction(1);
  blob.setRestitution(0.25);
  //add to the world
  world.add(blob);
}
//=====================================================================================================================================
void makeBox() {
  FBox box = new FBox(25, 100);
  box.attachImage(redBird);
  //image(img, 0, 0);
  //image(img, 0, 0, width/2, height/2);
  box.setPosition(random(width), -5);
  //set visuals
  box.setStroke(0);
  box.setStrokeWeight(2);
  box.setFillColor(green);
  //set physical properties
  box.setDensity(0.2);
  box.setFriction(1);
  box.setRestitution(0.25);
  world.add(box);
}
//=====================================================================================================================================
void makeBird() {
  FCircle bird = new FCircle(48);
  bird.setPosition(random(width), -5);
  //set visuals
  bird.attachImage(redBird);
  //set physical properties
  bird.setDensity(0.8);
  bird.setFriction(1);
  bird.setRestitution(0.5);
  world.add(bird);
}
