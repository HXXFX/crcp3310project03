void prepareRecruitData()
{
  for (int i = 0; i < ROW_NUMBER; i++)
  {
    recruitArray[i] = recruitTable.getInt(i, 1);
  }
  println("USMilitaryRecruiting");
  println(recruitArray);
  RecruitMinAndMax();
}

void drawRecruit()
{ 
  int mappedRecruitArray[] = new int[ROW_NUMBER];
  for (int i = 0; i < 10; i++)
  {
    mappedRecruitArray[i] = (int)map(recruitArray[i], recruitMin, recruitMax, MAPPED_MIN, MAPPED_MAX);
  }
  //draw line
  stroke(245, 10, 55);
  line(RECRUIT_INITAL_LOCX + RECT_SIZE/2, RECRUIT_INITAL_LOCY + RECT_SIZE/2, RECRUIT_INITAL_LOCX + mappedRecruitArray[1]+ RECT_SIZE/2, RECRUIT_INITAL_LOCY+ RECT_SIZE/2 + VERTICAL_NODE_DISTANCE);
  for (int i = 0; i < 10; i++)
  {
    if (i > 1)
    {
      line(RECRUIT_INITAL_LOCX + mappedRecruitArray[i-1]+ RECT_SIZE/2, RECRUIT_INITAL_LOCY + RECT_SIZE/2+ (i-1) *VERTICAL_NODE_DISTANCE, RECRUIT_INITAL_LOCX + mappedRecruitArray[i]+ RECT_SIZE/2, RECRUIT_INITAL_LOCY+ RECT_SIZE/2 + i *VERTICAL_NODE_DISTANCE);
    }
  }
  //draw rect node
  for (int i = 0; i < 10; i++)
  {
    noStroke();
    fill(0);
    float mappedWidth = map(recruitArray[i], recruitMin, recruitMax, MAPPED_MIN, MAPPED_MAX);
    rect(RECRUIT_INITAL_LOCX + mappedWidth, RECRUIT_INITAL_LOCY + i * VERTICAL_NODE_DISTANCE, RECT_SIZE, RECT_SIZE);
  }
}

void RecruitMinAndMax()
{
  //find the Max 
  recruitMax = recruitArray[0];
  for (int i = 1; i < recruitArray.length; i++)
  { 
    if (recruitArray[i] > recruitMax)
    {
      recruitMax = recruitArray[i];
    }
  }
  println("The RecruitMax:", recruitMax);
  //find the Min 
  recruitMin = recruitArray[0];
  for (int i = 1; i < recruitArray.length; i++)
  { 
    if (recruitArray[i] < recruitMin)
    {
      recruitMin = recruitArray[i];
    }
  }
  println("The recruitMin:", recruitMin);
}