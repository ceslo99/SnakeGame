int speedx = 0;
int speedy = 0;
int size = 20;
int score = 0;
int xdir = 0;
int ydir = 0;
ArrayList<snakeObj> snake = new ArrayList<snakeObj>();
snakeObj apple = new snakeObj();

class snakeObj
{
  int x;
  int y;
  //int xspeed;
  //int yspeed ;
  boolean isalive = true;
  
  
  
  //constructer
  public snakeObj()
  {
    x= 300;
    y= 300;
    //xspeed = 0;
    //yspeed = 0;
    isalive = true;
    
  }
  
  //setter
  public void setsnake( int isx,int isy)
  {
    x=isx;
    y=isy;
    
  }
  
  //setter
  public void setisalive( boolean istf)
  {
    isalive = istf;
    
  }
/*  
   //update
  public void setspeed()
  {
    x = x + xspeed;
    y = y + yspeed;
    
  }
*/  
  //getter
  public int getx()
  {
    return x;
  }
  
  //getter
  public int gety()
  {
    return y;
  }
  
  //getter
  public boolean getisalive()
  {
    return isalive;
  }
  
}




/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

void setup()
{
  size(1200,800);
  frameRate(15);
  
  snake.add(new snakeObj());
  pickLocation();
  
}

void draw()
{
  makeScene();
  
  makeApple();
  
  updateSnake();
  
  showScore();
  
  snakeMove();
  
  restart();
  
}

/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

void makeScene()
{
  background(0);
  
  fill(100);
  rect(60, 60, 1080, 680, 20); //size of gray square
}

void restart()
{
  if(keyPressed)
  {
      
    if (key == 'r' || key == 'R')
    {
      snake.get(0).isalive = true;
      score = 0;
      snake.get(0).x = 300;
      snake.get(0).y = 300;
      xdir = 0;
      ydir = 0;
    }
  }
}
void makeApple()
{
  
  if(snake.get(0).isalive)
  {
   
    
    fill(255,0,0);
    rect(apple.getx(), apple.gety(),size,size);
  }
  
  else
  {
    fill(255);
    textSize(100);
    text("Game Over", 335, 400); 
  }
}

void updateSnake()
{
  if(snake.get(0).isalive)
  {
    for(int i = 0; i <= score ; i++)
    {
      fill(255);
      rect(snake.get(i).x , snake.get(i).y, size,size);
    }
  }
  
  for(int i = score; i > 0; i--)
  {
    
    snake.get(i).setsnake(snake.get(i-1).x, snake.get(i-1).y);
  }
  
}

void eatApple()
{
  for(int i = score; i > 0; i--)
  {
    snake.add(new snakeObj());
    snake.get(i).setsnake(snake.get(i-1).x, snake.get(i-1).y);
  }
    

}

void pickLocation()
{
  int row = width /size;
  int column = height/size;
  int pickr = int(random(5,row-6));
  int pickc = int(random(5,column-6));
  apple.setsnake(pickr*size,pickc*size);
  
}

void showScore()
{
  if( (snake.get(0).x == apple.getx() ) && (snake.get(0).y == apple.gety() ) )
  {
    score++;
    eatApple();
    pickLocation();
    
  }
  fill(255);
  textSize(30);
  text("Score: "+ score , 40, 40); 
}

void snakeMove()
{ 
  
  snake.get(0).x += speedx ;
  snake.get(0).y += speedy ;
  
  if (snake.get(0).x > 1120)
  {
    speedx = 0;
    speedy = 0;
    snake.get(0).isalive = false;
  }
  
  if (snake.get(0).x < 60)
  {
    speedx = 0;
    speedy = 0;
    snake.get(0).isalive = false;
  }
  
  if (snake.get(0).y > 720)
  {
    speedx = 0;
    speedy = 0;
    snake.get(0).isalive = false;
  }
  
  if (snake.get(0).y < 60)
  {
    speedx = 0;
    speedy = 0;
    snake.get(0).isalive = false;
  }
  
  if(keyPressed)
  {
      
    if ( (key == 'a' || key == 'A') && (xdir != 1) ) 
    {
      speedx = -20;
      speedy = 0;
      xdir = -1;
      ydir = 0;
    }
  
    if ( (key == 's' || key == 'S') && (ydir != -1) )
    {
      speedy = 20;
      speedx = 0;
      ydir = 1;
      xdir = 0;
    }
  
    if ( (key == 'd' || key == 'D') && (xdir != -1) )
    { 
      speedx = 20; 
      speedy = 0;
      xdir = 1;
      ydir = 0;
    }
  
    if ( (key == 'w' || key == 'W') && (ydir != 1) )
    {
      speedy = -20;
      speedx = 0;
      ydir = -1;
      xdir = 0;
      
    }
  
  }
  
}