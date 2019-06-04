OPC opc;
PApplet app;
int x;
VideoPlayer videoPlayer[] = new VideoPlayer[2];
Plugger OPCBrightness;
Plugger holdingOn_Play;


void setup() 
{
  size(180, 200, P2D);
  background(0);
  app = this;
  //opc = new OPC(this, "127.0.0.1", 7890);
  
  //Device leftSnareLeftStick = new Device(DeviceGroup.LeftSnare, DeviceType.LeftStick);
  //Device leftSnareRightStick = new Device(DeviceGroup.LeftSnare, DeviceType.LeftStick);
  //Device leftSnarePanel = new Device(DeviceGroup.LeftSnare, DeviceType.Panel);
  
  //leftSnareLeftStick.configure(opc);
  //leftSnareRightStick.configure(opc);
  //leftSnarePanel.configure(opc);
  
  OscP5 oscP5 = new OscP5(this, 8000);
  
  OPCBrightness = new Plugger(oscP5, "OPC", new Brightness());
  OPCBrightness.plug(); // Plug globally
  
  holdingOn_Play = new Plugger(oscP5, "Holding On", new Play());
  holdingOn_Play.plug(); // Plug globally
  
  videoPlayer[0] = new LaptopVideoPlayer("HoldingOnSnares.mp4", height, width, false);
  videoPlayer[1] = new LaptopVideoPlayer("transit.mov", height, width, false);
  //videoPlayer[0] = new RaspberryPiVideoPlayer("HoldingOnSnares.mp4", height, width, false);
  
  videoPlayer[0].load();
  videoPlayer[1].load();
  
}

void draw()
{
  videoPlayer[x].playNextFrame();
}

//void mousePressed() {
// x = 1;
// videoPlayer[1].setFirstFrame();
// videoPlayer[1].play();
//}

//void keyPressed() {
//  if (key == CODED) {
//    if (keyCode == UP) {
// x = 0;
// videoPlayer[0].setFirstFrame();
// videoPlayer[0].play();
//    }
//  }
//}
