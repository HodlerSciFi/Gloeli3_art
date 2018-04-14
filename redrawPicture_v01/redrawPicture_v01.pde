PImage img1;

void settings(){
img1 = loadImage("dolphine_1.png");
 size(1000, 1000);
}

void setup(){
 //ePub版:横116mm, 縦185mm, 350px換算のサイズ
  //size(1599, 2550);
  //紙版:横111mm, 縦154mm, 350px換算のサイズ
  //size(1530, 2123);
  //size(500, 500);
  //横266mm, 縦191mm, 600px換算のサイズ
  //size(4512, 6284);
 //background(255);
 //smooth(0);
 //imageMode(CENTER);
 image(img1, 0,  0, 1000, 1000);
}

void draw(){
   color c;
   for(int i=0; i< height; i+=1){
     for(int j=0; j<width; j+=1){
       if(red(get(i, j)) > 2){
         c = color(255, 255, 255);
       }else{
         c = color(0, 0, 0);
       }
       set(i, j, c);
     }
 }
 save("redraw_dolphine.png");
exit();
}
