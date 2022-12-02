class button {
  int x, y, w, h, high, gy, ss11;
  boolean clicked;
  color highlight, normal;
  String text;
  PImage img;

  button(String t, int _x, int _y, int _w, int _h, color norm, color high) {
    x=_x;
    y=_y;
    w=_w;
    h=_h;
    text=t;
    highlight=high;
    normal=norm;
    clicked=false;
    
  }

  boolean touchingmouse() {
    return mouseX>x-w/2&&mouseX<x+w/2&&mouseY>y-h/2&&mouseY<y+h/2;
  }
  void show() {
    drawbutton();
    drawlable();
    checkforclick();
  }
  void drawbutton() {

    if ( touchingmouse() ) {
      fill(highlight);
    } else {
      fill(normal);
    }
    stroke(0);
    strokeWeight(4);
    rect(x, y, w, h, 30);
  }
  void drawlable() {
    if (touchingmouse() ) {
      fill(normal);
    } else {
      fill(highlight);
    }
  }
  void checkforclick() {
    if (mouseReleased&&touchingmouse() ) {
      clicked=true;
      
    } else {
      clicked=false;
      
    }
  }
}
