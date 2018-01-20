import gifAnimation.*; //<>// //<>// //<>//
GifMaker gifExport;

PImage lightBall;
int addZ = 5;
int addXY = 5;
int zLength = (180 / addZ) ;
int xyLength = (360/addXY) * zLength;

float x[] = new float [xyLength];
float y[] = new float [xyLength];
float z[] = new float [zLength];

float radius = 200; //半径

int zFrame = 1;
int jAdd = 0;

void setup() {
  size(500, 500, P3D);
  background(0, 15, 30);
  hint(DISABLE_DEPTH_TEST);
  blendMode(ADD);
  imageMode(CENTER);
  smooth();
  frameRate(20);
  //noLoop();

  lightBall = createLight(random(1), random(2), random(2)); 
  int znum = 0;
  int xynum = 0;
  for (int s = 0; s < 180; s += addZ) {
    float radianS = radians(s);
    z[znum] = radius * cos(radianS); 
    for (int t = 0; t < 360; t += addXY) {
      int r = int(random(0, 5));
      if (r == 1 || r == 2 || r == 3 || r == 4 ) {
        float radianT = radians(t);
        x[xynum] = radius * cos(radianT) * sin(radianS);
        y[xynum] = radius * sin(radianT)  * sin(radianS);
      }
      xynum += 1;
    }
    znum += 1;
  }

  //GIF Animation 
  //gifExport = new GifMaker(this, "rakugaki.gif"); 
  //gifExport.setRepeat(0); 
  //gifExport.setQuality(10); 
  //gifExport.setDelay(180);
}

void draw() {
  background(0, 15, 30);
  //原点を画面中心に
  translate(width/2, height/2, 0);
  //x軸を中心に回転
  rotateX(frameCount * 0.01);
  //z軸を中心に回転
  rotateY(frameCount * 0.01);
  int jAdd = 0;
  for (int i = 0; i < z.length; i ++) {
    if (i != 0) {
      jAdd += (360/addXY) ;
    }
    for (int j = jAdd; j < jAdd + (360/addXY); j++) {
      if (x[j] != 0 && y[j] != 0) {
        //現在の座標を保存
        pushMatrix();
        // 画像の座標へ原点を移動
        translate(x[j], y[j], z[i]);
        // 画像の向きを元に戻す
        rotateY(-frameCount*0.01);
        rotateX(-frameCount*0.01);
        // 画像を描画
        //image(lightBall, 0, 0);
        //保存した座標を再展開
        popMatrix();      
        if(x[j-1] != 0 && y[j-1] != 0){
          stroke(100);
          strokeWeight(3);
          line(x[j], y[j], z[i], x[j-1], y[j-1], z[i]);
        }
      }
    }
  }
  //if (frameCount <= 100) {
  //  gifExport.addFrame();
  //} else {
  //  gifExport.finish();
  //  exit();
  //}
}

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