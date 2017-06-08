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
  
void bresenLine(int x0, int y0, int x1, int y1, color c)
{
  double dx = abs(x1 - x0), sx = x0 < x1 ? 1. : -1.;
  double dy = -abs(y1 - y0), sy = y0 < y1 ? 1. : -1.;
  double err = dx + dy, e2;
    
  while (true) 
  {
    set(x0, y0, c);
    if (x0 == x1 && y0 == y1) 
    {
      break;
    }
    e2 = 2. * err;
    if (e2 > dy) 
    {
      err += dy;
      x0 += sx;
    }
    if (e2 < dx)
    {
      err += dx;
      y0 += sy;
    }
  }
}