import 'package:flutter/material.dart';
import 'package:pageview_widget_indicator/pageview_widget_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('example')),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: 300,
              child: PageView.builder(
                controller: controller,
                itemBuilder: (context, index) => Container(
                  color: Colors.red[(index + 1) % 10 * 100],
                  child: Image.network(
                    'https://picsum.photos/seed/$index/200',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: 100,
                  height: 20,
                  child: PageViewIndicator(
                    height: 30,
                    builder: (context, index, isSelected) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(isSelected ? 1.0 : 0.2),
                        shape: BoxShape.circle,
                      ),
                    ),
                    pageController: controller,
                    itemWidth: 15,
                    itemCount: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
