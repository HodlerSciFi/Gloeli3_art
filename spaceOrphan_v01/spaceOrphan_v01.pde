  PFont font;
  int x, y;
  int preX = 0;
  int preY = 0;
void setup(){
  size(500, 500);
  background(0);
  smooth();
  noStroke();
  fill(#D0CEE3);
  ellipse(-20, height, 1200, 1010);
  fill(0);
  ellipse(-20, height, 800, 950);
}

void draw(){
  loadPixels();
  x = int(random(width));
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
       stroke(#E2E3CE);
       line(preX, preY, x, y);
       ellipse(x, y, 3, 3);
     }else{
        noStroke();
        fill(#E0A5AE);
        stroke(#E0A5AE);
        line(preX, preY, x, y);
        ellipse(x, y, 3, 3);
     }
  }
  
  if(frameCount > 100){
    title();
    save("spaceOrphan_1.png");
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
  text("宇", width/2 -50, height/2 - 80);
  text("宙", width/2 - 50, height/2 - 30);
  text("独", width/2 - 50, height/2 +20);
  text("生", width/2 - 50, height/2 +70);
  text("子", width/2 - 50, height/2 +120);
  text("女", width/2 - 50, height/2 +170);
  
  //font = createFont("logotypejp_mp_b_1.1.ttf", 160);
  //textFont(font);
  //textAlign(CENTER);
  //fill(#670303);
  //text("3", width/2 +100, height/2 + 80);
}