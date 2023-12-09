import hypermedia.net.*;
import java.net.InetAddress;
import java.net.UnknownHostException;


UDP udp;  // define the UDP object
String ipAddress;
boolean networked;

ArrayList<String> servers;


void setup() {
  servers = new ArrayList<String>();
  //thread("thing");  
  try {
    InetAddress localhost = InetAddress.getLocalHost();
    ipAddress = localhost.getHostAddress();
    
    udp = new UDP( this, UDPport, "224.0.0.2");
    udp.listen( true );
    networked = true;
  }
  catch (UnknownHostException e) {
    e.printStackTrace();
    networked = false;
  }
}


void thing(){
  while(true){
    delay(1000);
    if(networked) {
      udp.send(""+UDPActive+UDPRequest, ipAddress, UDPport);
    }
  }
}

void draw() {
  
}

void receive( byte[] data, String ip, int port ) {  // <-- extended handler
  //udp.send("test");
  println(data[0], data[1], ip);
}
