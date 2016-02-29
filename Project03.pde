//CRCP3310 Project3
//Zongxian Huang 

/**********************************************************************************
README: This data viz shows the relation between CoD sale number, 
        US military death, and US military recruiting. Clike mouse 
        to show the intel window. 
***********************************************************************************/

//GLOBAL JUNK########################################################################
PImage myBackground;
PImage myWindow;
Table saleTable;
Table deathTable;
Table recruitTable;

final int DEATH_INITAL_LOCX = 270;
final int DEATH_INITAL_LOCY = 100;
final int SALE_INITAL_LOCX = 270;
final int SALE_INITAL_LOCY = 100;
final int RECRUIT_INITAL_LOCX = 270;
final int RECRUIT_INITAL_LOCY = 100;
final int ROW_NUMBER = 11;
final int MAPPED_MIN = 1;
final int MAPPED_MAX = 200;
final int RECT_SIZE = 5;
final int VERTICAL_NODE_DISTANCE = 100;

int deathArray[] = new int[ROW_NUMBER];
int saleArray[] = new int[ROW_NUMBER];
int recruitArray[] = new int[ROW_NUMBER];

int deathMax;
int deathMin;
int saleMax;
int saleMin;
int recruitMax;
int recruitMin;
int state;
final int DRAW_B =0;
final int DRAW_F = 1;
//####################################################################################

void setup()
{
  size(720, 1080);
  myBackground = loadImage("StructuredDataBG.jpg");
  myWindow = loadImage("StructuredDataBGIntel.png");
  deathTable = loadTable("USMilitaryDeath.csv");
  saleTable = loadTable("CoDSale.csv");
  recruitTable = loadTable("USMilitaryRecruiting.csv");

  prepareDeathData();
  prepareSaleData();
  prepareRecruitData();
}

void draw()
{
  if (state == DRAW_B)
  {
  image(myBackground, 0, 0);
  drawDeath();
  drawSale();
  drawRecruit();
  }
  else
  {
  image(myWindow, 0, 0);
  }
}

void mousePressed()
{
  state = (state + 1)% 2;
}