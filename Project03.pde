final String URL = "http://xml.weather.yahoo.com/forecastrss?p=75208";
final String URLTest = "https://en.wikipedia.org/wiki/United_States_military_casualties_of_war";
XML document;
XML documentTest;

String title;
PImage myImage;
String imageURL;
String date;



Table codSale;
Table militaryDeath;
Table militaryRecruit;




void setup()
{
  size(1280, 720);
  document = loadXML(URL);
  //println(document);

  documentTest = loadXML(URLTest);
  println(documentTest);

  XML titleNode = document.getChild("channel/title");
  title = titleNode.getContent();

  XML imageNode = document.getChild("channel/image/url");
  imageURL = imageNode.getContent();
  myImage = loadImage(imageURL);

  XML dateNode = document.getChild("channel/item/pubDate");
  date = dateNode.getContent();
  
 // prepareDeathData();
  
  
}

void draw()
{
  background(0);
  text(title, width/2, height/2);
  image(myImage, width/2 +100, height/2 +100);
  text(date, width/2 -100, height/2 -100);
}