void setup()
{
  Serial.begin(115200);
  delay(1500);
}

void loop()
{
  for (double i = 0; i < 2*3.14159; i += (2*3.14159)/100)
  {
    Serial.println((int)(1000*sin(i)));
    //Serial.println((int)(100*pow(sin(i),cos(i))));
    //Serial.println((int)(100*log(sin(i))));
    delay(25);
  }
}
