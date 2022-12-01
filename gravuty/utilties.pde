void click() {
  mouseReleased=false;
  if (mousePressed)waspressed=true;
  if (waspressed&& !mousePressed==false) {
    mouseReleased=true;
    waspressed=false;
  }
}
