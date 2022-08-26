import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';

void main() {
  testWidgets('Emptpy widgets renders text correctly',
      (WidgetTester tester) async {
    const text = "No products yet";
    await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: EmptyWidget(text: text))));
    final textFinder = find.text(text);

    expect(textFinder, findsOneWidget);
  });
}

class EmptyWidget extends StatelessWidget {
  final String text;
  const EmptyWidget({this.text = "No products yet", Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset("assets/anim/empty.json", width: 200, repeat: false),
          Text(text)
        ],
      ),
    );
  }
}
