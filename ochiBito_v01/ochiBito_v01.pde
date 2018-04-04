PFont font;
float x, y;
float centX, centY;
void setup(){
  //ePub版:横116mm, 縦185mm, 350px換算のサイズ
  //size(1599, 2550);
  //紙版:横111mm, 縦154mm, 350px換算のサイズ
  size(1530, 2123);
  //size(500, 500);
  //横266mm, 縦191mm, 600px換算のサイズ
  //size(4512, 6284);
  background(#D1F2FA);
  smooth();
  
  x = random(width);
  y = random(height);
  centX = width/2;
  centY = height/2 - 1000;
}

void draw(){
  if( sqrt((sq(centX - x ) + sq(centY - y ))) >= random(180, 250)){
    fill(#A59A8F);
    float eSize = random(5, 10);
    ellipse(x, y, eSize, eSize);
    if( (x - centX) > 0){
      x += random(-18, 16);
    }else{
      x += random(-16, 18);
    }
    if( (y - centY) > 0){
      y += random(-18, 16);
    }else{
      y += random(-16, 18);
    }
  }else{
    init();
  }
  if(frameCount == 20000){
    title();
    save("ochibito_v06.png");
    exit();
  }
}

void init(){
  x = random(-300, width + 250);
  y = random(-200, height/2 + 500);
}

void mouseClicked(){
title();
 save("ochiBito_01.png");
}

//タイトル挿入
void title(){
  font = createFont("OradanoGSRR.ttf", 120);
  textFont(font);
  textAlign(CENTER);
  fill(#BC1B28);
  text("堕 ち 人 賛 歌", width/2, height/2 + 500);
  font = createFont("OradanoGSRR.ttf", 80);
  textFont(font);
  text("架旗透", width/2, height/2 + 700);
  
}