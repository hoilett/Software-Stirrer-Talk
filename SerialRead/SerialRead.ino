String on = "H"; //the on message is a capial H
String off = "L"; //the off message is a capital L

void setup()
{
  Serial.begin(115200);
  delay(1500);

  pinMode(LED_BUILTIN, OUTPUT);
}

void loop()
{
  //doesn't do anything if no serial data is available
  while(!Serial.available());

  //reads in serial data
  String c = Serial.readStringUntil('\n');
  
  if (on == c) //turns on LED if input string is "H"
  {
    digitalWrite(LED_BUILTIN, HIGH);
  }
  else if (off == c) //turns off LED if input string is "L"
  {
    digitalWrite(LED_BUILTIN, LOW);
  }
  else
  {
    //do nothing
  }
}
