import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleSection = _TitleSection(
        'Oeschinen Lake Campground', 'Kandersteg, Switzerland', '41');
    final buttonSection = Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildButtonColumn(context, Icons.call, 'CALL'),
            _buildButtonColumn(context, Icons.near_me, 'ROUTE'),
            _buildButtonColumn(context, Icons.share, 'SHARE'),
          ],
        ));

    final textSection = Container(
      padding: EdgeInsets.all(20),
      child: Text(
        """
        nihao jjjjdkdsfdjkdsakdsafksakdf
        """,
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter'),
          ),
          body: ListView(
            children: <Widget>[
              Image.asset(
                'images/like.jpg',
                width: 600,
                height: 300,
                fit: BoxFit.cover,
              ),
              titleSection,
              buttonSection,
              textSection
            ],
          )),
    );
  }
}

class _TitleSection extends StatelessWidget {
  final String title;
  final String subTitle;
  final String startCount;

  _TitleSection(this.title, this.subTitle, this.startCount);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.2),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red,
          ),
          Text(startCount)
        ],
      ),
    );
  }
}

Widget _buildButtonColumn(BuildContext context, IconData icon, String label) {
  final color = Theme.of(context).primaryColor;
  return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: color),
        Container(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
                color: color, fontSize: 15, fontWeight: FontWeight.normal),
          ),
        )
      ]);
}
