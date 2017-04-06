// Graphing sketch
 
 
 // This program takes ASCII-encoded strings
 // from the serial port at 9600 baud and graphs them. It expects values in the
 // range 0 to 1023, followed by a newline, or newline and carriage return
 
 // Created 20 Apr 2005
 // Updated 18 Jan 2008
 // by Tom Igoe
 // This example code is in the public domain.
 
import processing.serial.*;
 
Serial Arduino;        // The serial port
int xPos = 1;         // horizontal position of the graph
float data = 0;

void setup ()
{
  // set the window size:
  size(700, 500);        
  
  // List all the available serial ports
  println(Serial.list());
  // I know that the third port in the serial list on my mac
  // is always my  Arduino, so I open Serial.list()[0].
  // Open whatever port is the one you're using.
  Arduino = new Serial(this, Serial.list()[2], 115200);
  // don't generate a serialEvent() unless you get a newline character:
  Arduino.bufferUntil('\n');
  // set inital background:
  background(255);
}


void draw ()
{
  // draw the line:
  stroke(255, 0, 0);
  line(xPos, height-data+5, xPos, height - data);

  // at the edge of the screen, go back to the beginning:
  if (xPos >= width) {
    xPos = 0;
    background(255);
  } else {
    // increment the horizontal position:
    xPos++;
  }
}

 
void serialEvent (Serial Arduino)
{
  // get the ASCII string:
  String inString = Arduino.readStringUntil('\n');
 
  if (inString != null)
  {
    // trim off any whitespace:
    inString = trim(inString);
    //println(inString);
    // convert to an int and map to the screen height:
    data = float(inString);
    
    data = map(data, -1023, 1023, 0, height);
    println(data);
  }
}