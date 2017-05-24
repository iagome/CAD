class PolyRegular extends Objeto
{
  ArrayList<Vertice> vertices;
  public PolyRegular(Vertice centro, int lados, double raio) 
  {
    super(centro);
    vertices = new ArrayList<Vertice>();
    
    for(int i = 0; i < lados; i++) 
    {
      Vertice v = new Vertice();
      // calcula v.x e v.y
      // 2 pi pela numero de vertices = angulo, angulo * cos = x e angulo * sen = y, somar com raio e pivot
      //v.x=cos(2*PI)+raio+centro;
      vertices.add(v);
    }
  }
  
  public void draw() 
  {
    //Ligar os pontos com bresenham
  }
}