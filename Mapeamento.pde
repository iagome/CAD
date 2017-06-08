public class Mapeamento 
{
  public int width = 1280;
  public int height = 720;

  private float xmin = -3;
  private float ymin = -2;
  private float xmax = 3;
  private float ymax = 2;

  private boolean draw = false;
  private boolean select = false;

  public float getXmin()
  {
    return this.xmin;
  }

  public float getXmax()
  {
    return this.xmax;
  }

  public float getYmin()
  {
    return this.ymin;
  }  

  public float getYmax() 
  {
    return ymax;
  }

  public void setYmax(float ymax) 
  {
    this.ymax = ymax;
  }

  public boolean isDraw() 
  {
    return draw;
  }

  public boolean isSelect() 
  {
    return select;
  }

  public void setXmin(float xmin) 
  {
    this.xmin = xmin;
  }

  public void setYmin(float ymin) 
  {
    this.ymin = ymin;
  }

  public void setXmax(float xmax) 
  {
    this.xmax = xmax;
  }

  public void setDraw() 
  {
    this.draw = true;
    this.select = false;
  }

  public void setSelect() 
  {
    this.draw = false;
    this.select = true;
  }

  public int pixelX(double x) //entra x em real e sai em pixel 
  {
    return (int)(((this.width - 1) * (x - this.xmin)) / (this.xmax - this.xmin));
  }

  public int pixelY(double y) //entra y em real e sai em pixel
  {
    return (int)(((-this.height + 1) * (y - this.ymin)) / (this.ymax - this.ymin) - 1 + this.height) + 28;
  }

  public double realX(int x) //entra x em pixel e sai em real
  {
    return xmin + (x * (this.xmax - this.xmin) / (this.width - 1));
  }

  public double realY(int y) //entra y em pixel e sai em real
  {
    return (ymin + (((float)y - this.height - 27) / ((float)-this.height + 1) * ((float)(ymax - ymin))));
  }
}