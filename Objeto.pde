class Objeto 
{
  Matriz m;
  Vertice pivot;
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
  
  public void reta(Vertice v1, Vertice v2)
  {
     bresenLine(map.pixelX(v1.x), map.pixelY(v1.y), map.pixelX(v2.x), map.pixelY(v2.y), color(255));
  }
}