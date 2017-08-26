import websockets.*;

WebsocketClient wsc;
int now;
boolean newEllipse;
float x , y;
void setup(){
  size(400,400);
  
  newEllipse=true;
  
  wsc= new WebsocketClient(this, "ws://localhost:8025/john");
  now=millis();
}

void draw(){
  if(newEllipse){
    ellipse(x,y,10,10);
    newEllipse=false;
  }
    
  if(millis()>now+20){
    wsc.sendMessage("client message");
    now=millis();
  }
}

void webSocketEvent(String msg){
  println(msg);
  
  String[] coordinates = msg.split(",");
  x = Float.parseFloat(coordinates[0]);
  y = Float.parseFloat(coordinates[1]);
  newEllipse=true;
}