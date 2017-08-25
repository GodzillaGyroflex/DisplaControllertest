void setup() {
  // put your setup code here, to run once:
    Serial.begin(9600);
  Serial1.begin(9600);
  Serial2.begin(9600);
  while (!Serial) {
    ; 
  }


}

void loop() {
  // put your main code here, to run repeatedly:
  if (Serial2.available()) {
  byte f = Serial1.read();
  byte d = Serial2.read();
  float fr = f;
  float vdut = d;
  float j = pow(10,-6);
  float freq = fr/j;
  float alfa = vdut/255;  
  float duty = alfa*100;

  if(duty > 80){
    duty = duty/2;
    }

    if(duty < 30){
    duty = duty*2;
    }
 
  String frequency = String(freq);
  String duty_cycle = String(duty);

  Serial.print("#S|FRQIN|["); 
  
  Serial.print(frequency);
  Serial.print(", ");  
  Serial.print(duty_cycle); 

  Serial.println("]#");

 

  
  delay(1000);
}

}
