import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orientation Handling App'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                OrientationLayoutIconsWidget(),
                SizedBox(height: 16.0),
                OrientationLayoutWidget(),
                SizedBox(height: 16.0),
                GridViewWidget(),
                SizedBox(height: 16.0),
                OrientationBuilderWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrientationLayoutIconsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Row(
      children: orientation == Orientation.portrait
          ? [Icon(Icons.star), Icon(Icons.star_border)]
          : [
        Row(
          children: [Icon(Icons.star), Icon(Icons.star_border)],
        ),
        Row(
          children: [Icon(Icons.star), Icon(Icons.star_border)],
        ),
      ],
    );
  }
}

class OrientationLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Container(
      color: orientation == Orientation.portrait ? Colors.yellow : Colors.green,
      height: 100.0,
      width: double.infinity,
      child: Center(
        child: Text(
          'Orientation Layout Widget',
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
      ),
    );
  }
}

class GridViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final crossAxisCount = orientation == Orientation.portrait ? 2 : 4;

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Center(
            child: Text(
              'Item $index',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      },
      itemCount: 10,
    );
  }
}

class OrientationBuilderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Container(
      color: orientation == Orientation.portrait ? Colors.yellow : Colors.green,
      height: 100.0,
      width: double.infinity,
      child: Center(
        child: Text(
          'Orientation Builder Widget',
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
      ),
    );
  }
}