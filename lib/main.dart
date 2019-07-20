import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final buildings = [
      Building(
          BuildingType.theater, 'CineArts at the Empire', '85 W Portal Ave'),
      Building(
          BuildingType.theater, 'CineArts at the Empire', '85 W Portal Ave'),
      Building(
          BuildingType.theater, 'CineArts at the Empire', '85 W Portal Ave'),
      Building(
          BuildingType.theater, 'CineArts at the Empire', '85 W Portal Ave'),
      Building(
          BuildingType.theater, 'CineArts at the Empire', '85 W Portal Ave'),
      Building(
          BuildingType.theater, 'CineArts at the Empire', '85 W Portal Ave'),
      Building(
          BuildingType.theater, 'CineArts at the Empire', '85 W Portal Ave'),
      Building(
          BuildingType.theater, 'CineArts at the Empire', '85 W Portal Ave'),
      Building(
          BuildingType.theater, 'CineArts at the Empire', '85 W Portal Ave'),
      Building(
          BuildingType.theater, 'CineArts at the Empire', '85 W Portal Ave'),
      Building(
          BuildingType.theater, 'CineArts at the Empire', '85 W Portal Ave'),
      Building(
          BuildingType.theater, 'CineArts at the Empire', '85 W Portal Ave'),
      Building(
          BuildingType.theater, 'CineArts at the Empire', '85 W Portal Ave'),
      Building(BuildingType.restaurant, 'La Ciccia', '291 30th St'),
      Building(BuildingType.restaurant, 'La Ciccia', '291 30th St'),
      Building(BuildingType.restaurant, 'La Ciccia', '291 30th St'),
    ];
    return MaterialApp(
        title: 'Flutter App',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Flutter'),
            ),
            body: BuildingListView(
                buildings, (index) => print('item $index clicked'))
        ));
  }
}

class BuildingListView extends StatelessWidget {
  final List<Building> buildings;
  final OnItemClickListener listener;

  BuildingListView(this.buildings, this.listener);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: buildings.length,
        itemBuilder: (context, index) {
          return new ItemView(index, buildings[index], listener);
        });
  }
}

typedef OnItemClickListener = void Function(int position);

enum BuildingType { theater, restaurant }

class Building {
  final BuildingType type;
  final String title;
  final String address;

  Building(this.type, this.title, this.address);
}

class ItemView extends StatelessWidget {
  final int position;
  final Building building;
  final OnItemClickListener listener;

  ItemView(this.position, this.building, this.listener);

  @override
  Widget build(BuildContext context) {
    final icon = Icon(
      building.type == BuildingType.restaurant
          ? Icons.restaurant
          : Icons.theaters,
      color: Colors.blue[900],
    );

    final widget = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          child: icon,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                building.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(building.address)
            ],
          ),
        )
      ],
    );

    return InkWell(
      onTap: () => listener,
      child: widget,
    );
  }
}
