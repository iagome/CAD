class Matriz 
{
  double[][] m;
  
  public Matriz(int d) 
  {
    m = new double[d][d];
    
    for (int i = 0; i < d; i++) m[i][i] = 1;
  }
  public Matriz(double a, double b, double c,
                double d, double e, double f,
                double g, double h, double i)
  {
    m = new double[][]{{a,b,c},{d,e,f},{g,h,i}};
  }
}