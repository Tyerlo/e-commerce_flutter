import 'package:ecommerce/app/pages/admin/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Product description matches the defined text', () {
    const description = "This is a test description";

    final product = Product(
        name: "Product",
        description: description,
        price: 12.99,
        imageUrl: "imageUrl");

    expect(product.description, description);
  });

  test("Product name matches defined text", () {
    const name = "Product";

    final product = Product(
        name: name,
        description: "description",
        price: 12.99,
        imageUrl: "imageUrl");

    expect(product.name, name);
  });

  group("Price", () {
    test("Price is correct", () {
      double price = 12;

      final product = Product(
          name: "Product",
          description: "description",
          price: price,
          imageUrl: "imageUrl");

      expect(product.price, price);
    });

    test("Price with tax is correct", () {
      const price = 12.99;
      final product = Product(
          name: "Product",
          description: "description",
          price: price,
          imageUrl: "imageUrl");

      expect(product.priceWithTax, price * 1.2);
    });
  });
}
