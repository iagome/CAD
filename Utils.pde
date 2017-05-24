class Utils
{
  public double distancia(Vertice a, Vertice b) 
  { 
    return Math.sqrt(Math.pow((b.x - a.x), 2) + Math.pow((b.y - a.y), 2));
  }
  
  public PVector sub(Vertice a, Vertice b) 
  {
    return new PVector((float)(b.x - a.x), (float)(b.y - a.y));
  }
  
  public Matriz mult(Matriz a, Matriz b) 
  {
    Matriz m = new Matriz(1, 0, 0, 0, 1, 0, 0, 0, 1);
    return m;
  }
}