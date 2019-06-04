import oscP5.*;

public class Plugger
{
  public Control Control;
  
  private AddressFactory _addressFactory;
  private OscP5 _oscP5;
  
  public Plugger(OscP5 oscP5, String sequenceName, Control control)
  {
    Control = control;
    
    _addressFactory = new AddressFactory(sequenceName);
    _oscP5 = oscP5;
  }
  
  public void plug(DeviceGroup deviceGroup, DeviceType deviceType)
  {
    String address = _addressFactory.getAddress(deviceGroup, deviceType, Control);
    _oscP5.plug(this, "OnReceived", address);
  }
  
  public void plug(DeviceGroup deviceGroup)
  {
    String address = _addressFactory.getAddress(deviceGroup, Control);
    _oscP5.plug(this, "OnReceived", address);
  }
  
  public void plug(DeviceType deviceType)
  {
    String address = _addressFactory.getAddress(deviceType, Control);
    _oscP5.plug(this, "OnReceived", address);
  }
  
  public void plug()
  {
    String address = _addressFactory.getAddress(Control);
    _oscP5.plug(this, "OnReceived", address);
  }
  
  public void OnReceived(float val)
  {
    Control.apply(val);
    println(val);
  }
}
