PImage img;
PFont font;

Walker[] walkers;
int wCount;
import gifAnimation.*;
GifMaker gifExport;

void setup(){
 size(500, 500);
 background(0);
 smooth(0);
 //blendMode(ADD);
 //frameRate(1);
 
 img = loadImage("mark_01.png");
 imageMode(CENTER);
 image(img, width/2, height/2);

 loadMark();
 title();
 //キャンパス再読み込み
 loadPixels();
 
  wCount = 10;
  walkers = new Walker[wCount];
  for(int i = 0; i < wCount; i++){
    walkers[i] = new Walker();
  }
  
}

void draw(){
  //breakMark();
  for(int i = 0; i < wCount; i++){
    walkers[i].step(); 
    walkers[i].display();
  }
}

//画像を白黒変換
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

//画像崩し
void breakMark(){
  loadPixels();
  int x = int(random(width));
  int y = int(random(height));
  int loc = x + y*width;
  float r = red(pixels[loc]);
  float g = green(pixels[loc]);
  float b = blue(pixels[loc]);
  noStroke();
  fill(r, g, b);
  ellipse(x, y, 10, 10);
  //updatePixels();
}
//タイトル挿入
void title(){
  font = createFont("logotypejp_mp_b_1.1.ttf", 180);
  textFont(font);
  textAlign(CENTER);
  fill(#670303);
  text("3", width/2 +100, height/2 + 60);
}

void mouseClicked(){
 save("laborM_02.png");
}

class Walker{
  int x, y;
  float tx, ty;
  color c;
  int loc;
  float r, g, b;
  
  
  Walker(){
   tx = random(0, 1000);
   ty = random(10000, 20000);
   x =  int(random(width));
   y =  int(random(height));
   loc = x + y*width;
   r = red(pixels[loc]);
   g = green(pixels[loc]);
   b = blue(pixels[loc]);
   c = color(r, g, b);
  }
  
  void display(){
   noStroke();
   fill(c);
   ellipse(x, y, 3, 3); 
  }
  
  void step(){
    x = int(map(noise(tx), 0, 1, 0, width));
    y = int(map(noise(ty), 0, 1, 0, height));
    
    tx += 0.01;
    ty += 0.01;
  }
}