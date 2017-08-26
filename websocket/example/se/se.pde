import websockets.*;

WebsocketServer ws;
int now;
float x,y;

void setup(){
  size(400,400);
  ws= new WebsocketServer(this,8025,"/john");
  now=millis();
  x=0;
  y=0;
}

void draw(){
  background(0);
  ellipse(x,y,10,10);
  if(millis()>now+ 20){
    if (x != mouseX && y != mouseY) {
      x = mouseX;
      y = mouseY;
      ws.sendMessage(x + "," + y);
      now=millis();
    }
  }
}

void webSocketServerEvent(String msg){
 println("Server has received " + msg);
 
}