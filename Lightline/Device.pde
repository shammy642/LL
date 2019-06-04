public class Device
{
  public DeviceGroup _deviceGroup;
  public DeviceType _deviceType;
  
  public Device(DeviceGroup deviceGroup, DeviceType deviceType)
  {
    _deviceGroup = deviceGroup;
    _deviceType = deviceType;
  }
  
  // This really should be tidied up
  public void configure(OPC opc)
  {
    if (_deviceType == DeviceType.Panel)
    {
      if (_deviceGroup == DeviceGroup.LeftSnare || _deviceGroup == DeviceGroup.RightSnare)
      {
        opc.ledGrid(0, 48, 21, width/2, height - height/4, width/48.0, height/2.0/24.0, 0, false, false);
      }
    }
    
    if (_deviceGroup == DeviceGroup.LeftSnare || _deviceGroup == DeviceGroup.RightSnare)
    {
      //Left Stick
      opc.ledStrip(48*21, 60, width/4, height/4, width / 120.0, 0, false);
      
      //Right Stick
      opc.ledStrip(48*21+60, 60, width - width/4, height/4, width / 120.0, 0, true);
    }
  }
}
