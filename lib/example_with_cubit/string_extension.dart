import 'dart:math' as math show Random;

extension ItreableExtnesion<T> on Iterable<T> {
  T getrandomElement() {
    return elementAt(math.Random().nextInt(length));
  }
}
