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
final int escalaObj = 11;
final int transladaObj = 12;
final int rotacionaObj = 13;
final int deletaObj = 14;
int coordyImgclick = 0;
int coordyImghover = 0;
int estado = idle;
String texto = "Idle";
int rs = -1;
int rsC = -1;
int rsL = -1;
Objeto obj = new Objeto();
Objeto objTemp;
Vertice temp2;
Vertice temp;
boolean flagImg = false;
ArrayList<Vertice> vertices = new ArrayList<Vertice>();
ArrayList<Objeto> objetos = new ArrayList<Objeto>();
Mapeamento map = new Mapeamento();
PImage menuImg, seta, reta, quadrado, poligonoR, poligonoIR, pinta, circulo, rotaciona, escala, translada, deleta;
PImage imgClicada, imgHover, hover;
PImage clicado;
boolean flagHover = false;
boolean flg = false;
boolean flagReta = false;
boolean flgPoligono = false;
boolean flgCirculo = false;

void setup() 
{
  menuImg = loadImage("icons/interface.jpg");
  seta = loadImage("icons/seta.jpg");
  reta = loadImage("icons/reta.jpg");
  quadrado = loadImage("icons/quadrado.jpg");
  poligonoR = loadImage("icons/poligonoR.jpg");
  poligonoIR = loadImage("icons/poligonoIR.jpg");
  pinta = loadImage("icons/pinta.jpg");
  circulo = loadImage("icons/circulo.jpg");
  rotaciona = loadImage("icons/rotaciona.jpg");
  escala = loadImage("icons/escala.jpg");
  translada = loadImage("icons/translada.jpg");
  deleta = loadImage("icons/deleta.jpg");
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
  
  if (flagHover)
  {
    imgHover = hover;
    image(imgHover, 0, coordyImghover);
    
    if (mouseX > 45 || (mouseY > 324 && mouseY < 371) || (mouseY > 496 && mouseY < 670)) flagHover = false;
  }
  
  if (flagImg) 
  {
    imgClicada = clicado;
    image(imgClicada, 0, coordyImgclick);
  }
  text(texto, 1280, 705);
}

void mouseClicked()
{
  if ((mouseX >= 0 && mouseX <= 44) && (mouseY >= 0 && mouseY <= 55))
  {
    estado = selecionar;
    texto = "Selecionar";
    clicado = seta;
    coordyImgclick = 0;
    flagImg = true;
  } 
  else if ((mouseX >= 0 && mouseX <= 44) && (mouseY >= 58 && mouseY <= 95))
  {
    estado = desenhaReta;
    texto = "Reta";
    clicado = reta;
    coordyImgclick = 58;
    flagImg = true;
  } 
  else if ((mouseX >= 0 && mouseX <= 44) && (mouseY >= 100 && mouseY <= 141))
  {
    estado = desenhaQuad;
    texto = "Quadrado";
    clicado = quadrado;
    coordyImgclick = 100;
    flagImg = true;
  }
  else if ((mouseX >= 0 && mouseX <= 44) && (mouseY >= 144 && mouseY <= 185))
  {
    estado = desenhaPolR;
    texto = "Polígono Regular";
    clicado = poligonoR;
    coordyImgclick = 144;
    flagImg = true;
  }
  else if ((mouseX >= 0 && mouseX <= 44) && (mouseY >= 187 && mouseY <= 230))
  {
    estado = desenhaPolIr;
    texto = "Polígono Irregular";
    clicado = poligonoIR;
    coordyImgclick = 187;
    flagImg = true;
  }
  else if ((mouseX >= 0 && mouseX <= 44) && (mouseY >= 232 && mouseY <= 272))
  {
    estado = pintar;
    texto = "Pintar";
    clicado = pinta;
    coordyImgclick = 232;
    flagImg = true;
  }
  else if ((mouseX >= 0 && mouseX <= 44) && (mouseY >= 278 && mouseY <= 322))
  {
    estado = desenhaCirculo;
    texto = "Círculo";
    clicado = circulo;
    coordyImgclick = 278;
    flagImg = true;
  }
  else if ((mouseX >= 0 && mouseX <= 44) && (mouseY >= 373 && mouseY <= 413))
  {
    clicado = rotaciona;
    coordyImgclick = 373;
    flagImg = true;
    texto = "Rotacionar Objeto";
    if (estado == selecionar && rs != -1) obj.rotacao();
  }
  else if ((mouseX >= 0 && mouseX <= 44) && (mouseY >= 417 && mouseY <= 455))
  {
    clicado = escala;
    coordyImgclick = 417;
    flagImg = true;
    texto = "Mudar Escala";
    if (estado == selecionar && rs != -1) obj.escala();
  }
  else if ((mouseX >= 0 && mouseX <= 44) && (mouseY >= 456 && mouseY <= 495))
  {
    clicado = translada;
    coordyImgclick = 455;
    flagImg = true;
    texto = "Mover Objeto";
    if (estado == selecionar && rs != -1) obj.translacao();
  }
  else if ((mouseX >= 0 && mouseX <= 44) && (mouseY >= 672 && mouseY <= 720))
  {
    clicado = deleta;
    coordyImgclick = 671;
    flagImg = true;
    if (estado == selecionar && rs != -1) obj.removeObject();
  }
  
  if (estado == selecionar && !(mouseX <= 45)) rs = buscarObjeto(mouseX, mouseY);
  else rs = -1;
  
  if (mouseX > 45)
  {
    switch (estado)
    {
      case desenhaReta:
        if (vertices.size() == 0)
        {
          temp = new Vertice(mouseX, mouseY);
          vertices.add(temp);
          temp = null;
        }
        else
        {
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
        }
        
        break;
        
      case desenhaQuad:
        if (vertices.size() == 0)
        {
          temp = new Vertice(mouseX, mouseY);
          vertices.add(temp);
          temp = null;
        }
        else
        {
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
        
        break;
    }
  }
}

void mouseMoved()
{
  if ((mouseX >= 0 && mouseX <= 44) && (mouseY >= 0 && mouseY <= 55))
  {
    hover = seta;
    coordyImghover = 0;
    flagHover = true;
  }
  else if ((mouseX >= 0 && mouseX <= 44) && (mouseY >= 58 && mouseY <= 95))
  {
    hover = reta;
    coordyImghover = 58;
    flagHover = true;
  } 
  else if ((mouseX >= 0 && mouseX <= 44) && (mouseY >= 100 && mouseY <= 141))
  {
    hover = quadrado;
    coordyImghover = 100;
    flagHover = true;
  }
  else if ((mouseX >= 0 && mouseX <= 44) && (mouseY >= 144 && mouseY <= 185))
  {
    hover = poligonoR;
    coordyImghover = 144;
    flagHover = true;
  }
  else if ((mouseX >= 0 && mouseX <= 44) && (mouseY >= 187 && mouseY <= 230))
  {
    hover = poligonoIR;
    coordyImghover = 187;
    flagHover = true;
  }
  else if ((mouseX >= 0 && mouseX <= 44) && (mouseY >= 232 && mouseY <= 272))
  {
    hover = pinta;
    coordyImghover = 232;
    flagHover = true;
  }
  else if ((mouseX >= 0 && mouseX <= 44) && (mouseY >= 278 && mouseY <= 322))
  {
    hover = circulo;
    coordyImghover = 278;
    flagHover = true;
  }
  else if ((mouseX >= 0 && mouseX <= 44) && (mouseY >= 373 && mouseY <= 413))
  {
    hover = rotaciona;
    coordyImghover = 373;
    flagHover = true;
  }
  else if ((mouseX >= 0 && mouseX <= 44) && (mouseY >= 417 && mouseY <= 455))
  {
    hover = escala;
    coordyImghover = 417;
    flagHover = true;
  }
  else if ((mouseX >= 0 && mouseX <= 44) && (mouseY >= 456 && mouseY <= 495))
  {
    hover = translada;
    coordyImghover = 455;
    flagHover = true;
  }
  else if ((mouseX >= 0 && mouseX <= 44) && (mouseY >= 672 && mouseY <= 720))
  {
    hover = deleta;
    coordyImghover = 671;
    flagHover = true;
  }
}

void mousePressed()
{
  switch (estado)
  {
    case desenhaCirculo:
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
    case desenhaCirculo:
      flg = true;
      if (mouseX - vertices.get(0).x == 0) 
      {
        vertices = new ArrayList<Vertice>();
        break;
      }
      objTemp = new Objeto(abs(mouseX - vertices.get(0).x), vertices.get(0));
      objTemp.vertices = vertices;
      objetos.add(objTemp);
      objTemp = null;
      vertices = new ArrayList<Vertice>();
      
      break;
  }
}