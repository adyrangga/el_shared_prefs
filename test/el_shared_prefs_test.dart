import 'package:flutter_test/flutter_test.dart';

import 'package:el_shared_prefs/el_shared_prefs.dart';

void main() {
  test('init el_shared_prefs should not to be null', () async {
    expect(await ElSharedPrefs().init(), isNot(null));
  });

  test('el_shared_prefs setBool true', () async {
    await ElSharedPrefs().init();
    await ElSharedPrefs().setBool('testBool', true);
    expect(ElSharedPrefs().getBool('testBool'), true);
  });
}
