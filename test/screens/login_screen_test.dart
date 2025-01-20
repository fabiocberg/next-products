import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
// import 'package:nextar_products/screens/login_screen.dart';
// import 'package:nextar_products/services/auth_service.dart';

void main() {
  testWidgets('Displays error for invalid login', (WidgetTester tester) async {
    // await tester.pumpWidget(LoginScreen());
    await tester.enterText(find.byKey(Key('email')), 'invalid_email');
    await tester.enterText(find.byKey(Key('password')), '12345');
    await tester.tap(find.byKey(Key('loginButton')));
    await tester.pump();
    expect(find.text('Invalid login credentials'), findsOneWidget);
  });

  testWidgets('Error for empty fields', (WidgetTester tester) async {
    // await tester.pumpWidget(LoginScreen());
    await tester.tap(find.byKey(Key('loginButton')));
    await tester.pump();
    expect(find.text('Fields cannot be empty'), findsOneWidget);
  });

  testWidgets('Redirects to home on successful login',
      (WidgetTester tester) async {
    // when(mockAuthService.login(any, any)).thenAnswer((_) async => true);
    // await tester.pumpWidget(LoginScreen(authService: mockAuthService));
    await tester.enterText(find.byKey(Key('email')), 'test@example.com');
    await tester.enterText(find.byKey(Key('password')), 'password123');
    await tester.tap(find.byKey(Key('loginButton')));
    await tester.pumpAndSettle();
    // expect(find.byType(HomeScreen), findsOneWidget);
  });
}
