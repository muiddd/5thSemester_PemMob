import 'game_object.dart';

class Cloud extends GameObject {
  Cloud(double x, double y) : super(x, y);

  @override
  void render() {
    print('Rendering Cloud at position ($x, $y)');
  }

  @override
  void update() {
    print('Cloud is drifting slowly in the background...');
  }
}
