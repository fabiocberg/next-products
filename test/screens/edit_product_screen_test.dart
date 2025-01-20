import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
// import 'package:nextar_products/screens/edit_product_screen.dart';
// import 'package:nextar_products/services/product_service.dart';

void main() {
  testWidgets('Save button disabled for incomplete fields',
      (WidgetTester tester) async {
    // await tester.pumpWidget(EditProductScreen());
    await tester.enterText(find.byKey(Key('nameField')), '');
    await tester.pump();
    expect(tester.widget<ElevatedButton>(find.byKey(Key('saveButton'))).enabled,
        false);
  });

  testWidgets('Save button enabled for valid input',
      (WidgetTester tester) async {
    // await tester.pumpWidget(EditProductScreen());
    await tester.enterText(find.byKey(Key('nameField')), 'Product Name');
    await tester.enterText(find.byKey(Key('codeField')), '12345');
    await tester.pump();
    expect(tester.widget<ElevatedButton>(find.byKey(Key('saveButton'))).enabled,
        true);
  });

  testWidgets('Deletes product successfully', (WidgetTester tester) async {
    // await tester.pumpWidget(EditProductScreen());
    await tester.tap(find.byKey(Key('deleteButton')));
    await tester.pump();
    expect(find.text('Product deleted'), findsOneWidget);
  });
}
