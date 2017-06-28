class Matriz 
{
  double[][] m;

  public Matriz(int d) 
  {
    m = new double[d][d];

    for (int i = 0; i < d; i++) m[i][i] = 1;
  }

  public Matriz(int a, int b)
  {
    m = new double[a][b];
  }

  public Matriz(double a, double b, double c, 
    double d, double e, double f, 
    double g, double h, double i)
  {
    m = new double[][]{{a, b, c}, {d, e, f}, {g, h, i}};
  }

  public double determinante(double[][] matriz)
  {
    double det;
    double soma = 0;

    if (matriz.length == 2)
    {
      det = (matriz[0][0] * matriz[1][1]) - (matriz[1][0] * matriz[0][1]);
      return det;
    }
    
    for (int i = 0; i < matriz.length; i++)
    {
      double[][] nm = new double[matriz.length - 1][matriz.length - 1];
      
      for (int j = 0; j < matriz.length; j++) 
      {
        if (j != i)
        {
          for (int k = 1; k < matriz.length; k++)
          {
            int indice =- 1;
            
            if (j < i) indice = j;
            else if (j > i) indice = j - 1;
            
            nm[indice][k - 1] = matriz[j][k];
          }
        }
      }
      
      if (i % 2 == 0) soma += matriz[i][0] * determinante(nm);
      else soma -= matriz[i][0] * determinante(nm);
    }
    
    return soma;
  }

  public Matriz multiplicaMatriz(int[][] a, int[][] b)
  {
    if (a[0].length != b.length) throw new RuntimeException("Dimensões inconsistentes. Impossível multiplicar as matrizes");

    Matriz result = new Matriz(a.length, b[0].length);

    for (int i = 0; i < a.length; i++)
      for (int j = 0; j < b[0].length; j++) 
        for (int k = 0; k < a[0].length; k++) 
          result.m[i][j] += (a[i][k] * b[k][j]);

    return result ;
  }
}