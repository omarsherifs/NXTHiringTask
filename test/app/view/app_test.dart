import 'package:flutter_test/flutter_test.dart';
import 'package:nxthiringtask/app/app.dart';
import 'package:nxthiringtask/features/main_user_screen/presentation/main_screen.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(MainScreen), findsOneWidget);
    });
  });
}
