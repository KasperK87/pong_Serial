int lf = 10;    // Linefeed in ASCII
String myString = "1";
Serial myPort;  // The serial port

void setupSerial(){
  // List all the available serial ports
  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.clear();
  // Throw out the first reading, in case we started reading 
  // in the middle of a string from the sender.
  myString = myPort.readStringUntil(lf);
  myString = null;
  
  //myPort.buffer(3);
}

int readSerial(){
  //myString = null;
  while (myPort.available() > 0) {
    myString = myPort.readStringUntil(lf);
  }
  
  if (myString != null)
      return(Integer.valueOf(myString.replaceAll("(\\r|\\n)", "")));
  return 0;
}
