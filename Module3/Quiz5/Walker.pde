class Walker {
  PVector position;
  PVector velocity;

  Walker() {
    position = new PVector(0, 0); // center
    velocity = new PVector();
  }

  void step() {
    PVector acceleration = PVector.random2D();
    acceleration.mult(0.5);

    velocity.add(acceleration);
    velocity.limit(5);

    position.add(velocity);

    // bounce using your Window class
    if (position.x > Window.right || position.x < Window.left) {
      velocity.x *= -1;
    }

    if (position.y > Window.top || position.y < Window.bottom) {
      velocity.y *= -1;
    }
  }

  void display() {
    fill(182, 52, 100);
    noStroke();
    circle(position.x, position.y, 50);
  }
}
