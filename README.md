# P5M_RuntimeMonitor

Resource monitor for Processing.


```processing

P5M_RuntimeMonitor runtimeMonitor;

void setup(){
  size(800,600);
  runtimeMonitor = new P5M_RuntimeMonitor();
}


void draw(){
  background(100);
  
  // Your code...
  
  runtimeMonitor.show();
}


```