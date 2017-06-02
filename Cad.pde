int idle = 0;
int desenhaReta = 1;
int desenhaQuad = 2;
int desenhaRet = 3;
int desenhaPolIr = 4;
int selecionadoTrans = 5;
int selecionadoCor = 6;
int desselecionar = 9;
PImage teste;
int estado;

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
  //rect(0, 45, 45, 45);
  
  switch(estado)
  {
    case 1:
      fill(93);
      rect(400, 400, 50, 50);
      break;
    case 2:
      background(53);
      break;
    case 3:
      text("o teclado esta em americano", 400, 400);
    case 4:
      if (mousePressed) line(pmouseX, pmouseY, mouseX, mouseY);
      break;
  }
  
  image(teste, 0, 0);
}

void mouseClicked()
{
  if ((mouseX >= 0 && mouseX <= 45) && (mouseY >= 0 && mouseY <= 45))
  {
    estado = 4;
  }
  else if((mouseX >= 0 && mouseX <= 45) && (mouseY >= 46 && mouseY <= 90))
  {
    estado = 1;
  }
  else if ((mouseX >= 0 && mouseX <= 45) && (mouseY >= 91 && mouseY <= 130))
  {
    estado = 3;
  }
  else if((mouseX >= 0 && mouseX <= 45) && (mouseY >= 675 && mouseY <= 720))
  {
    estado = 2;
  }
}