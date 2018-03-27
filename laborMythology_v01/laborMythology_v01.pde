PImage img;
PFont font;

void setup(){
 size(500, 500);
 background(0);
 frameRate(1);
 
 img = loadImage("mark_01.png");
 imageMode(CENTER);
 image(img, width/2, height/2);
 loadMark();
// font = createFont("logotypejp_mp_b_1.1.ttf", 40);
//textFont(font);
//textAlign(CENTER);
//fill(#670303);
//text("Global", width/2 - 60, height/2 -100);
//text("Elite", width/2 - 30, height/2 -50);
 font = createFont("logotypejp_mp_b_1.1.ttf", 180);
textFont(font);
textAlign(CENTER);
fill(#670303);
text("3", width/2 +100, height/2 + 60);
 
 loadPixels();
}

void draw(){
  breakMark();
}

void loadMark(){
  loadPixels();
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
   pixels[loc] = color(r, g, b);
  }
 }
 updatePixels();
}

void breakMark(){
 for(int y = 0; y < height; y++){
  for(int x = 0; x < width; x ++){
   int loc = x + y*width;
   float r = red(pixels[loc]);
   float g = green(pixels[loc]);
   float b = blue(pixels[loc]); 

   int rand = int(random(0, 4));
   if(rand > 2){
     try{
       int randomMV = int(random(-5, 5));
       pixels[loc + randomMV] = color(r, g, b);
     }catch(ArrayIndexOutOfBoundsException e){
       pixels[loc] = color(r, g, b);
     }
   }else{
     pixels[loc] = color(r, g, b);
   }
  }
 }
 updatePixels();
}

void mouseClicked(){
 save("laborM_02.png");
}