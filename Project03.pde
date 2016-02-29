//big bad motherfucker

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

void setup()
{
  size(720, 1080);

  deathTable = loadTable("USMilitaryDeath.csv");
  saleTable = loadTable("CoDSale.csv");
  recruitTable = loadTable("USMilitaryRecruiting.csv");

  prepareDeathData();
  prepareSaleData();
  prepareRecruitData();
}

void draw()
{
  //background(0);
  drawDeath();
  drawSale();
  drawRecruit();
}