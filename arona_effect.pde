// global
int tri_size = 50;
int x_size = 1000;
int y_size = 1000;

float tmp_cx = 0;
float tmp_cy = 0;
float tmp_x_1, tmp_x_2, tmp_x_3;
float tmp_y_1, tmp_y_2, tmp_y_3;
float tmp_color_;
float tmp_rand;

int tri_num = 65;

// color 1 0,178,221
// color 2 180,229,246
// color 3 69,180,200
// color 4 247,222,244

Tri[] tris = new Tri[tri_num];

void setup(){
  print("SetUp\n");
  size(1000, 1000); // 描画エリアの数 → 動画サイズ
  background(0,0,0);
  //noLoop();
  
  for (int i = 0; i < tri_num ; i++){
    efi_one();
    tris[i] = new Tri(tmp_cx, tmp_cy, tmp_x_1, tmp_y_1, tmp_x_2, tmp_y_2, tmp_x_3, tmp_y_3, tmp_color_, tmp_rand);
  }
  
  delay(1000);
}
void draw(){
  //print("Draw\n");
  //background(0);
  background(0,0,0);
  for (int i = 0; i < tri_num ; i++){
    tris[i].del();
    tris[i].draw_tri();
  }
  delay(100);
  if(frameCount <= 1000){
    saveFrame("frames/####.png");
  }
}

class Tri{
  float c_x, c_y, x_1, y_1, x_2, y_2, x_3, y_3;
  float color_, alpha;
  float r,g,b;
  Tri(float c_x, float c_y, float x_1, float y_1, float x_2, float y_2, float x_3, float y_3, float color_, float rand){
    this.c_x = c_x;
    this.c_y = c_y;
    this.x_1 = x_1;
    this.y_1 = y_1;
    this.x_2 = x_2;
    this.y_2 = y_2;
    this.x_3 = x_3;
    this.y_3 = y_3;
    this.color_ = color_;
    this.alpha = 255 * color_;
    // color 1 0,178,221
    // color 2 180,229,246
    // color 3 69,180,200
    // color 4 247,222,244
    if(rand < 10){
      this.r = 0;
      this.g = 178;
      this.b = 221;
    }
    else if(rand < 20){
      this.r = 180;
      this.g = 229;
      this.b = 246;
    }
    else if(rand < 30){
      this.r = 69;
      this.g = 180;
      this.b = 200;
    }
    else{
      this.r = 247;
      this.g = 222;
      this.b = 244;
    }
  }
  
  void del(){
    alpha = color_ * alpha;
  }
  
  void draw_tri(){
    fill(r,g, b,alpha);
    noStroke(); 
    triangle(x_1, y_1, x_2, y_2, x_3, y_3);
  }
}

void mousePressed(){
  
  redraw();
    
  
}

void efi_one(){
  float sin60 = sin(radians(60));
  float cos60 = cos(radians(60));
  float cos90 = cos(radians(90));
// エフェクトエリア 400x700
  int x_area = 400;
  int y_area = 700;
// 三角を

// ランダム座標に生成
  // rand x
  float x = random(x_area)+ ((x_size - x_area)/2);
  float y = random(y_area)+ ((y_size - y_area)/2);
  
// ランダム大きさ（一定範囲）
  float init_size = random(1,2) * tri_size;

// ランダム 色
  float color_ = random(0.65,0.9); // 透明度
  float rand_color = random(40);

// ランダム上下
  float tr_ = random(100);
  float x_1, y_1, x_2, y_2, x_3, y_3;
  if (tr_ > 50){
    x_1 = x ;
    y_1 = y + init_size * cos90;
    
    x_2 = x + cos60 * init_size;
    y_2 = y - sin60 * init_size;
    
    x_3 = x - cos60 * init_size;
    y_3 = y - sin60 * init_size;
  }
  else{
    x_1 = x ;
    y_1 = y - init_size * cos90;
    
    x_2 = x + cos60 * init_size;
    y_2 = y + sin60 * init_size;
    
    x_3 = x - cos60 * init_size;
    y_3 = y + sin60 * init_size;
    
  }
  print("   P1 ", x_1,y_1);
  print("   P2 ", x_2,y_2);
  print("   P3 ", x_3,y_3);
  print("\n");
  //triangle(x_1, y_1, x_2, y_2, x_3, y_3);
  
  tmp_cx = x;
  tmp_cy = y;
  tmp_x_1 = x_1;
  tmp_y_1 = y_1;
  tmp_x_2 = x_2;
  tmp_y_2 = y_2;
  tmp_x_3 = x_3;
  tmp_y_3 = y_3;
  tmp_color_ = color_;
  tmp_rand = rand_color;
  
}
