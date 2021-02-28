#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>

const char* ssid = "Haunted House";
const char* password = "kotha103";
int relay = 0;

void setup () {

  Serial.begin(9600);
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {

    delay(1000);
    Serial.println("Connecting..");

  }

}

void loop() {

  if (WiFi.status() == WL_CONNECTED) { 

    HTTPClient http; 

    http.begin("http://lednodebackend.herokuapp.com/led"); 
    int httpCode = http.GET();                                                               
    String relayStatus = "ÖFF";
    if (httpCode > 0) { 
      relayStatus = http.getString();                  
    }
     if (relayStatus == "ON") 
      {                                                        
        Serial.println("Relay Turned ON");                                                        
        digitalWrite(relay, HIGH);                                                         
      } 
      else if (relayStatus == "OFF") 
      {                                                 
        Serial.println("Relay Turned OFF");
        digitalWrite(relay, LOW);                                                        
      }
      else 
      {
        Serial.println("Command Error! Please send ON/OFF");
      }

    http.end();
  }
  delay(3000);
}