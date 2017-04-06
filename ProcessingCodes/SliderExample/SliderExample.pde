/**
 * ControlP5 Slider set value
 * changes the value of a slider on keyPressed
 *
 * by Andreas Schlegel, 2012
 * www.sojamo.de/libraries/controlP5
 *
 */
 
import controlP5.*;

ControlP5 cp5;

int myColorBackground = color(0,0,0);

int sliderValue = 100;

void setup() {
  size(400,400);
  cp5 = new ControlP5(this);
  
  cp5.addSlider("slider")
     .setRange(50,200)
     .setValue(128)
     .setPosition(50,160)
     .setSize(300,50);
     
}

void draw() {
  background(myColorBackground);
}

void slider(int theColor) {
  myColorBackground = color(theColor);
  println("a slider event. setting background to "+theColor);
  cp5.getController("sliderValue").setValue(theColor);
}