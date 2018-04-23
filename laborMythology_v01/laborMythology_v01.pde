PImage img1, img2;
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
 smooth(0);
 
 
 img1 = loadImage("mark_01.png");
 imageMode(CENTER);
 image(img1, width/2, height/2 - 900, 1600, 1600);
 


 loadMark();
 //キャンパス再読み込み
 loadPixels();
 save("base.png");
 
background(0);
img2 = loadImage("base.png");
//image(img2, width/2, height/2);
  for(int i=0; i< img2.height; i+=20){
       for(int j=0; j< img2.width; j+=20){
         color c = img2.get(i, j);
         int fillC ; 
           if(c == -1){
             int messageNum = int(random(0, 6));
             switch(messageNum){
               case 1:
                 textAlign(CENTER);
                 textSize(random(28, 50));
                 fillC = int(random(0, 7)); 
                 if( fillC > 1){
                    fill(255);
                 }else{
                 //fill(#FC0808);
                 fill(255);
                 }
                 text("Error: ", i, j);
                 break;
               case 2:
                 textAlign(CENTER);
                 textSize(random(28, 50));
                 fillC = int(random(0, 7)); 
                 if( fillC > 1){
                    fill(255);
                 }else{
                 //fill(#FC0808);
                 fill(255);
                 }
                 text("login ", i, j);
                 break;
             case 3:
                 textAlign(CENTER);
                 textSize(random(28, 50));
                 fillC = int(random(0, 7)); 
                 if( fillC > 1){
                    fill(255);
                 }else{
                 //fill(#FC0808);
                 fill(255);
                 }
                 text("please ", i, j);
                 break;
               case 4:
                 textAlign(CENTER);
                 textSize(random(28, 50));
                 fillC = int(random(0, 7)); 
                 if( fillC > 1){
                    fill(255);
                 }else{
                 //fill(#FC0808);
                 fill(255);
                 }
                 text("contact", i, j);
                 break;
               case 5:
                 textAlign(CENTER);
                 textSize(random(28, 50));
                 fillC = int(random(0, 7)); 
                 if( fillC > 1){
                    fill(255);
                 }else{
                 //fill(#FC0808);
                 fill(255);
                 }
                 text("Admin", i, j);
                 break;
               default:
                 textAlign(CENTER);
                 textSize(random(28, 50));
                  fillC = int(random(0, 7)); 
                 if( fillC > 1){
                    fill(255);
                 }else{
                 //fill(#FC0808);
                 fill(255);
                 }
                 text("role", i, j);
                 break;
             }          
           }
         }
       }
}

void draw(){
  
  //for(int i = 0; i <=80; i ++){
  //stroke(255);
  //strokeWeight(random(2, 10));
  //float x1 = random(700, 750);
  //float x2 = random(770, 810);
  //float y = random(400, 1500);
  //line(x1, y, x2, y);
  //}
    //title();
    save("sprintNight_paper_noTitle_3.png");
    exit();
}

//画像を白黒変換
void loadMark(){
  loadPixels();
 for(int y = 0; y < height; y++){
  for(int x = 0; x < width; x ++){
   int loc = x + y*width;
   float r = red(pixels[loc]);
   float g = green(pixels[loc]);
   float b = blue(pixels[loc]); 
   if(b != 255){
     r = 0;
     g = 0;
     b = 0;
   }
   pixels[loc] = color(r, g, b);
  }
 }
 updatePixels();
}

//タイトル挿入
void title(){
  font = createFont("OradanoGSRR.ttf", 80);
  textFont(font);
  textAlign(CENTER);
  //fill(#E0A5AE);
  fill(255);
  text("この疾走する夜を駆けろ！", width/2 + 200, height/2 + 550);
  
  font = createFont("OradanoGSRR.ttf", 70);
  textFont(font);
  textAlign(CENTER);
  //fill(#E0A5AE);
  fill(255);
  text("東京ニトロ", width/2  + 200, height/2 + 750);
}
