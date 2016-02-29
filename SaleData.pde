void prepareSaleData()
{
  for (int i = 0; i < ROW_NUMBER; i++)
  {
    saleArray[i] = saleTable.getInt(i, 1);
  }
  println("CoDSale");
  println(saleArray);
  SaleMinAndMax();
}

void drawSale()
{ 
  int mappedSaleArray[] = new int[ROW_NUMBER];
  for (int i = 0; i < 10; i++)
  {
    mappedSaleArray[i] = (int)map(saleArray[i], saleMin, saleMax, MAPPED_MIN, MAPPED_MAX);
  }
  //draw line
  stroke(0, 0, 225);
  line(SALE_INITAL_LOCX + RECT_SIZE/2, SALE_INITAL_LOCY + RECT_SIZE/2, SALE_INITAL_LOCX + mappedSaleArray[1]+ RECT_SIZE/2, SALE_INITAL_LOCY+ RECT_SIZE/2 + VERTICAL_NODE_DISTANCE);
  for (int i = 0; i < 10; i++)
  {
    if (i > 1)
    {
      line(SALE_INITAL_LOCX + mappedSaleArray[i-1]+ RECT_SIZE/2, SALE_INITAL_LOCY + RECT_SIZE/2+ (i-1) *VERTICAL_NODE_DISTANCE, SALE_INITAL_LOCX + mappedSaleArray[i]+ RECT_SIZE/2, SALE_INITAL_LOCY+ RECT_SIZE/2 + i *VERTICAL_NODE_DISTANCE);
    }
  }
  //draw rect node
  for (int i = 0; i < 10; i++)
  {
    noStroke();
    fill(0);
    float mappedWidth = map(saleArray[i], saleMin, saleMax, MAPPED_MIN, MAPPED_MAX);
    rect(SALE_INITAL_LOCX + mappedWidth, SALE_INITAL_LOCY + i * VERTICAL_NODE_DISTANCE, RECT_SIZE, RECT_SIZE);
  }
}

void SaleMinAndMax()
{
  //find the Max 
  saleMax = saleArray[0];
  for (int i = 1; i < saleArray.length; i++)
  { 
    if (saleArray[i] > saleMax)
    {
      saleMax = saleArray[i];
    }
  }
  println("The SaleMax:", saleMax);
  //find the Min 
  saleMin = saleArray[0];
  for (int i = 1; i < saleArray.length; i++)
  { 
    if (saleArray[i] < saleMin)
    {
      saleMin = saleArray[i];
    }
  }
  println("The saleMin:", saleMin);
}