import 'package:flutter_test/flutter_test.dart';
import 'package:amazon_clone/sample_test/sample.dart';

void main() {
  group('Sample tests', () {
    test('Testing increament', () {
      final sample = Sample();
      sample.increament();
      expect(sample.counter, 1);
    });

    test('Testing decreament', () {
      final sample = Sample();
      sample.decreament();
      expect(sample.counter, -1);
    });
  });
}
