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
 image(img1, width/2,  height/2 + 400, width, height);
   color c = color(255);
   for(int i=0; i < height; i +=1){
     for(int j=0; j <width; j +=1){
       if(red(get(j, i)) > 0){
         //c = color(#2E2E46);
         c = color(#430511);
       }else{
         //c = color(#03FAEB);
         c = color(#FFFFFF);
       }
       set(j, i, c);
     }
 }

 
 int x = 0;
 int y = 0;
 for(int i = 0; i < 85000; i+=1){
   x = int(random(width));
   y = int(random(height));
   if((get(x, y)) == color(#430511) ){
     fill(#9A99A5);
     strokeWeight(2);
     float size = random(10, 30);
     ellipse(x, y, size, size);
   }
 }
 //title();
 save("ochiBit_cover_mono.png");
 exit();
}

//タイトル挿入
void title(){
  font = createFont("logotypejp_mp_b_1.1.ttf", 40);
  textFont(font);
  textAlign(LEFT);
  fill(#FFFFFF);
  text("SFアンソロジー", 50, 100);
  
  font = createFont("logotypejp_mp_b_1.1.ttf", 70);
  textFont(font);
  fill(#0803AD);
  textAlign(LEFT);
  text("WORK", 280, 100);
  
  font = createFont("OradanoGSRR.ttf", 180);
  textFont(font);
  textAlign(CENTER);
  fill(#430511);
  text("堕 ち 人 賛 歌", width/2, 300);
  
  //font = createFont("OradanoGSRR.ttf", 80);
  //textFont(font);
  //text("架旗透", width/2, 780);
  
  font = createFont("logotypejp_mp_b_1.1.ttf", 70);
  textFont(font);
  fill(#0803AD);
  textAlign(LEFT);
  text("髙 座 創", width/2 + 300, height/2 - 400);
  text("架 旗 透", width/2 + 300, height/2 - 300);
  text("零 　 F", width/2 + 300, height/2 - 200);
  text("東 京 ニ ト ロ", width/2 + 300, height/2 - 100);
  text("維 嶋 津", width/2 + 300, height/2);
  
}
