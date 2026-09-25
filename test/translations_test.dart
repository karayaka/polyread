import 'package:flutter_test/flutter_test.dart';
import 'package:polyread/core/localization/translations.dart';

void main() {
  test('Italian locale should exist and match the English key set', () {
    final keys = AppTranslations().keys;

    expect(
      keys.containsKey('it'),
      isTrue,
      reason: 'The Italian locale should be defined in AppTranslations.',
    );

    final englishKeys = keys['en']!.keys.toSet();
    final italianKeys = keys['it']!.keys.toSet();

    expect(italianKeys, equals(englishKeys));
  });
}
