final int idle = 1;
final int desenhaReta = 2;
final int desenhaQuad = 3;
final int desenhaPolR = 4;
final int desenhaPolIr = 5;
final int selecionadoTrans = 6;
final int selecionadoCor = 7;
final int desenhaCirculo = 8;
final int selecionar = 9;
final int pintar = 10;
final int escala = 11;
final int translada = 12;
final int rotaciona = 13;
final int deleta = 14;
int estado = idle;
int rs = -1;
int rsC = -1;
int rsL = -1;
Objeto obj = new Objeto();
Objeto objTemp;
Vertice temp2;
Vertice temp;
ArrayList<Vertice> vertices = new ArrayList<Vertice>();
ArrayList<Objeto> objetos = new ArrayList<Objeto>();
Mapeamento map = new Mapeamento();
PImage menuImg, setaImg, retaImg, quadradoImg, poligonoRImg, poligonoIRImg, pintaImg, circuloImg, rotacionaImg, escalaImg, transladaImg, deletaImg;
boolean flg = false;
boolean flagReta = false;
boolean flgPoligono = false;
boolean flgCirculo = false;

void setup() 
{
  menuImg = loadImage("icons/interface.jpg");
  setaImg = loadImage("icons/seta.jpg");
  retaImg = loadImage("icons/reta.jpg");
  quadradoImg = loadImage("icons/quadrado.jpg");
  poligonoRImg = loadImage("icons/poligonoR.jpg");
  poligonoIRImg = loadImage("icons/poligonoIR.jpg");
  pintaImg = loadImage("icons/pinta.jpg");
  circuloImg = loadImage("icons/circulo.jpg");
  rotacionaImg = loadImage("icons/rotaciona.jpg");
  escalaImg = loadImage("icons/escala.jpg");
  transladaImg = loadImage("icons/translada.jpg");
  deletaImg = loadImage("icons/deleta.jpg");
  background(53);
  size(1280, 720);
}

void draw() 
{
  image(menuImg, 0, 0);
  background(53);
  
  if (flg == true)
  {
    obj.printObject();
  }

  switch(estado)
  {
    case idle:
      break;
  
    case desenhaReta:
       temp2 = new Vertice(mouseX, mouseY);
  
      if (!vertices.isEmpty()) obj.reta(vertices.get(0), temp2);
  
      break;
  
    case desenhaQuad:
       if(!vertices.isEmpty())
       {
         bresenLine(vertices.get(0).x, vertices.get(0).y, mouseX, vertices.get(0).y, color(255));
         bresenLine(vertices.get(0).x, vertices.get(0).y, vertices.get(0).x, mouseY, color(255));
         bresenLine(vertices.get(0).x, mouseY, mouseX, mouseY, color(255));
         bresenLine(mouseX, vertices.get(0).y, mouseX, mouseY, color(255));
       }
       break;
  
    case desenhaCirculo:
  
      if (!vertices.isEmpty()) 
      {
        obj.bresenCircle(vertices.get(0).x, vertices.get(0).y, abs(mouseX - vertices.get(0).x), color(255));
      }
      
      break;
      
    case selecionar:
      break;
  }

  textAlign(RIGHT, TOP);
  text(mouseX + "," + mouseY, 600, 50); 
  image(menuImg, 0, 0);
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

  image(menuImg, 0, 0);
}

void mouseClicked()
{
  if ((mouseX >= 11 && mouseX <= 34) && (mouseY >= 11 && mouseY <= 47))
  {
    estado = selecionar;
  } 
  else if ((mouseX >= 11 && mouseX <= 34) && (mouseY >= 65 && mouseY <= 88))
  {
    estado = desenhaReta;
  } 
  else if ((mouseX >= 11 && mouseX <= 34) && (mouseY >= 108 && mouseY <= 131))
  {
    estado = desenhaQuad;
  }
  else if ((mouseX >= 11 && mouseX <= 34) && (mouseY >= 153 && mouseY <= 175))
  {
    estado = desenhaPolR;
  }
  else if ((mouseX >= 11 && mouseX <= 34) && (mouseY >= 195 && mouseY <= 218))
  {
    estado = desenhaPolIr;
  }
  else if ((mouseX >= 11 && mouseX <= 34) && (mouseY >= 238 && mouseY <= 264))
  {
    estado = pintar;
  }
  else if ((mouseX >= 11 && mouseX <= 34) && (mouseY >= 285 && mouseY <= 309))
  {
    estado = desenhaCirculo;
  }
  else if ((mouseX >= 11 && mouseX <= 34) && (mouseY >= 381 && mouseY <= 405))
  {
    estado = rotaciona;
  }
  else if ((mouseX >= 11 && mouseX <= 34) && (mouseY >= 424 && mouseY <= 446))
  {
    estado = escala;
  }
  else if ((mouseX >= 11 && mouseX <= 34) && (mouseY >= 464 && mouseY <= 484))
  {
    estado = translada;
  }
  else if ((mouseX >= 11 && mouseX <= 34) && (mouseY >= 675 && mouseY <= 720))
  {
    estado = deleta;
  }
  
  if (estado == selecionar && !(mouseX <= 45)) rs = buscarObjeto(mouseX, mouseY);
  else rs = -1;
}

void mouseMoved()
{
  if ((mouseX >= 11 && mouseX <= 34) && (mouseY >= 11 && mouseY <= 47))
  {
    image(setaImg, 0, 0);
  }
  else if ((mouseX >= 11 && mouseX <= 34) && (mouseY >= 65 && mouseY <= 88))
  {
    image(retaImg, 0, 58);
  } 
  else if ((mouseX >= 11 && mouseX <= 34) && (mouseY >= 108 && mouseY <= 131))
  {
    image(quadradoImg, 0, 100);
  }
  else if ((mouseX >= 11 && mouseX <= 34) && (mouseY >= 153 && mouseY <= 175))
  {
    image(poligonoRImg, 0, 144);
  }
  else if ((mouseX >= 11 && mouseX <= 34) && (mouseY >= 195 && mouseY <= 218))
  {
    image(poligonoIRImg, 0, 187);
  }
  else if ((mouseX >= 11 && mouseX <= 34) && (mouseY >= 238 && mouseY <= 264))
  {
    image(pintaImg, 0, 232);
  }
  else if ((mouseX >= 11 && mouseX <= 34) && (mouseY >= 285 && mouseY <= 309))
  {
    image(circuloImg, 0, 278);
  }
  else if ((mouseX >= 11 && mouseX <= 34) && (mouseY >= 381 && mouseY <= 405))
  {
    image(rotacionaImg, 0, 373);
  }
  else if ((mouseX >= 11 && mouseX <= 34) && (mouseY >= 424 && mouseY <= 446))
  {
    image(escalaImg, 0, 417);
  }
  else if ((mouseX >= 11 && mouseX <= 34) && (mouseY >= 464 && mouseY <= 484))
  {
    image(transladaImg, 0, 455);
  }
  else if ((mouseX >= 11 && mouseX <= 34) && (mouseY >= 675 && mouseY <= 720))
  {
    image(deletaImg, 0, 671);
  }
}

void mousePressed()
{
  switch (estado)
  {
    case desenhaReta:
      temp = new Vertice(mouseX, mouseY);
      vertices.add(temp);
      temp = null;
  
      break;
  
    case desenhaCirculo:
      temp = new Vertice(mouseX, mouseY);
      vertices.add(temp);
      temp = null;
  
      break;
      
    case desenhaQuad:
      temp = new Vertice(mouseX, mouseY);
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
      temp = new Vertice(mouseX, mouseY);
      vertices.add(temp);
      temp = null;
      //obj.reta(vertices.get(0), vertices.get(1));
      objTemp.vertices = vertices;
      objetos.add(objTemp);
      objTemp = null;
      temp2 = null;
      vertices = new ArrayList<Vertice>();
      break;

    case desenhaCirculo:
      flg = true;
      if (mouseX - vertices.get(0).x == 0) 
      {
        vertices = new ArrayList<Vertice>();
        break;
      }
      objTemp = new Objeto(abs(mouseX - vertices.get(0).x), vertices.get(0));
      //obj.bresenCircle(map.pixelX(vertices.get(0).x), map.pixelY(vertices.get(0).y), abs(mouseX - map.pixelX(vertices.get(0).x)), 255);
      objTemp.vertices = vertices;
      objetos.add(objTemp);
      objTemp = null;
      vertices = new ArrayList<Vertice>();
      
      break;
      
    case desenhaQuad:
      flg = true;
      objTemp = new Objeto();
      
      for(int i = 0; i < 3; i++)
      {
        if(i==0) temp = new Vertice(mouseX, vertices.get(0).y);
        if(i==1) temp = new Vertice(mouseX, mouseY);
        if(i==2) temp = new Vertice(vertices.get(0).x, mouseY);
        vertices.add(temp);
        temp = null;
      }
      
      objTemp.vertices = vertices;
      objetos.add(objTemp);
      objTemp = null;
      vertices = new ArrayList<Vertice>();
 
      break;
  }
}