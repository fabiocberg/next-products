import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
// import 'package:nextar_products/screens/home_screen.dart';
// import 'package:nextar_products/services/product_service.dart';
// import 'package:nextar_products/widgets/product_card.dart';

void main() {
  testWidgets('Displays product cards', (WidgetTester tester) async {
    // when(mockProductService.getProducts())
    // .thenAnswer((_) async => mockProducts);
    // await tester.pumpWidget(HomeScreen(productService: mockProductService));
    // expect(find.byType(ProductCard), findsWidgets);
  });

  testWidgets('Filters products by price', (WidgetTester tester) async {
    // await tester.pumpWidget(HomeScreen());
    await tester.tap(find.byKey(Key('filterPriceButton')));
    await tester.pump();
    // Validate the sorting logic here
    // expect(find.byKey(Key('productCard')).first, matchesPriceOrder());
  });

  testWidgets('Navigates to edit screen on card tap',
      (WidgetTester tester) async {
    // await tester.pumpWidget(HomeScreen());
    await tester
        .tap(find.byKey(Key('productCard_1'))); // Replace with actual keys
    await tester.pumpAndSettle();
    // expect(find.byType(EditProductScreen), findsOneWidget);
  });
}
