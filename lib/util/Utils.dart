import 'dart:math';

class Utils {

  int generateRandom(int min, int max) {
    return min + Random().nextInt(max - min + 1);
  }

}