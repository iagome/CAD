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
         flgCirculo = false;
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
        flgCirculo = false;
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
      flagReta = false;
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

import javax.swing.*;
float[] tranlacaoBox() {
  JTextField xField = new JTextField(5);
  JTextField yField = new JTextField(5);

  JPanel myPanel = new JPanel();
  myPanel.add(new JLabel("x:"));              // label do campo X
  myPanel.add(xField);                        // campo X
  myPanel.add(Box.createHorizontalStrut(15)); // espaçador
  myPanel.add(new JLabel("y:"));              // Label do campo Y
  myPanel.add(yField);                        // Campo Y

  int result = JOptionPane.showConfirmDialog(null, myPanel, 
    "Insira os valores de X e Y", JOptionPane.OK_CANCEL_OPTION);
  //float[] ret = new float[2];
  float[] ret = {.0, .0};
  if (result == JOptionPane.OK_OPTION) {
    ret[0] = Float.valueOf(xField.getText());
    ret[1] = Float.valueOf(yField.getText());
  } else return null;
  return ret;
}

double rotacaoBox() {
  JTextField xField = new JTextField(5);

  JPanel myPanel = new JPanel();
  myPanel.add(new JLabel("Angulo (graus):"));              // label do campo Texto
  myPanel.add(xField);                        // campo Texto
  myPanel.add(Box.createHorizontalStrut(15)); // espaçador

  int result = JOptionPane.showConfirmDialog(null, myPanel, 
    "Insira o valor do angulo em graus", JOptionPane.OK_CANCEL_OPTION);
  double ret = .0;
  if (result == JOptionPane.OK_OPTION)
    ret = Double.valueOf(xField.getText());
  else return 0;
  return ret;
}

float escalaBox() {
  JTextField xField = new JTextField(5);
  JPanel myPanel = new JPanel();
  myPanel.add(new JLabel("Escala:"));              // label do campo Texto
  myPanel.add(xField);                        // campo Texto
  myPanel.add(Box.createHorizontalStrut(15)); // espaçador

  int result = JOptionPane.showConfirmDialog(null, myPanel, 
    "Insira o valor da escala", JOptionPane.OK_CANCEL_OPTION);
  float ret = .0;
  if (result == JOptionPane.OK_OPTION)
    ret = Float.valueOf(xField.getText());
  else return -1;
  return ret;
}