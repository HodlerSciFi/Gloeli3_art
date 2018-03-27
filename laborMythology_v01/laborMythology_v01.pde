PImage img;
PFont font;

void setup(){
 size(500, 500);
 background(255);
 frameRate(1);
 
 img = loadImage("mark_01.png");
 imageMode(CENTER);
 image(img, width/2, height/2);
 
 font = createFont("Oradano-mincho-GSRR", 80);
textFont(font);
textAlign(CENTER);
fill(#670303);
text("Global Elite", width/2, height/2 - 100);
 
 loadPixels();
}

void draw(){
  breakMark();
}

void breakMark(){
 for(int y = 0; y < height; y++){
  for(int x = 0; x < width; x ++){
   int loc = x + y*width;
   float r = red(pixels[loc]);
   float g = green(pixels[loc]);
   float b = blue(pixels[loc]);
   if(b != 255){
     r = 0;
     g = 0;
     b = 0;
   }
   int randomMV = int(random(-10, 10));
   try{
     pixels[loc + randomMV] = color(r, g, b);
   }catch(ArrayIndexOutOfBoundsException e){
     pixels[loc] = color(r, g, b);
   }
  }
 }
 updatePixels();
}

void mouseClicked(){
 save("laborM_02.png");
}