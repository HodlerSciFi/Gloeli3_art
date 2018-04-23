PFont font;
void setup(){
 //ePub版:横116mm, 縦185mm, 350px換算のサイズ
  //size(1599, 2550);
  //紙版:横111mm, 縦154mm, 350px換算のサイズ
  size(1530, 2123);
  //size(500, 500);
  //横266mm, 縦191mm, 600px換算のサイズ
  //size(4512, 6284);
  background(0);
  smooth();
  for(float i = 550; i < 900; i+= 5){
  bodyLine(i, 300, height/2);
  }
  //title();
  save("dragonSacle_paper_1_noTitle_2.png");
  exit();
}


void bodyLine(float _radius, float _centX, float _centY){
  float centX = _centX;
  float centY = _centY;
  float randX, randY;
  float x = 0;
  float y = 0;
  float radius = _radius;
  float angle = 0;
  float rad = 0;
  float eyeFlag = 0;
  
  while(angle <= 400){
    rad = radians(angle);
    randX = centX + rand(random(0, 100), -10, 10);
    randY = centY + rand(random(0, 100), -10, 10);
    x = randX + radius * cos(rad);
    y = randY + radius * sin(rad);
    angle += 2;
    eyeFlag = random(0, 3);
    //眼
    if(eyeFlag > 2.0){
      //stroke(#740109);
      //fill(#740109);
      stroke(0);
      fill(0);
      ellipse(x, y, 40, 39);
      angle += 2;      
    }
    else{
      //うろこ
      stroke(0);
      strokeWeight(6);
      //fill(#012C24);
      fill(255);
      ellipse(x, y, 40, 39);
      angle += 2;
    }
  }
}

float rand(float seed, float lLimit, float uLimit){
  float  noiseNum = noise(seed);
  float randomValue = map(noiseNum, 0, 1, lLimit, uLimit);
  return randomValue;
}

//タイトル挿入
void title(){
  font = createFont("OradanoGSRR.ttf", 80);
  textFont(font);
  textAlign(CENTER);
  //fill(#740109);
  fill(255);
  text("鱗の檻、扉のむこう", width/2, height/2);
  font = createFont("OradanoGSRR.ttf", 70);
  textFont(font);
  //fill(#024B3E);
  fill(255);
  text("維嶋津", width/2, height/2 + 150);
}
