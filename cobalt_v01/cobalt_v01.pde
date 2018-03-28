
PFont font;
int pictureX = 176;
int pictureY = 50;
int pictureW = 156;
int pictureH = 250;
float x1, y1, x2, y2, x3, y3, x4, y4;
float preX = 0, preY  = 0;
void setup(){
  size(500, 500);
  background(0);

  smooth();
  
  //noStroke();
  //fill(#0062A0, 90);
  //rect(pictureX, pictureY, pictureW, pictureH);
  
  x1 = random(pictureX, pictureX + pictureW);
  y1= random(pictureY, pictureY + pictureH);
  x2 = random(x1-10, x1-10);
  y2= random(y1-10, y1+10);
  x4 = random(pictureX, pictureX + pictureW);
  y4= random(pictureY, pictureY + pictureH);
  x3 = random(x4-10, x4+10);
  y3= random(y4-10, y4+10);

  
}

void draw(){
  float r = random(7,20);
  float g = random(16, 20);
  float b = random(20, 170);
  noFill();
  //stroke(r, g, b);
  stroke(#0062A0);
  if(frameCount < 200){
      if(x4 > pictureX && x4 < pictureX + pictureW 
        && y4 > pictureY && y4 < pictureY + pictureH){
        bezier(x1, y1, x2, y2, x3, y3, x4, y4);
        x1 = x4;
        y1 = y4;
        x2 = random(x1-50, x1 + 50);
        y2= random(y1-50, y1+ 50);
        x4 = random(pictureX, pictureX + pictureW);
        y4= random(pictureY, pictureY + pictureH);
        x3 = random(x4-50, x4+50);
        y3= random(y4-50, y4+50);
      }else{
      //x1 = random(pictureX, pictureX + pictureW);
      //y1= random(pictureY, pictureY + pictureH);
      //x2 = random(x1-10, x1-10);
      //y2= random(y1-10, y1+10);
      //x4 = random(pictureX, pictureX + pictureW);
      //y4= random(pictureY, pictureY + pictureH);
      //x3 = random(x4-10, x4+10);
      //y3= random(y4-10, y4+10);
      }

  }else{
    stroke(#fac61e, 90);
    //fill(#0062A0, 90);
    rect(pictureX, pictureY, pictureW, pictureH);
    title();
    save("cobalt_2.png");
    exit();
  }
}

//タイトル挿入
void title(){
  font = createFont("OradanoGSRR.ttf", 30);
  textFont(font);
  textAlign(CENTER);
  fill(#fac61e);
  text("C o b a l t", width/2, 420);
  font = createFont("OradanoGSRR.ttf", 24);
  textFont(font);
  text("零 F", width/2, 460);
  
}