  PFont font;
  int x, y;
  int preX = 0;
  int preY = 0;
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
  //noStroke();
  //fill(#626783);
  stroke(255);
  strokeWeight(4);
  fill(0);
  ellipse(-20, height, 3000, 3010);
  fill(0);
  ellipse(-20, height, 1600, 2850);
}

void draw(){
  x = int(random(width));
  y = int(random(height));
  stroke(255);
  fill(0);
  ellipse(x, y, 1, 1);
  loadPixels();
  x = int(random(width/2-100, width/2 + 200));
  y = int(random(height));
  if(preX == 0 && preY == 0){
    preX = x;
    preY =y;
  }else{
     int loc = x + y*width;
     float r = red(pixels[loc]);
     float g = green(pixels[loc]);
     float b = blue(pixels[loc]); 
     if(r == 0 && g == 0 && b == 0){
       //fill(#E2E3CE);
       //stroke(#E8E273);
       fill(255);
       stroke(255);
       strokeWeight(1);
       line(preX, preY, x, y);
       //ellipse(x, y, 3, 3);
       //preX = x;
       //preY =y;
     }else{
        noStroke();
        //fill(#E0A5AE);
        //stroke(#E0A5AE);
        fill(255);
       stroke(255);
       strokeWeight(1);
        line(preX, preY, x, y);
        //ellipse(x, y, 3, 3);
        //preX = x;
        //preY =y;
     }
  }
  
  if(frameCount > 100){
    //title();
    save("earthOrphan_paper_noTilte.png");
    exit();
  }
}

//タイトル挿入
void title(){
  //font = createFont("OradanoGSRR.ttf", 40);
  font = createFont("logotypejp_mp_b_1.1.ttf", 80);
  textFont(font);
  textAlign(CENTER);
  //fill(#E0A5AE);
  fill(255);
  text("地", width/2  +600, height/2 - 550);
  text("球", width/2 + 600, height/2 - 450);
  text("独", width/2 + 600, height/2 - 350);
  text("生", width/2 + 600, height/2 - 250 );
  text("子", width/2 + 600, height/2 - 150);
  text("女", width/2 + 600, height/2 - 50);
  
  font = createFont("logotypejp_mp_b_1.1.ttf", 70);
  textFont(font);
  textAlign(CENTER);
  //fill(#E0A5AE);
  fill(255);
  text("髙", width/2  +450, height/2 - 160);
  text("座", width/2 + 450, height/2 - 80);
  text("創", width/2 + 450, height/2 );
}
