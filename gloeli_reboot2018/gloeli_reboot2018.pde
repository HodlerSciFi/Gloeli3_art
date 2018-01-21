import gifAnimation.*;  //<>//
GifMaker gifExport;

PImage lightBall;
int addZ = 1;
int addXY = 5;
int zLength = (180 / addZ) ;
int xyLength = (360/addXY) * zLength;

float x[] = new float [xyLength];
float y[] = new float [xyLength];
float z[] = new float [zLength];

float radius = 400; //半径

int drawZ[] = new int[xyLength];
float lastX = 0;
float lastY = 0;
float lastZ = 0;

void setup() {
  size(500, 500, P3D);
  background(0, 15, 30);
  hint(DISABLE_DEPTH_TEST);
  blendMode(ADD);
  imageMode(CENTER);
  smooth();
  frameRate(1);
  //noLoop();

  lightBall = createLight(random(1), random(2), random(2)); 
  int znum = 0;
  int xynum = 0;
  for (int s = 0; s < 180; s += addZ) {
    float radianS = radians(s);
    z[znum] = radius * cos(radianS); 
    for (int t = 0; t < 360; t += addXY) {
      int r = int(random(0, 5));
      if (r == 1 || r == 2 || r == 3) {
        float radianT = radians(t);
        x[xynum] = radius * cos(radianT) * sin(radianS);
        y[xynum] = radius * sin(radianT)  * sin(radianS);
        drawZ[xynum] = znum;
      }
      xynum += 1;
    }
    znum += 1;
  }

  //GIF Animation 
  gifExport = new GifMaker(this, "rakugaki.gif"); 
  gifExport.setRepeat(0); 
  gifExport.setQuality(20); 
  gifExport.setDelay(500);
}

void draw() {
  background(0, 15, 30);
  //原点を画面中心に
  translate(width, height/2, 0);
  //x軸を中心に回転
  rotateX(frameCount * 0.05);
  //z軸を中心に回転
  rotateZ(frameCount * 0.01);
  int num = 0;
  while (num <= 5000) {
    int randxy = int(random(0, x.length));
    if (randxy > 1  && randxy < x.length - 1 
      && x[randxy] != 0 && y[randxy] != 0   ) {
      stroke(#6070F5, 80);
      strokeWeight(0.2);
      while (x[randxy + 1] != 0 && y[randxy + 1] != 0 ) {
        line(lastX, lastY, lastZ, x[randxy], y[randxy], z[drawZ[randxy]]);
        stroke(#6070F5, 80);
        strokeWeight(1);
        line(x[randxy], y[randxy], z[drawZ[randxy]], 
          x[randxy + 1], y[randxy + 1], z[drawZ[randxy]]);

        //現在の座標を保存
        pushMatrix();
        // 画像の座標へ原点を移動
        translate(x[randxy], y[randxy], z[drawZ[randxy]]);
        // 画像の向きを元に戻す
        rotateY(-frameCount*0.05);
        rotateX(-frameCount*0.01);
        // 画像を描画
        image(lightBall, 0, 0);
        //保存した座標を再展開
        popMatrix();

        lastX = x[randxy + 1 ];
        lastY = y[randxy + 1];
        lastZ = z[drawZ[randxy + 1]];
        randxy ++;
        if (randxy >= x.length - 1) {
          lastX = x[randxy ];
          lastY = y[randxy];
          lastZ = z[drawZ[randxy]];
          break;
        }
      }
    }
    num ++;
  }
  if(frameCount <= 30){
  textSize(18);
  text("G l o b a l   E l i t e", -width/2, height/2, 0);
  textSize(28);
  text("3", -width/2+ 50, height/2 + 50, 0);
  }
  
  if (frameCount <= 50) {
    gifExport.addFrame();
    println(frameCount);
  } else {
    gifExport.finish();
    exit();
  }
}

//void mouseClicked() {
//  save("rakugaki.png");
//}

//発光球体画像の生成関数
PImage createLight(float rPower, float gPower, float bPower) {
  int side=30; //1辺の大きさ
  float center=side/2.0; //中心座標
  //画像生成
  PImage img=createImage(side, side, RGB);

  //画像の1つ1つのピクセルの色を設定
  for (int y=0; y<side; y+=1) {
    for (int x=0; x<side; x+=1) {
      //中心から近づくほどrgb値が大きくなる(中心に近づくほど発光する)
      //離れるほどcolor(0, 0, 0)=黒に近づく
      //距離を正確に算出(平方根)するよりも50など定数で割ったほうが
      //白色の発光部分が大きくかつ中心から離れるほど暗くなる
      //float distance = sqrt(sq(center-x) + sq(center-y));
      float distance=(sq(center-x)+sq(center-y))/0.7;
      int r=int((255*rPower)/distance);
      int g=int((255*gPower)/distance);
      int b=int((255*bPower)/distance);
      img.pixels[x+y*side]=color(r, g, b);
    }
  }
  return img;
}