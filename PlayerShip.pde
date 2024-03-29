Player playerShip;

class Player
{
  int speed;
  private int x;
  private int y;
  float size;
  PImage img;

  Player(int x, int y, int speed, float size)
  {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.size = size;

    this.img = playerImg;

    // ------------- Was going for a character select screen, gave up -------------
    //int d = int(random(1, 100));
    //if (d <= 50)
    //{
    //  img = loadImage("images/player.png");
    //} else
    //{
    //  img = loadImage("images/player2.png");
    //}

    img.resize(int(size), 0);
  }

  PVector getCoordinates()
  {
    return new PVector(x, y);
  }

  void setX(float x) {
    this.x = int(x);
  }
  float getX() {
    return x;
  }
  void setY(float y) {
    this.y = int(y);
  }
  float getY() {
    return y;
  }

  void update()
  {
    move();
    rotateShip();
  }

  void display()
  {
    stroke(0);
    fill(255);
    //ellipse(x,y, size, size);
    imageMode(CENTER);
    image(img, 0, 0);
  }

  void move()
  {
    // OLD Method, doesnt follow david criteria as much as such
    //if (useMouseToMove) x = mouseX;
  }

  void rotateShip()
  {
    float angle = atan2( mouseY - y, mouseX - x);
    pushMatrix();
    translate(x, y);
    rotate(angle + HALF_PI);
    display();
    popMatrix();
  }
}

void keyPressed()
{
  // Guard clauses!!!!!!!!
  if (key != CODED) return;
  if (playerShip == null) return;
  if (currentState != gameStates.INGAME) return;

  // Movement.
  if (keyCode == LEFT && playerShip.getX() > 0 + playerShip.size/2) playerShip.setX(playerShip.x-=playerShip.speed);
  if (keyCode == RIGHT && playerShip.x < width - playerShip.size/2) playerShip.setX(playerShip.x+=playerShip.speed);
  if (keyCode == UP && playerShip.y > 0 - playerShip.size/2) playerShip.setY(playerShip.y-=playerShip.speed);
  if (keyCode == DOWN && playerShip.y < height - 80 - playerShip.size/2) playerShip.setY(playerShip.y+=playerShip.speed);

  //if (key == CODED)
  //{
  //  if (keyCode == LEFT && !playerShip.useMouseToMove && gameState == INGAME)
  //  {
  //    println("LEFT");
  //    if (playerShip.getCoordinates().x > 0 + playerShip.size/2) playerShip.getCoordinates().x-=playerShip.speed;
  //  }
  //  if (keyCode == RIGHT && !playerShip.useMouseToMove && gameState == INGAME)
  //  {
  //    if (playerShip.getCoordinates().x < width - playerShip.size/2) playerShip.getCoordinates().x+=playerShip.speed;
  //  }
  //  //if (keyCode == UP && !playerShip.useMouseToMove && playerShip.getCoordinates().y > height-100 && gameState == INGAME) playerShip.getCoordinates().y-=playerShip.speed;
  //  //if (keyCode == DOWN && !playerShip.useMouseToMove && playerShip.getCoordinates().y < height && gameState == INGAME) playerShip.getCoordinates().y+=playerShip.speed;
  //}
}
