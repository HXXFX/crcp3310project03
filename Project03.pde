final String URL = "http://xml.weather.yahoo.com/forecastrss?p=75208";

XML document;

String title;

PImage myImage;
String imageURL;

String date;

void setup()
{
  size(720, 720);
  document = loadXML(URL);
  println(document);

  XML titleNode = document.getChild("channel/title");
  title = titleNode.getContent();

  XML imageNode = document.getChild("channel/image/url");
  imageURL = imageNode.getContent();
  myImage = loadImage(imageURL);
  
  XML dateNode = document.getChild("channel/item/pubDate");
  date = dateNode.getContent();
}

void draw()
{
  background(0);
  text(title, width/2, height/2);
  image(myImage, width/2 +100, height/2 +100);
  text(date, width/2 -100, height/2 -100);
}