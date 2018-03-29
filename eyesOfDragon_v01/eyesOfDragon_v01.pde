PFont font;
void setup(){
  size(500, 500);
  background(0);
  smooth();
  for(float i = 170; i < 220; i+= 5){
  bodyLine(i, width/2, height/2);
  }
  title();
  save("eyesOfDragon_1.png");
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
    
    angle += 1;
    //stroke(255);
    //line(preX, preY, x, y);
    //stroke(#740109);
    eyeFlag = random(0, 3);
    if(eyeFlag > 2.0){
      stroke(#740109);
      fill(#740109);
      ellipse(x, y, 19, 18);
      angle += 1;      
    }
    else{
      stroke(255);
      fill(#012C24);
      ellipse(x, y, 19, 18);
      angle += 1;
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
  font = createFont("OradanoGSRR.ttf", 30);
  textFont(font);
  textAlign(CENTER);
  fill(#740109);
  text("龍の瞳に潜る", width/2, height/2);
  font = createFont("OradanoGSRR.ttf", 24);
  textFont(font);
  fill(#012C24);
  text("維嶋津", width/2, height/2 + 50);
}