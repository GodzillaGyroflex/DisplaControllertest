int ready_pin = 2;
int val = 0;
float dut = 0;
String duty_cycle;
String frequency;
String fall_time;
String rise_time;

void setup() {
  // put your setup code here, to run once:
  pinMode(ready_pin, INPUT);
  Serial.begin(9600);
  Serial1.begin(9600);
  Serial2.begin(9600);
  while (!Serial) {
    ; 
  }
}

void loop() {
  // put your main code here, to run repeatedly:
  val = digitalRead(ready_pin);
  if (val = HIGH) {
    byte f = Serial1.read();
    byte d = Serial2.read();  
    float vdut = d; 
    float fr = f;
    if(vdut > 10){
        dut = vdut;
      }
    float j = pow(10,-6);
    float freq = fr/j;
    float i = pow(10,12);
    
    float alfa = dut/255;  
    float duty = alfa*100;
    float Tfall = (1-alfa)/(freq*33);
    float Trise = alfa/(freq*33);
    float fall = Tfall*i;
    float rise = Trise*i;
    fall_time = String(fall);
    rise_time = String(rise);
    frequency = String(freq);
    duty_cycle = String(duty);

    Serial.print("#S|FRQIN|["); 
  
    Serial.print(frequency);
    Serial.print(", ");  
    Serial.print(duty_cycle);
    Serial.print(", ");
    Serial.print(fall_time);
    Serial.print(", ");
    Serial.print(rise_time);
   

    Serial.println("]#"); 
  }
    
  delay(100);
}
