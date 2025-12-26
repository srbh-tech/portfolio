import 'package:flutter_test/flutter_test.dart';
import 'package:prt_one/main.dart';
import 'package:prt_one/data/portfolio_content.dart';

void main() {
  testWidgets('Portfolio app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyPortfolioApp());

    // Verify that the name is displayed.
    // Note: We use find.textContaining because the name might be part of a larger string or structure,
    // though in our case it's a standalone text widget.
    expect(find.text(PortfolioContent.name), findsOneWidget);
    expect(find.text("Hi, I'm"), findsOneWidget);
  });
}
