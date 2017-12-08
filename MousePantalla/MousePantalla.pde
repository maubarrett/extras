// Variar tamaño de pantalla mediante el movimiento del mouse

import processing.video.*;

Capture video;

void setup() {  
  size (640,480);
  video = new Capture (this, width, height, 30);
  video.start();
}

void captureEvent(Capture video) {  
  video.read();
}

void draw() {  
  background(0);  
  translate(width/2, height/2);  
  imageMode(CENTER);  
  tint(mouseY, 100, mouseX);
  image(video, -150, 0, mouseX, mouseY);
  filter(INVERT);
  image(video, 150, 0, mouseX, mouseY);
  filter(POSTERIZE, 4);
}