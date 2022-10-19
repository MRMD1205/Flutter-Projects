import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'The Empire',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                'Shield',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        Icon(
          Icons.amp_stories,
          color: Colors.red[500],
          size: 40,
        ),
        const Text(
          '1.5K',
          style: TextStyle(fontSize: 15),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Details Page'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'assets/images/shield.jpg',
              width: 600,
              height: 200,
              fit: BoxFit.cover,
            ),
            titleSection,
            functionalButtonRow(context),
            bottomTextSection
          ],
        ),
      ),
    );
  }

  Widget bottomTextSection = const Padding(
    padding: EdgeInsets.all(32),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );
}

Column functionalButtonColumn(
    Color color, IconData iconData, String label, BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(iconData, color: color),
      Container(
          margin: const EdgeInsets.only(top: 8),
          child: InkWell(
            onTap: () {
              print('Tap');
              Scaffold.of(context).showSnackBar(
                new SnackBar(
                  content: new Text("Sending Message"),
                ),
              );
              /*_showToast(context, "processing...");*/
            },
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ))
    ],
  );
}

Widget functionalButtonRow(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      functionalButtonColumn(Colors.blue, Icons.call, "Call", context),
      functionalButtonColumn(Colors.blue, Icons.near_me, "Route", context),
      functionalButtonColumn(Colors.blue, Icons.share, "Share", context)
    ],
  );
}

void _showToast(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    const SnackBar(content: Text(
        'Added to favorite')),
  );
}

/*
void _showToast(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    action: SnackBarAction(
      label: 'Undo',
      textColor: Colors.white,
      onPressed: () {},
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    backgroundColor: Colors.blue,
  );
  final scaffold = ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
*/
