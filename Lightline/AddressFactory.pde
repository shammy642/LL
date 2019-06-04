public class AddressFactory
{  
  public String SequenceName;
  
  public AddressFactory(String sequenceName)
  {
    SequenceName = sequenceName;
  }
  
  public String getAddress(DeviceGroup deviceGroup, DeviceType deviceType, Control control)
  {
    return "/" + deviceGroup.toString() + "/" + deviceType.toString() + "/" + SequenceName + "/" + control.toString();
  }
  
  public String getAddress(DeviceType deviceType, Control control)
  {
    return "/Global/" + deviceType.toString() + "/" + SequenceName + "/" + control.toString();
  }
  
  public String getAddress(DeviceGroup deviceGroup, Control control)
  {
    return "/" + deviceGroup.toString() + "/" + SequenceName + "/" + control.toString();
  }
  
  public String getAddress(Control control)
  {
    return "/Global/" + SequenceName + "/" + control.toString();
  }
}
