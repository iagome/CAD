int idle = 0;
int desenhaReta = 1;
int desenhaQuad = 2;
int desenhaRet = 3;
int desenhaPolIr = 4;
int selecionadoTrans = 5;
int selecionadoCor = 6;
int desselecionar = 9;
PImage teste;
int estado = 0;

void setup() 
{
  teste = loadImage("teste.jpg");
  background(53);
  size(1280, 720);
  Vertice banana;
  noLoop();
}

void draw() 
{
  image(teste, 0, 0);
}

void mouseClicked()
{
  switch(estado)
  {
    case 0:
    
  }
}