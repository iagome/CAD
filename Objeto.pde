class Objeto 
{
  Matriz m;
  Vertice pivot;
  double raio;
  ArrayList<Vertice> vertices = new ArrayList<Vertice>();
  color c;
  boolean completo = false; // Para usar na interface grafica.
  
  public Objeto(){}

  public Objeto(Vertice pivot, color c) 
  {
    m = new Matriz(3);
    this.pivot = pivot;
    this.c = c;
  }
  
  public Objeto(Vertice pivot) 
  {
    m = new Matriz(3);
    this.pivot = pivot;
    this.c = color(random(255), random(255), random(255));
  }
  
  public Objeto(double raio, Vertice pivot)
  {
    m = new Matriz(3);
    this.raio = raio;
    this.pivot = pivot;
  }
  
  public void reta(Vertice v1, Vertice v2)
  {
     bresenLine(map.pixelX(v1.x), map.pixelY(v1.y), map.pixelX(v2.x), map.pixelY(v2.y), color(255));
  }
  
  void bresenCircle(int xC, int yC, int r, color c)
  {
    int x = 0, y = r, u = 1, v = 2 * r - 1, e = 0;
    
    while (x < y)
    {
      set(xC + x, yC + y, c);
      set(xC + y, yC - x, c);
      set(xC - x, yC - y, c);
      set(xC - y, yC + x, c);
      x++;
      e+=u;
      u+=2;
      
      if (v < 2 * e)
      {
        y--;
        e-=v;
        v-=2;
      }
      
      if (x > y) break;
      
      set(xC + y, yC + x, c);
      set(xC + x, yC - y, c);
      set(xC - y, yC - x, c);
      set(xC - x, yC + y, c);
    }
  }
}