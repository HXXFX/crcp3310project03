//fake class
void prepareDeathData()
{
  for (int i = 0; i < ROW_NUMBER; i++)
  {
    deathArray[i] = deathTable.getInt(i, 1);
  }
  println("USMilitaryDeath");
  println(deathArray);
  DeathMinAndMax();
}

void drawDeath()
{ 
  int mappedDeathArray[] = new int[ROW_NUMBER];
  for (int i = 0; i < 10; i++)
  {
    mappedDeathArray[i] = (int)map(deathArray[i], deathMin, deathMax, MAPPED_MIN, MAPPED_MAX);
  }
  //draw line
  stroke(30, 255, 248);
  line(DEATH_INITAL_LOCX + RECT_SIZE/2, DEATH_INITAL_LOCY + RECT_SIZE/2, DEATH_INITAL_LOCX + mappedDeathArray[1]+ RECT_SIZE/2, DEATH_INITAL_LOCY+ RECT_SIZE/2 + VERTICAL_NODE_DISTANCE);
  for (int i = 0; i < 10; i++)
  {
    if (i > 1)
    {
      line(DEATH_INITAL_LOCX + mappedDeathArray[i-1]+ RECT_SIZE/2, DEATH_INITAL_LOCY + RECT_SIZE/2+ (i-1) *VERTICAL_NODE_DISTANCE, DEATH_INITAL_LOCX + mappedDeathArray[i]+ RECT_SIZE/2, DEATH_INITAL_LOCY+ RECT_SIZE/2 + i *VERTICAL_NODE_DISTANCE);
    }
  }
  //draw rect node
  for (int i = 0; i < 10; i++)
  {
    noStroke();
    fill(0);
    float mappedWidth = map(deathArray[i], deathMin, deathMax, MAPPED_MIN, MAPPED_MAX);
    rect(DEATH_INITAL_LOCX + mappedWidth, DEATH_INITAL_LOCY + i * VERTICAL_NODE_DISTANCE, RECT_SIZE, RECT_SIZE);
  }
}

void DeathMinAndMax()
{
  //find the Max 
  deathMax = deathArray[0];
  for (int i = 1; i < deathArray.length; i++)
  { 
    if (deathArray[i] > deathMax)
    {
      deathMax = deathArray[i];
    }
  }
  println("The DeathMax:", deathMax);
  //find the Min 
  deathMin = deathArray[0];
  for (int i = 1; i < deathArray.length; i++)
  { 
    if (deathArray[i] < deathMin)
    {
      deathMin = deathArray[i];
    }
  }
  println("The deathMin:", deathMin);
}