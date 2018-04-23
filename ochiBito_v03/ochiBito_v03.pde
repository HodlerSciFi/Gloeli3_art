//モノクロ版（表紙イメージと区別用に）
PImage img1;
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
 //smooth(0);
img1 = loadImage("redraw_dolphine_2.png");
imageMode(CENTER);
 image(img1, width/2,  height/2 + 100 , width, height);
   color c = color(255);
   for(int i=0; i < height; i +=1){
     for(int j=0; j <width; j +=1){
       if(red(get(j, i)) > 0){
         //c = color(#2E2E46);
         c = color(255);
       }else{
         //c = color(#03FAEB);
         c = color(0);
       }
       set(j, i, c);
     }
 }

 
 int x = 0;
 int y = 0;
 for(int i = 0; i < 85000; i+=1){
   x = int(random(width));
   y = int(random(height));
   if((get(x, y)) == color(255) ){
     fill(255);
     strokeWeight(2);
     float size = random(10, 30);
     ellipse(x, y, size, size);
   }
 }
 //title();
 //title();
 save("ochiBit_cover_mono_noTilte_2.png");
 exit();
}

//タイトル挿入
void title(){
  font = createFont("OradanoGSRR.ttf", 80);
  textFont(font);
  textAlign(LEFT);
  fill(255);
  text("堕 ち 人 賛 歌", 200, 150 );
  font = createFont("OradanoGSRR.ttf", 70);
  textFont(font);
  text("架旗透", 200, 240);
  
}
