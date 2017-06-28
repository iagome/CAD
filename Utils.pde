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

int buscarObjeto(double Px, double Py)
{
  int valorObjeto;
  
  for (int i = 0; i < objetos.size(); i++)
  {
    int contador = 0;
    valorObjeto = 0;
    
    for (int j = 0; j< objetos.get(i).vertices.size(); j++)
    {
      double algo;
      double algo2;
      double algo3;
      double disP1, disP2;
      
     if (objetos.get(i).raio == 0)
     {
       flagReta = false;
       flgPoligono = false;
       
       if (objetos.get(i).vertices.size() == 2)
       {
         Matriz algoM = new Matriz(Px, Py, 1, objetos.get(i).vertices.get(0).x, objetos.get(i).vertices.get(0).y, 1, objetos.get(i).vertices.get(1).x, objetos.get(i).vertices.get(1).y, 1);
         algo3 = algoM.determinante(algoM.m);
         //disP1 = Math.sqrt(Math.pow((Px - objetos.get(i).vertices.get(0).x), 2) + Math.pow((Py - objetos.get(i).vertices.get(0).y), 2));
         //disP2 = Math.sqrt(Math.pow((Px - objetos.get(i).vertices.get(1).x), 2) + Math.pow((Py - objetos.get(i).vertices.get(1).y), 2));
         
         if (abs((float)algo3) < 500 && abs((float)algo3) > 0)
         {
           flagReta = true;
           return i;
         }
         else flagReta = false;
       }
       else flagReta = false;
       
       if (j + 1 == objetos.get(i).vertices.size())
      {
        algo = ((objetos.get(i).vertices.get(0).x - objetos.get(i).vertices.get(j).x) * (objetos.get(i).vertices.get(j).y - objetos.get(i).vertices.get(j - 1).y)) - ((objetos.get(i).vertices.get(j).x - objetos.get(i).vertices.get(j - 1).x) * (objetos.get(i).vertices.get(0).y - objetos.get(i).vertices.get(j).y));
        algo2 = ((objetos.get(i).vertices.get(0).x - objetos.get(i).vertices.get(j).x) * (objetos.get(i).vertices.get(j).y - Py)) - ((objetos.get(i).vertices.get(j).x - Px) * (objetos.get(i).vertices.get(0).y - objetos.get(i).vertices.get(j).y));
      }      
      else if (j == 0)
      {
        algo = ((objetos.get(i).vertices.get(j + 1).x - objetos.get(i).vertices.get(j).x) * (objetos.get(i).vertices.get(j).y - objetos.get(i).vertices.get(objetos.get(i).vertices.size() - 1).y)) - ((objetos.get(i).vertices.get(j).x - objetos.get(i).vertices.get(objetos.get(i).vertices.size() - 1).x) * (objetos.get(i).vertices.get(j + 1).y - objetos.get(i).vertices.get(j).y));
        algo2 = ((objetos.get(i).vertices.get(j + 1).x - objetos.get(i).vertices.get(j).x) * (objetos.get(i).vertices.get(j).y - Py)) - ((objetos.get(i).vertices.get(j).x - Px) * (objetos.get(i).vertices.get(j + 1).y - objetos.get(i).vertices.get(j).y));
      }      
      else
      {
        algo = ((objetos.get(i).vertices.get(j + 1).x - objetos.get(i).vertices.get(j).x) * (objetos.get(i).vertices.get(j).y - objetos.get(i).vertices.get(j - 1).y)) - ((objetos.get(i).vertices.get(j).x - objetos.get(i).vertices.get(j - 1).x) * (objetos.get(i).vertices.get(j + 1).y - objetos.get(i).vertices.get(j).y));
        algo2 = ((objetos.get(i).vertices.get(j + 1).x - objetos.get(i).vertices.get(j).x) * (objetos.get(i).vertices.get(j).y - Py)) - ((objetos.get(i).vertices.get(j).x - Px) * (objetos.get(i).vertices.get(j + 1).y - objetos.get(i).vertices.get(j).y));
      }
      
      if (algo > 0 && algo2 > 0 || algo < 0 && algo2 < 0) contador++;
      else j = objetos.get(i).vertices.size();
      
      if(contador == objetos.get(i).vertices.size())
      {
      flgPoligono = true;
      return i;
      }
      else flgPoligono = false;
    }
    else
    {
      flgPoligono = false;
      double algoR;
      algoR = Math.sqrt(Math.pow((Px - objetos.get(i).vertices.get(0).x), 2) + Math.pow((Py - objetos.get(i).vertices.get(0).y), 2));
      if(algoR <= objetos.get(i).raio)
      {
        flgCirculo = true;
        return i;
      }
      else flgCirculo = false; //<>//
    }
   }
  }
  return -1;
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