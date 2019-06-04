public abstract class Control
{
  public String Name;
  
  protected Control(String name)
  {
    Name = name;
  }
  
  public String toString()
  {
    return Name;
  }
  
  public abstract void apply(float val);
}

public class Brightness extends Control
{
  public Brightness()
  {
    super("Brightness");
  }
  
  public void apply(float val)
  {
    tint(255, val);
  }
}


public class Play extends Control
{
  public Play() 
  {
    super("Play");
  }
  public void apply(float val)
  {
    
  }
}
