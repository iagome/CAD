class Poly extends Objeto
{
  ArrayList<Vertice> vertices;

  public Poly(Vertice centro) 
  {
  	super(centro);
  	vertices = new ArrayList<Vertice>();
  }

  public void add(Vertice v) 
  {
	  if (!completo) 
    {
	  	vertices.add(v);	
	  }
  }
  
  public void draw() 
  {
    //Ligar os pontos com bresenham
  }
}