<<<<<<< HEAD
//dennys neves
//c21364936

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer player;
FFT fft;
float[] angle1;
float[] angle2;
float[] y,x, x2, y2;

void setup(){
  size(1920,1080,P3D);
  minim = new Minim(this);
  player = minim.loadFile("stop it.mp3");
  player.play();
  
  fft = new FFT(player.bufferSize(), player.sampleRate());
  y = new float [fft.specSize()];
  x = new float [fft.specSize()];
  x2 = new float [fft.specSize()];
  y2 = new float [fft.specSize()];
  angle1 = new float [fft.specSize()];
  angle2 = new float [fft.specSize()];
  frameRate(120);
}
void draw(){
  background(0);
  fft.forward(player.mix);
  visualization();
}

void visualization(){
  noStroke();
  
  //bigger main
  pushMatrix();
  translate(width/2,height/2);
  for(int i = 0; i < fft.specSize(); i++){
    y[i] = y[i] + fft.getBand(i)/1000;
    x[i] = fft.getFreq(i)/500;
    angle1[i] = angle1[i] + fft.getFreq(i)/3000;
    
    rotateY(cos(angle1[i]/2));
    
    fill(fft.getFreq(i)*5,55,fft.getBand(i)*5);
    pushMatrix();
    translate((x[i]+200),(y[i]-175));
    rect(-fft.getBand(i)/50, -fft.getBand(i)/10, fft.getFreq(i)/15, fft.getBand(i)/15);
    rect(-fft.getFreq(i)/5, -fft.getFreq(i)/5, fft.getFreq(i)/100, fft.getFreq(i)/20);
    popMatrix();
  }
  popMatrix();
  
  //top middle
  pushMatrix();
  translate(width/2,height/2,0);
  for(int i = 0; i < fft.specSize(); i++){
    y[i] = y[i] ;
    x[i] = x[i] ;
    angle2[i] = angle2[i]+fft.getFreq(i)/10000;
    
    rotateY(cos(angle2[i]/2));
    
    fill(70, fft.getFreq(i)*3, 255-fft.getBand(i)*2);
    pushMatrix();
    translate((x[i]+player.right.get(i)-450), (y[i]+player.right.get(i))+100);
    rect(-fft.getFreq(i)/5, -fft.getFreq(i)/5, fft.getFreq(i)/100, fft.getFreq(i)/20);
    popMatrix();
  }
  popMatrix();
  
  //mid middle
  pushMatrix();
  translate(width/2,height/2,0);
  for(int i = 0; i < fft.specSize(); i++){
    y[i] = y[i] ;
    x[i] = x[i] ;
    angle2[i] = angle2[i]+fft.getFreq(i)/10000;
    
    rotateY(cos(angle2[i]/2));
    fill(70, fft.getFreq(i)*3, 255-fft.getBand(i)*2);
    pushMatrix();
    translate((x[i]+player.right.get(i)-600), (y[i]+player.right.get(i))+100);
    rect(-fft.getFreq(i)/5, -fft.getFreq(i)/5, fft.getFreq(i)/100, fft.getFreq(i)/20);
    popMatrix();
  }
  popMatrix();
  
  //bot middle
  pushMatrix();
  translate(width/2,height/2,0);
  for(int i = 0; i < fft.specSize(); i++){
    y[i] = y[i] ;
    x[i] = x[i] ;
    angle2[i] = angle2[i]+fft.getFreq(i)/10000;
    
    rotateY(-cos(angle2[i]/2));
    
    fill(70, fft.getFreq(i)*3, 255-fft.getBand(i)*2);
    pushMatrix();
    translate((-x[i]+player.right.get(i)+300), (-y[i]+player.right.get(i))+50);
    rect(-fft.getFreq(i)/5, -fft.getFreq(i)/5, fft.getFreq(i)/100, fft.getFreq(i)/20);
    popMatrix();
  }
  popMatrix();
  
  //right bot tail
  pushMatrix();
  translate(width/2,height/2,0);
  for(int i = 0; i < fft.specSize(); i++){
    y2[i] = y2[i]+ fft.getFreq(i)/500;
    x[i] = x[i] ;
    angle2[i] = angle2[i]+fft.getFreq(i)/10000;
    
    fill(20, 255-fft.getFreq(i)*2, 255-fft.getBand(i)*2);
    pushMatrix();
    translate((x[i]+600), (-y2[i]+150));
    rect(fft.getBand(i)/5, fft.getBand(i)/5, fft.getFreq(i)/50, fft.getFreq(i)/5);
    popMatrix();
  }
  popMatrix();
  
  //left bot tail
  pushMatrix();
  translate(width/2,height/2,0);
  for(int i = 0; i < fft.specSize(); i++){
    y2[i] = y2[i]+ fft.getFreq(i)/500;
    x[i] = x[i] ;
    angle2[i] = angle2[i]+fft.getFreq(i)/10000;
    
    fill(20, 255-fft.getFreq(i)*2, 255-fft.getBand(i)*2);
    pushMatrix();
    translate((x[i]+300), (y2[i]-600));
    rect(fft.getBand(i)/2, fft.getBand(i)/2, fft.getFreq(i)/20, fft.getFreq(i)/5);
    popMatrix();
  }
  popMatrix();
  
  //mid left tail
  pushMatrix();
  translate(width/2,height/2,0);
  for(int i = 0; i < fft.specSize(); i++){
    y2[i] = y2[i]+ fft.getFreq(i)/500;
    x[i] = x[i] ;
    angle2[i] = angle2[i]+fft.getFreq(i)/10000;
    
    fill(20, 255-fft.getFreq(i)*2, 255-fft.getBand(i)*2);
    pushMatrix();
    translate((x[i]-300), (y2[i]-600));
    rect(-fft.getBand(i)/2, fft.getBand(i)/2, -fft.getFreq(i)/20, fft.getFreq(i)/5);
    popMatrix();
  }
  popMatrix();
  
  //mid right tail
  pushMatrix();
  translate(width/2,height/2,0);
  for(int i = 0; i < fft.specSize(); i++){
    y2[i] = y2[i]+ fft.getFreq(i)/500;
     x[i] = x[i] ;
     angle2[i] = angle2[i]+fft.getFreq(i)/10000;
    
    fill(20, 255-fft.getFreq(i)*2, 255-fft.getBand(i)*2);
    pushMatrix();
    translate((x[i]+90), (-y2[i]-600));
    rect(fft.getBand(i)/5, fft.getBand(i)/5, fft.getFreq(i)/50, fft.getFreq(i)/5);
    popMatrix();
  }
  popMatrix();
  
   //mid mid right tail
  pushMatrix();
  translate(width/2,height/2,0);
  for(int i = 0; i < fft.specSize(); i++){
    y2[i] = y2[i]+ fft.getFreq(i)/500;
    x[i] = x[i] ;
    angle2[i] = angle2[i]+fft.getFreq(i)/10000;
    
    fill(20, 255-fft.getFreq(i)*2, 255-fft.getBand(i)*2);
    pushMatrix();
    translate((x[i]-600), (-y2[i]+150));
    rect(-fft.getBand(i)/5, fft.getBand(i)/5, -fft.getFreq(i)/50, fft.getFreq(i)/5);
    popMatrix();
  }
  popMatrix();
  
  //mid mid left tail
  
  pushMatrix();
  translate(width/2,height/2,0);
  for(int i = 0; i < fft.specSize(); i++){
    y2[i] = y2[i]+ fft.getFreq(i)/500;
    x[i] = x[i] ;
    angle2[i] = angle2[i]+fft.getFreq(i)/10000;
    
    fill(20, 255-fft.getFreq(i)*2, 255-fft.getBand(i)*2);
    pushMatrix();
    translate((x[i]-90), (-y2[i]+600));
    rect(-fft.getBand(i)/5, fft.getBand(i)/5, -fft.getFreq(i)/50, fft.getFreq(i)/5);
    popMatrix();
  }
  popMatrix();
  
  //big core 
  pushMatrix();
  translate(width/2, height/2,0);
  for(int i = 0; i < fft.specSize(); i++){
    y[i] = y[i];
    x[i] = x[i];
    
    angle2[i] = angle2[i]+fft.getFreq(i)/2000;
    rotateX(sin(angle2[i]/5)/50);
    rotateY(cos(angle2[i]/5)/50);
    fill(20, 255-fft.getFreq(i)*2, 255-fft.getBand(i)*2);
    pushMatrix();
    translate((x[i]+50), (y[i]));
    box(fft.getFreq(i)/50+fft.getFreq(i)/50);
    popMatrix();
  }
  popMatrix();
  
  //increase core
  pushMatrix();
  translate(width/2, height/2,0);
  for(int i = 0; i < fft.specSize(); i++){
    y[i] = y[i];
    x2[i] =x2[i]+fft.getFreq(i)/500;
    
    angle2[i] = angle2[i]/1.007+fft.getFreq(i)/6000;
    rotateX(sin(angle2[i]/5)/15);
    rotateY(cos(angle2[i]/5)/15);
    fill(20, 255-fft.getFreq(i)*2, 255-fft.getBand(i)*2);
    pushMatrix();
    translate((x[i]+50), (y[i]-50));
    box(fft.getFreq(i)/50+fft.getFreq(i)/50);
    popMatrix();
  }
  popMatrix();
}
=======
//dennys neves
//c21364936

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer ap;
FFT fft;
float[] angle1;
float[] angle2;
float[] y,x;

void setup(){
  size(1920,1080,P3D);
  minim = new Minim(this);
  ap = minim.loadFile("stop it.mp3");
  ap.play();
  
  fft = new FFT(ap.bufferSize(), ap.sampleRate());
  y = new float [fft.specSize()];
  x = new float [fft.specSize()];
  angle1 = new float [fft.specSize()];
  angle2 = new float [fft.specSize()];
  frameRate(120);
}
void draw(){
  background(0);
  fft.forward(ap.mix);
  go();
}

void go(){
  noStroke();
  pushMatrix();
  translate(width/2,height/2);
  for(int i = 0; i < fft.specSize(); i++){
    y[i] = y[i] + fft.getBand(i)/1000;
    x[i] = x[i] + fft.getFreq(i)/500;
    angle1[i] = angle1[i] + fft.getFreq(i)/3000;
    
    fill(fft.getFreq(i)*3,150,fft.getBand(i)*2);
    pushMatrix();
    translate((x[i]*50),(y[i]*50));
    box(fft.getBand(i)/20*fft.getFreq(i)/15);
    popMatrix();
  }
  popMatrix();
  pushMatrix();
  translate(width/2,height/2,0);
  for(int i = 0; i < fft.specSize(); i++){
    y[i] = y[i] ;
    x[i] = x[i] ;
    angle2[i] = angle2[i]+fft.getFreq(i)/10000;
    
    fill(20,255-fft.getFreq(i)*2,255-fft.getBand(i)*2);
    pushMatrix();
    translate((x[i]+ap.right.get(i)+150), (y[i]+ap.right.get(i))+150);
    box(fft.getBand(i)/10+fft.getFreq(i)/15);
    popMatrix();
  }
  popMatrix();
  pushMatrix();
  translate(width/2,height/2,0);
  for(int i = 0; i < fft.specSize(); i++){
    y[i] = y[i] ;
    x[i] = x[i] ;
    angle2[i] = angle2[i]+fft.getFreq(i)/10000;
    
    fill(20, 255-fft.getFreq(i)*2, 255-fft.getBand(i)*2);
    pushMatrix();
    translate((x[i]+500), (y[i]+150));
    rect(fft.getBand(i)/5,fft.getBand(i)/5,fft.getBand(i)/5,fft.getFreq(i)/5);
    popMatrix();
  }
  popMatrix();
  pushMatrix();
  translate(width/2,height/2,0);
  for(int i = 0; i < fft.specSize(); i++){
    y[i] = y[i] ;
    x[i] = x[i] ;
    angle2[i] = angle2[i]*fft.getFreq(i)/10000;
    rotateX(sin(angle2[i]/5));
    rotateY(cos(angle2[i]/5));
    
    fill(20, 255-fft.getFreq(i)*2, 255-fft.getBand(i)*2);
    pushMatrix();
    translate(x[i]+250, (y[i]+250));
    sphere(fft.getBand(i)/5);
    popMatrix();
  }
  popMatrix();
}

void stop(){
  ap.close();
  minim.stop();
  super.stop();
}




  
>>>>>>> 9b297bf08f888a7fb44e41a1981b25cdb0deedbe
