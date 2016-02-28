
Table saleTable;
Table deathTable;
Table recruitTable;

final int ROW_NUMBER = 11;

int deathArray[] = new int[ROW_NUMBER];


void setup()
{
  size(1280, 720);

  deathTable = loadTable("USMilitaryDeath.csv");

  prepareDeathData();
  prepareRecruitData();
  prepareSaleData();
}

void draw()
{
  background(0);
  drawDeathData();
}

void prepareDeathData()
{
  for (int i = 0; i < ROW_NUMBER; i++)
  {
    deathArray[i] = deathTable.getInt(i, 1);
  }
  println(deathArray);
}

void prepareRecruitData()
{
}

void prepareSaleData()
{
}


void drawDeathData()
{
  for (int i = 0; i < 10; i++)
  {
  }
}