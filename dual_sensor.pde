import processing.serial.*;
Serial port;
float []arduinoData = new float[3];

//add
float val = 0;
int mapVal = 0;

void setup() {
  size(1280, 768, P3D);
  background(0);
  //println(Serial.list());
  String arduinoPort = Serial.list()[7];
  port = new Serial(this, arduinoPort, 9600);
}

void draw() {
  background(0);

  if (port.available() > 0) {

    String inString = port.readStringUntil('\n');//Dual
    if (inString != null) {
      inString = trim(inString);// remove \n
      arduinoData = float(split(inString, ','));// add comma
      println(arduinoData);
    }
  }

  colorMode(HSB, 360, 100, 100, 100);
  //noStroke();
  noFill();
  stroke(arduinoData[0], 100, 100, 100);
  ellipse(width/2, height/2, arduinoData[1], arduinoData[1]);


  //Add
  val = arduinoData[1];
  mapVal = (int)map(val, 0, width/1.5, val/8, 0);
  println(mapVal);

  int uRes = mapVal;
  int vRes = mapVal;

  pushMatrix();

  translate(width/2, height/2, 0);
  sphereDetail(uRes, vRes);
  sphere(120);

  stroke(val * 2, 20, val * 2);
  sphere(arduinoData[0] *2 + arduinoData[2] * 2);
  popMatrix();
}
