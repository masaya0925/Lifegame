
boolean[][] cells, next;

void setup() {
  size(500, 500);
  cells = new boolean[width][height]; 
  next = new boolean[width][height];
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      cells[i][j] = random(1) < 0.5;
    }
  }
}

void update() {
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      boolean up = cells[i][(j - 1 + height) % height];
      boolean down = cells[i][(j + 1) % height];
      boolean right = cells[(i + 1) % width][j];
      boolean left = cells[(i - 1 + width) % width][j];
      boolean topright = cells[(i + 1) % width][(j - 1 + height) % height];
      boolean lowerright = cells[(i + 1) % width][(j + 1) % height];
      boolean topleft = cells[(i - 1 + width) % width][(j - 1 + height) % height];
      boolean lowerleft = cells[(i - 1 + width) % width][(j + 1) % height];
      int count = 0;
      if (up) count++;
      if (down) count++;
      if (right) count++;
      if (left) count++;
      if (topright) count++;
      if (lowerright) count++;
      if (topleft) count++;
      if (lowerleft) count++;

      if (cells[i][j]) {
        if (count == 2 || count == 3) {
          next[i][j] = true;
        } else if (count >= 4) {
          next[i][j] = false;
        } else if (count <= 1) {
          next[i][j] = false;
        } else {
          next[i][j] = false;
        }
      } else {
        if (count == 3) {
          next[i][j] = true;
        } else {
          next[i][j] = false;
        }
      }
    }
  }
}

void draw() {
  update();

  loadPixels();
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      cells[i][j] = next[i][j];
      color c;
      if (cells[i][j]) {
        c = color(255);
      } else {
        c = color(255, 0, 0);
      }
      pixels[i*width+j] = c;
    }
  }
  updatePixels();
}