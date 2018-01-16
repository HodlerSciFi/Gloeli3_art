//import gifAnimation.*;
//GifMaker gifExport;
PImage lightBall;
float x = 0.0;
float y = 0.0;
float z = 0.0;
float lastx = 0.0;
float lasty = 0.0;
float lastz = 0.0;

void setup() {
  size(500, 500, P3D);
  // zテストを無効化
  hint(DISABLE_DEPTH_TEST);
  blendMode(ADD);
  imageMode(CENTER);
  smooth();
  //noLoop();
  lightBall = createLight(random(1), random(2), random(2));
  //GIF Animation 
  //gifExport = new GifMaker(this, "rakugaki.gif"); 
  //gifExport.setRepeat(0); 
  //gifExport.setQuality(10); 
  //gifExport.setDelay(80);
}

void draw() {  
  background(0, 15, 30);
  //原点を画面中心に
  translate(width/2, height/2, 0);
  //x軸を中心に回転
  rotateX(frameCount * 0.01);
  //z軸を中心に回転
  rotateY(frameCount * 0.01);
  //z軸方向に円を配置
  float radius = 200; //半径
  for (int s = 0; s <= 180; s += 10) {
    float radianS = radians(s);
    //0 <= s <= 180より-1 <= cos(radianS) <= 1
    //よってzは-radius <= z <= radius
    z = radius * cos(radianS); //これだけだとz座標上に半径と同じ長さの点をプロットするだけで円筒になる
    //円状に点を描写(x-y)
    for (int t = 0; t < 360; t += 10) {
      //角度をラジアンに
      float radianT = radians(t);
      //点の座標を計算
      //sin(radianS)は0->1->0の順で変化するので
      //radius * sin(radianS)は0->200->0
      //はじめのfor文でz軸方向に移動した分、sin(radianS)で補正をかける
      x = radius * cos(radianT) * sin(radianS);
      y = radius * sin(radianT)  * sin(radianS);

      //線を描画
      stroke(0, 128, 128);
      strokeWeight(sin(radianS)* 4);
      //noStroke();
      if (lastx == 0 && lasty ==0 && lastz == 0 ) {
        lastx = x;
        lasty = y;
        lastz = z;
      } else {
        line(x, y, z, lastx, lasty, lastz);
        lastx = x;
        lasty = y;
        lastz = z;
      }

      //現在の座標を保存
      pushMatrix();
      // 画像の座標へ原点を移動
      translate(x, y, z);
      // 画像の向きを元に戻す
      rotateY(-frameCount*0.01);
      rotateX(-frameCount*0.01);
      // 画像を描画
      image(lightBall, 0, 0);
      //保存した座標を再展開
      popMatrix();
    }
    
    //円の最初と最後の発光球体をつなぐ線
     x = radius * cos(0) * sin(radianS);
     y = radius * sin(0)  * sin(radianS);
     line(x, y, z, lastx, lasty, lastz);
    //初期化
    lastx = 0.0;
    lasty = 0.0;
    lastz = 0.0;
  }
  //if (frameCount <= 450) {
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