import gifAnimation.*;
GifMaker gifExport;
PImage img;
PFont font;
 float randSeedX = 0;
 float randSeedY = 0;

void setup(){
 size(500, 500);
 background(0);
 smooth(0);
 //blendMode(ADD);
 //blendMode(ADD);
 //frameRate(1);
 
   //GIF Animation 
  gifExport = new GifMaker(this, "gloeli_3_3.gif"); 
  gifExport.setRepeat(0); 
  gifExport.setQuality(10); 
  gifExport.setDelay(80); 
 
 img = loadImage("mark_01.png");
 imageMode(CENTER);
 image(img, width/2, height/2);

 loadMark();
 title();
 //キャンパス再読み込み
 loadPixels();
  randSeedX = random(0, 1000);
  randSeedY = random(2000, 4000);
  
}

void draw(){
  int i = 0;
  while(i < 10){
    breakMark(randSeedX, randSeedY);
    i++;
    randSeedX += random(0, 100);
    randSeedY += random(200, 300);
  }
  if(frameCount <= 900){
    gifExport.addFrame();
  }else{
    gifExport.finish();
    exit();
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
void breakMark(float _randSeedX, float _randSeedY){
    loadPixels();
    float randSeedX = _randSeedX;
    float randSeedY = _randSeedY;
    float randValueX = noise(randSeedX);
    float randValueY = noise(randSeedY);
    int x = int(map(randValueX, 0, 1, 0, width));
    int y = int(map(randValueY, 0, 1, 0, height));
    int loc = x + y*width;
    float r = red(pixels[loc]);
    float g = green(pixels[loc]);
    float b = blue(pixels[loc]);
    if(r != 0){
      noStroke();
      fill(r -random(-20, 20), g + 15, b - 10);
      println(g);
      float size = random(10);
      ellipse(x, y, size, size);
    }else{
      randSeedX = random(5000, 9000);
      randSeedY = random(10000, 15000);
      breakMark(randSeedX, randSeedY);
    }
  //updatePixels();
}
//タイトル挿入
void title(){
  font = createFont("logotypejp_mp_b_1.1.ttf", 40);
  textFont(font);
  textAlign(CENTER);
  fill(#670303);
  text("Global", width/2 -50, height/2 - 100);
  text("Elite", width/2 - 40, height/2 - 50);
  
  font = createFont("logotypejp_mp_b_1.1.ttf", 160);
  textFont(font);
  textAlign(CENTER);
  fill(#670303);
  text("3", width/2 +100, height/2 + 80);
}

void mouseClicked(){
 save("laborM_02.png");
}