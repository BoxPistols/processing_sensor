int a0 = 0; //可変抵抗器のピン
int a0Val = 0; //可変抵抗器の値を保存する変数
float a0MapVal;

int a1 = 1;
int a1Val = 0;
float a1MapVal;

int a2 = 2;
int a2Val = 0;
float a2MapVal;


void setup() {
  Serial.begin(9600);
}

void loop() {
  a0Val = analogRead(a0); //可変抵抗器の値を読む
  a1Val = analogRead(a1);
  a2Val = analogRead(a2);
  //  Serial.println(a2Val);

  //可変抵抗器の0-1023の値を0-255に変換
  a0MapVal = map(a0Val, 0, 1023, 0, 255);
  a1MapVal = map(a1Val, 0, 1023, 0, 255);
  a2MapVal = map(a2Val, 0, 1023, 0, 255);

  //シリアル送信 Processingに送る
  Serial.print(a0MapVal);
  Serial.print(",");
  Serial.print(a1MapVal);
  Serial.print(",");
  Serial.print(a2MapVal);
  Serial.print("\n");

  delay(100);
}
