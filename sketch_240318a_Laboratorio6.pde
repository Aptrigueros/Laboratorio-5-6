import processing.serial.*;

int estadoLed = 0;
Serial puerto;
void setup() {
  size(200, 200);
  puerto = new Serial(this, Serial.list()[2], 9600); 
}

void draw() {
  background(255);
  fill(0);
  ellipse(width/2, height/2, 50, 50);
  if (estadoLed == 1) {
    fill(255, 0, 0);
    ellipse(width/2, height/2, 30, 30);
  }
}

void mousePressed() {
  print("Coordenada Mouse", mouseX, " " , mouseY);
  if (dist(mouseX, mouseY, width/2, height/2)<25) {
    if (estadoLed==0) {
      puerto.write('1');
      estadoLed = 1;
    } else {
      puerto.write('0');
      estadoLed = 0;
    }
  }
}
