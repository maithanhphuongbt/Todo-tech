import 'package:flutter_test/flutter_test.dart';
import 'package:todo_tech/core/services/api_services.dart';
import 'package:todo_tech/core/services/api_urls.dart';

main() {
  group('Test apis', () {
    test('Get todo list test success', () async {
      expect(await ApiServices().get(get_todo_list_url), isA<dynamic>());
    });
  });
}
