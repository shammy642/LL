import gohai.glvideo.*;
import processing.video.*;

public abstract class VideoPlayer
{
  protected String FileName;
  
  protected int Height;
  
  protected int Width;
  
  protected Boolean Loop;
  
  protected VideoPlayer(String fileName, int height, int width, Boolean loop)
  {
    FileName = fileName;
    Loop = loop;
    Height = height;
    Width = width;
  }
  
  public abstract void load();
  
  public abstract void playNextFrame();
  
  public abstract void play();
  
  public abstract void setFirstFrame();
  
  public abstract void unload();
}

public class LaptopVideoPlayer extends VideoPlayer
{
  private Movie _movie;
  
  public LaptopVideoPlayer(String fileName, int height, int width, Boolean loop)
  {
    super(fileName, height, width, loop);
  }
  
  public void load()
  {
    _movie = new Movie(app, FileName);

    
    //if (Loop)
    //{
    //  _movie.loop();
    //}
    
    //_movie.play();
    _movie.jump(0.0);
  }
  
  public void playNextFrame()
  {
    if (_movie !=null && _movie.available())
    {
      _movie.read();
    }
      image(_movie, 0, 0, width, height); 
    
  }
  
  public void setFirstFrame()
  {
  
    _movie.jump(0.0);
  
  }
  
  public void play() {
    _movie.play();
  }
  
  public void unload()
  {
    if (_movie != null)
    {
      _movie.stop();
      _movie.dispose();
      
      //_movie = null;
    }
  } //<>//
}

public class RaspberryPiVideoPlayer extends VideoPlayer
{ 
  private GLMovie _video;
  
  public RaspberryPiVideoPlayer(String fileName, int height, int width, Boolean loop)
  {
    super(fileName, height, width, loop);
  }
  
  public void load()
  {
    _video = new GLMovie(app, FileName);
    
    if (Loop)
    {
      _video.loop();
    }
    
      _video.play();
  }
  
    public void setFirstFrame()
  {
  
    _video.jump(0.0);
  
  }
  
  public void playNextFrame()
  {
    if (_video.available())
    {
      _video.read();
    }
    
    image(_video, 0, 0, width, height);
  }
  
   public void play() {
  
  _video.play();
  }
  
  public void unload()
  {
    if (_video != null)
    {
      _video.dispose();
      _video = null;
    }
  }
  
  
}
