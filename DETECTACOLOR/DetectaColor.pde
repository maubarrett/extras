
PImage img;
color trackColor; //variable para el color
//arreglos para acumular puntos de color
float [] cirx = new float [1000];
float [] ciry =new float [1000];
int actual = 0; //numero actual del pixel

void setup (){
  size(1080,720);
  img = loadImage("Maruata.jpg");
  img.resize(1080,720); 
  trackColor =color (255,0,0);
  smooth ();
}

  void draw(){

    img.loadPixels();
    image(img, 0, 0);
    float worldRecord =  500;
    int closestX = 0;
    int closestY = 0;
    
for (int x= 0; x< img.width; x++){
  for (int y= 0; y < img.height; y++){
    int loc = x+y*img.width;
    color currentColor = img.pixels[loc];
     float r1=red (currentColor);
     float g1= green (currentColor);
     float b1= blue (currentColor);
    
    float r2=red (trackColor);
     float g2= green (trackColor);
     float b2= blue (trackColor);
  float d = dist(r1, g1, b1, r2, g2, b2);
  
  
  if (d < worldRecord) {
worldRecord = d;
    closestX = x;
    closestY = y;
  }
  }
}
 noStroke();
 for(int i=0; i<actual; i++){
   ellipse(cirx[i],ciry[i],12, 12);
 }
 if (worldRecord <10){
   fill(trackColor);
   strokeWeight(1.2);
   stroke (0);
   rect (closestX, closestY, 14, 14);
 }
 if (closestX != cirx[actual] && closestY != ciry[actual])
 {
   actual++;
   cirx[actual] = closestX;
   ciry[actual]= closestY;
 }
  }
  void mousePressed(){
    int loc = mouseX + mouseY*img.width;
    trackColor = img.pixels [loc];
  }