class Objeto 
{
  Matriz m;
  Vertice pivot;
  double raio = 0;
  ArrayList<Vertice> vertices = new ArrayList<Vertice>();
  color c;
  boolean completo = false; // Para usar na interface grafica.

  public Objeto() {
  }

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
    bresenLine(v1.x, v1.y, v2.x, v2.y, color(255));
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

  void printObject()
  {
    for (int i = 0; i < objetos.size(); i++)
    {
      if (objetos.get(i).raio != 0)
      {
        bresenCircle(objetos.get(i).vertices.get(0).x, objetos.get(i).vertices.get(0).y, (int)objetos.get(i).raio, color(255));
        if (rs != -1 && flgCirculo)bresenCircle(objetos.get(rs).vertices.get(0).x, objetos.get(rs).vertices.get(0).y, (int)objetos.get(rs).raio, color(255, 0, 127));
      } else
      {
        for (int j = 1; j < objetos.get(i).vertices.size(); j++ )
        {
          if (j + 1 == objetos.get(i).vertices.size())
          {
            reta(objetos.get(i).vertices.get(j), objetos.get(i).vertices.get(0));
            reta(objetos.get(i).vertices.get(j - 1), objetos.get(i).vertices.get(j));
          } 
          else
            reta(objetos.get(i).vertices.get(j - 1), objetos.get(i).vertices.get(j));
          
          if (rs != -1 && flgPoligono)
          {
            if (j + 1 == objetos.get(rs).vertices.size())
            {
              bresenLine(objetos.get(rs).vertices.get(j).x, objetos.get(rs).vertices.get(j).y, objetos.get(rs).vertices.get(0).x, objetos.get(rs).vertices.get(0).y, color(255, 0, 127));
              bresenLine(objetos.get(rs).vertices.get(j - 1).x, objetos.get(rs).vertices.get(j - 1).y, objetos.get(rs).vertices.get(j).x, objetos.get(rs).vertices.get(j).y, color(255, 0, 127));
            } 
             else
            bresenLine(objetos.get(rs).vertices.get(j - 1).x, objetos.get(rs).vertices.get(j - 1).y, objetos.get(rs).vertices.get(j).x, objetos.get(rs).vertices.get(j).y, color(255, 0, 127));     
          }
          if (rs != -1 && flagReta) bresenLine(objetos.get(rs).vertices.get(0).x, objetos.get(rs).vertices.get(0).y, objetos.get(rs).vertices.get(1).x, objetos.get(rs).vertices.get(1).y, color(255, 0, 127));
        }
      }
    }
  }
}