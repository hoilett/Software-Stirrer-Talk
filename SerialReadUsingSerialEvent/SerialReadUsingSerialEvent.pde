/*
  FILENAME:   SerialReadUsingSerialEvent.pde
  AUTHOR:     Orlando S. Hoilett
  CONTACT:    orlandohoilett@gmail.com
  VERSION:    0.0
  WEBSITE:    http://calveng.io/
  
  
  AFFILIATIONS:
  Calvary Engineering LLC, West Lafayette, IN, USA
  "A group of makers who like to 'have a little fun and save the
  world while we're at it'" (C) Orlando Hoilett, 2017


  UPDATES:
  Version 0.0
  2017/04/06:0307>
      Demo version for Software Stirrer talk.


  DESCRIPTION
  Simple example demonstrating reading serial data from a COM port. When serial data
  is available serialEvent() is automatically triggered and executes.
  
  
  The MIT License (MIT)
  
  Copyright (c) 2017 Orlando Hoilett
  
  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:
  
  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.
  
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
  
*/
 
import processing.serial.*; 
 
Serial Arduino;    // The serial port
String inString;  // Input string from serial port
 
void setup() { 
  size(500,400); 

  // List all the available serial ports
  println(Serial.list());
  
  // I know that the third port in the serial list on my mac
  // is always my  Arduino, so I open Serial.list()[0].
  // Open whatever port is the one you're using.
  Arduino = new Serial(this, Serial.list()[2], 115200);
  
  // don't generate a serialEvent() unless you get a newline character:
  Arduino.bufferUntil('\n');
  
  // set inital background:
  background(0);
} 
 
void draw() {
  background(0);  
} 
 
void serialEvent(Serial p) {
  String inString = Arduino.readStringUntil('\n');
  if (inString != null)
  {
    inString = trim(inString);
    print("inString: ");
    println(inString);
  }
} 