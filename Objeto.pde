class Objeto 
{
  Matriz m;
  Vertice pivot;     
  color c;
  boolean completo = false; // Para usar na interface grafica.

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
    this.c = color(random(255),random(255),random(255));
  }
}