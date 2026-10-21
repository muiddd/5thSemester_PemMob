import 'obstacle.dart';

class Bird extends Obstacle {
  double speed;

  Bird(double x, double y, {this.speed = 2.0}) : super(x, y);

  void flapWings() {
    print('Bird is flapping wings at height $y!');
  }

  @override
  void move() {
    print('Bird is flying to the left at speed $speed...');
  }

  @override
  void render() {
    print('Rendering Bird at position ($x, $y)');
  }

  @override
  void update() {
    move();
    flapWings();
  }
}
