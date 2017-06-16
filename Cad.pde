final int idle = 1;
final int desenhaReta = 2;
final int desenhaQuad = 3;
final int desenhaRet = 4;
final int desenhaPolIr = 5;
final int selecionadoTrans = 6;
final int selecionadoCor = 7;
final int desenhaCirculo = 8;
final int desselecionar = 9;
int estado = idle;
Objeto obj = new Objeto();
Objeto objTemp;
Vertice temp2;
Vertice temp;
ArrayList<Vertice> vertices = new ArrayList<Vertice>();
ArrayList<Objeto> objetos = new ArrayList<Objeto>();
Mapeamento map = new Mapeamento();
PImage teste;
boolean flg = false;
boolean flagReta = false;

void setup() 
{
  teste = loadImage("teste.jpg");
  background(53);
  size(1280, 720);
  Vertice banana;
}

void draw() 
{
  image(teste, 0, 0);
  background(53);
  if (flg == true)
  {
    for (int i = 0; i < objetos.size(); i++)
    {
      if (objetos.size() == 0) break;

     /* if (objetos.get(i).raio != 0)
      {
        obj.bresenCircle(map.pixelX(objetos.get(i).vertices.get(0).x), map.pixelX(objetos.get(i).vertices.get(0).y), mouseX - map.pixelX(objetos.get(i).vertices.get(0).x), color(255));
      }*/

      for (int j = 1; j < objetos.get(i).vertices.size(); j++)
      {
        if (objetos.get(i).raio != 0)
        {
          obj.bresenCircle(map.pixelX(objetos.get(i).vertices.get(j).x), map.pixelX(objetos.get(i).vertices.get(j).y), abs(mouseX - map.pixelX(objetos.get(i).vertices.get(j).x)), color(255)); //<>//
        }
        if ((j) == objetos.get(i).vertices.size())
          obj.reta(objetos.get(i).vertices.get(j), objetos.get(i).vertices.get(0));
        else
          obj.reta(objetos.get(i).vertices.get(j - 1), objetos.get(i).vertices.get(j));
      }
    }
  }

  switch(estado)
  {
  case idle:
    break;

  case desenhaReta:
    temp2 = new Vertice(map.realX(mouseX), map.realY(mouseY));

    if (!vertices.isEmpty()) obj.reta(vertices.get(0), temp2);

    break;

  case desenhaQuad:
    /*if (mousePressed)
     {
     temp = new Vertice(map.realX(pmouseX), map.realY(pmouseY));
     }
     break;*/

  case desenhaCirculo:

    break;
  }

  textAlign(RIGHT, TOP);
  text(mouseX + "," + mouseY, 600, 50); 
  image(teste, 0, 0);
  /* if (flg == true)
   {
   for (int i = 0; i < objetos.size(); i++)
   {
   
   
   
   for (int j = 1; j < objetos.get(i).vertices.size(); j++)
   {
   if ((j) == objetos.get(i).vertices.size())
   obj.reta(objetos.get(i).vertices.get(j), objetos.get(i).vertices.get(0));
   else
   obj.reta(objetos.get(i).vertices.get(j - 1), objetos.get(i).vertices.get(j));
   }
   }
   }*/

  image(teste, 0, 0);
}

void mouseClicked()
{
  if ((mouseX >= 11 && mouseX <= 33) && (mouseY >= 11 && mouseY <= 47))
  {
    estado = desenhaReta;
  } else if ((mouseX >= 11 && mouseX <= 33) && (mouseY >= 70 && mouseY <= 90))
  {
    estado = desenhaCirculo;
  } else if ((mouseX >= 11 && mouseX <= 33) && (mouseY >= 91 && mouseY <= 130))
  {
    //estado = 3;
  } else if ((mouseX >= 11 && mouseX <= 33) && (mouseY >= 675 && mouseY <= 720))
  {
    //estado = 2;
  }
}

void mousePressed()
{
  switch (estado)
  {
  case desenhaReta:
    temp = new Vertice(map.realX(mouseX), map.realY(mouseY));
    vertices.add(temp);
    temp = null;
    flagReta = true;

    break;

  case desenhaCirculo:
    temp = new Vertice(map.realX(mouseX), map.realY(mouseY));
    vertices.add(temp);
    temp = null;

    break;
  }
}

void mouseReleased()
{
  switch (estado)
  {
  case desenhaReta:
    flg = true;
    objTemp = new Objeto();
    temp = new Vertice(map.realX(mouseX), map.realY(mouseY));
    vertices.add(temp);
    temp = null;
    obj.reta(vertices.get(0), vertices.get(1));
    objTemp.vertices = vertices;
    objetos.add(objTemp);
    objTemp = null;
    vertices = new ArrayList<Vertice>();
    break;
 //<>//
  case desenhaCirculo:
    flg = true;
    objTemp = new Objeto(mouseX - map.pixelX(vertices.get(0).x), vertices.get(0));
    obj.bresenCircle(map.pixelX(vertices.get(0).x), map.pixelY(vertices.get(0).y), mouseX - map.pixelX(vertices.get(0).x), 255);
    objTemp.vertices = vertices;
    objetos.add(objTemp);
    objTemp = null;
    vertices = new ArrayList<Vertice>();
  }
}