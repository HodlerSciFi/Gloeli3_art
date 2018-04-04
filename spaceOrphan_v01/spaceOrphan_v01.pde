  PFont font;
  int x, y;
  int preX = 0;
  int preY = 0;
void setup(){
  size(500, 500);
  background(0);
  smooth();
  noStroke();
  fill(#626783);
  ellipse(-20, height, 800, 1010);
  fill(0);
  ellipse(-20, height, 300, 950);
}

void draw(){
  x = int(random(width));
  y = int(random(height));
  stroke(255);
  fill(0);
  ellipse(x, y, 1, 1);
  loadPixels();
  x = int(random(width/2-200, width/2 + 100));
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
       fill(#E2E3CE);
       //stroke(#E2E3CE);
       stroke(#E8E273);
       line(preX, preY, x, y);
       ellipse(x, y, 3, 3);
       //preX = x;
       //preY =y;
     }else{
        noStroke();
        fill(#E0A5AE);
        stroke(#E0A5AE);
        line(preX, preY, x, y);
        ellipse(x, y, 3, 3);
        //preX = x;
        //preY =y;
     }
  }
  
  if(frameCount > 100){
    title();
    save("spaceOrphan_2.png");
    exit();
  }
}

//タイトル挿入
void title(){
  //font = createFont("OradanoGSRR.ttf", 40);
  font = createFont("logotypejp_mp_b_1.1.ttf", 40);
  textFont(font);
  textAlign(CENTER);
  fill(#E0A5AE);
  text("宇", width/2  +200, height/2 - 150);
  text("宙", width/2 + 200, height/2 - 100);
  text("独", width/2 + 200, height/2 - 50);
  text("生", width/2 + 200, height/2 );
  text("子", width/2 + 200, height/2 + 50);
  text("女", width/2 + 200, height/2 +100);
  
  font = createFont("logotypejp_mp_b_1.1.ttf", 30);
  textFont(font);
  textAlign(CENTER);
  fill(#E0A5AE);
  text("髙", width/2  +150, height/2 + 40);
  text("座", width/2 + 150, height/2 + 80);
  text("創", width/2 + 150, height/2 + 120);
}