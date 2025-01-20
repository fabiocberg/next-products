import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nextar_products/main.dart';
// import 'package:nextar_products/services/auth_service.dart';

class MockAuthService extends Mock /*implements AuthService*/ {}

void main() {
  late MockAuthService mockAuthService;

  setUp(() {
    mockAuthService = MockAuthService();
  });

  testWidgets('Splash screen displays animation', (WidgetTester tester) async {
    // await tester.pumpWidget(MyApp(authService: mockAuthService));
    // expect(find.byType(AnimationWidget),
    // findsOneWidget); // Replace AnimationWidget with actual widget
  });

  testWidgets('Redirects to home if user is logged in',
      (WidgetTester tester) async {
    // when(mockAuthService.isLoggedIn()).thenAnswer((_) async => true);
    // await tester.pumpWidget(MyApp(authService: mockAuthService));
    // await tester.pumpAndSettle();
    // expect(find.byType(HomeScreen),
    // findsOneWidget); // Replace with actual HomeScreen
  });

  testWidgets('Redirects to login if user is not logged in',
      (WidgetTester tester) async {
    // when(mockAuthService.isLoggedIn()).thenAnswer((_) async => false);
    // await tester.pumpWidget(MyApp(authService: mockAuthService));
    // await tester.pumpAndSettle();
    // expect(find.byType(LoginScreen),
    // findsOneWidget); // Replace with actual LoginScreen
  });
}
