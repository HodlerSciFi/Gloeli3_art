
PFont font;
int pictureX = 166;
int pictureY = 50;
int pictureW = 166;
int pictureH = 300;
float x, y;
float preX = 0, preY  = 0;
void setup(){
  size(500, 500);
  background(0);
  smooth();
  
  noStroke();
  fill(#0062A0);
  rect(pictureX, pictureY, pictureW, pictureH);
  
  x = random(pictureX, pictureX + pictureW);
  y = random(pictureY, pictureY + pictureH);
  
}

void draw(){
  float r = 7;
  float g = 16;
  float b = random(20, 170);
  stroke(r, g, b);
  if(frameCount < 4000){
    if(preX == 0 && preY ==0){
      preX = x;
      preY = y;
    }else{
        x += random(-5, 10);
        y += random(-5, 10);
      if(x > pictureX && x < pictureX + pictureW 
        && y > pictureY && y < pictureY + pictureH){
        line(preX, preY, x, y);
        preX = x;
        preY = y;
      }else{
        x = random(pictureX, pictureX + pictureW);
        y = random(pictureY, pictureY + pictureH);
        preX = 0;
        preY = 0;
      }
    }
  }else{
    title();
    save("cobalt_2.png");
    exit();
  }
}

//タイトル挿入
void title(){
  font = createFont("logotypejp_mp_b_1.1.ttf", 20);
  textFont(font);
  textAlign(CENTER);
  fill(#fac61e);
  text("Cobalt", width/2, 420);
  
}