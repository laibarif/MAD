import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () { },

        ),

        actions: <Widget>[
          PopupMenuButton<TodoMenuItem>(
            icon: Icon(Icons.view_list),
            onSelected: ((valueSelected) {
              print('valueSelected: ${valueSelected.title}');
            }),
            itemBuilder: (BuildContext context) {
              return foodMenuList.map((TodoMenuItem todoMenuItem) {
                return PopupMenuItem<TodoMenuItem>(
                  value: todoMenuItem,
                  child: Row(
                    children: <Widget>[
                      Icon(todoMenuItem.icon.icon),
                      Padding(padding: EdgeInsets.all(8.0),),
                      Text(todoMenuItem.title),
                    ],
                  ),
                );
              }).toList();
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
          PopupMenuButtonWidget(),
        ],
        flexibleSpace: SafeArea(
          child: Icon(
            Icons.photo_camera,
            size: 75.0,
            color: Colors.white70,
          ),
        ),
        bottom: PreferredSize(
          child: Container(
            color: Colors.lightGreen.shade100,
            height: 75.0,
            width: double.infinity,
            child: Center(
              child: Text('Bottom'),
            ),
          ),
          preferredSize: Size.fromHeight(75.0),
        ),

      ),

      body: Padding(
      padding: EdgeInsets.all(16.0),
//       child: SafeArea(
//       child: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             const ContainerWithBoxDecorationWidget(),
//             Divider(),
//             const ColumnWidget(),
//             Divider(),
//             const RowWidget(),
//             Divider(),
//             const ColumnAndRowNestingWidget(),
//             Divider(),
//             // Default - left button
//             FlatButton(
//               onPressed: () {},
//               child: Text('Flag'),
//             ),
// // Customize - right button
//             FlatButton(
//               onPressed: () {},
//               child: Icon(Icons.flag),
//               color: Colors.lightGreen,
//               textColor: Colors.white,
//             ),
//           ],
//         ),
//     ),
//     ),
        // Default - left button
        // IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.flight),
        // ),
// Customize - right button
//         IconButton(
//           onPressed: () {},
//           icon: Icon(Icons.flight),
//           iconSize: 42.0,
//           color: Colors.white,
//           tooltip: 'Flight',
//         ),
     ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.play_arrow),
        backgroundColor: Colors.lightGreen.shade100,

      ),
// or
// This creates a Stadium Shape FloatingActionButton
// floatingActionButton: FloatingActionButton.extended(
// onPressed: () {},
// icon: Icon(Icons.play_arrow),
// label: Text('Play'),
// ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.lightGreen.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.pause),
            Icon(Icons.stop),
            Icon(Icons.access_time),
            Padding(
              padding: EdgeInsets.all(32.0),
            ),
          ],
        ),
      ),
    );
  }
}

class PopupMenuButtonWidget extends StatelessWidget implements PreferredSizeWidget {
  const PopupMenuButtonWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen.shade100,
      height: preferredSize.height,
      width: double.infinity,
      //child: Center(
        // child: PopupMenuButton<TodoMenuItem>(
        //   icon: Icon(Icons.view_list),
        //   onSelected: ((valueSelected) {
        //     print('valueSelected: ${valueSelected.title}');
        //   }),
        //   itemBuilder: (BuildContext context) {
        //     return foodMenuList.map((TodoMenuItem todoMenuItem) {
        //       return PopupMenuItem<TodoMenuItem>(
        //         value: todoMenuItem,
        //         child: Row(
        //           children: <Widget>[
        //             Icon(todoMenuItem.icon.icon),
        //             Padding(
        //               padding: EdgeInsets.all(8.0),
        //             ),
        //             Text(todoMenuItem.title),
        //           ],
        //         ),
        //       );
        //     }).toList();
        //   },
        // ),
      //),
      // color: Colors.white70,
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.map),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.airport_shuttle),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.brush),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
  @override
  // implement preferredSize
  Size get preferredSize => Size.fromHeight(75.0);
}

class ContainerWithBoxDecorationWidget extends StatelessWidget {
  const ContainerWithBoxDecorationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100.0),
              bottomRight: Radius.circular(10.0),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.lightGreen.shade500,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),

          child: Center(
            child: RichText(
              text: TextSpan(
                text: 'Flutter World',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.deepPurple,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.deepPurpleAccent,
                  decorationStyle: TextDecorationStyle.dotted,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' for',
                  ),
                  TextSpan(
                    text: ' Mobile',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.
          spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text('Columns and Row Nesting 1',),
            Text('Columns and Row Nesting 2',),
            Text('Columns and Row Nesting 3',),
            Padding(padding: EdgeInsets.all(16.0),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Row Nesting 1'),
                Text('Row Nesting 2'),
                Text('Row Nesting 3'),
              ],
            ),
          ],
        ),

      ],

    );

  }
}
class ColumnWidget extends StatelessWidget {
  const ColumnWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text('Column 1'),
        Divider(),
        Text('Column 2'),
        Divider(),
        Text('Column 3'),
      ],
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text('Row 1'),
            Padding(padding: EdgeInsets.all(16.0),),
            Text('Row 2'),
            Padding(padding: EdgeInsets.all(16.0),),
            Text('Row 3'),
          ],
        ),
      ],
    );
  }
}

class ColumnAndRowNestingWidget extends StatelessWidget {
  const ColumnAndRowNestingWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text('Columns and Row Nesting 1',),
        Text('Columns and Row Nesting 2',),
        Text('Columns and Row Nesting 3',),
        Padding(padding: EdgeInsets.all(16.0),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Row Nesting 1'),
            Text('Row Nesting 2'),
            Text('Row Nesting 3'),
          ],
        ),
      ],
    );
  }
}

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(16.0)),
            TextButton(
              onPressed: () {},
              child: Text('Flag'),
            ),
            Padding(padding: EdgeInsets.all(16.0)),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.flag),
              label: Text('Flag'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.lightGreen,
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(16.0)),
            ElevatedButton(
              onPressed: () {},
              child: Text('Save'),
            ),
            Padding(padding: EdgeInsets.all(16.0)),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.save),
              label: Text('Save'),
              style: ElevatedButton.styleFrom(
                primary: Colors.lightGreen,
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(16.0)),
            IconButton(
              icon: Icon(Icons.flight),
              onPressed: () {},
            ),
            Padding(padding: EdgeInsets.all(16.0)),
            IconButton(
              icon: Icon(Icons.flight),
              iconSize: 42.0,
              color: Colors.lightGreen,
              tooltip: 'Flight',
              onPressed: () {},
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}


class TodoMenuItem {
  final String title;
  final Icon icon;
  TodoMenuItem({
    required this.title,
    required this.icon,
  });


}
// Create a List of Menu Item for PopupMenuButton
List<TodoMenuItem> foodMenuList = [
  TodoMenuItem(title: 'Fast Food', icon: Icon(Icons.fastfood)),
  TodoMenuItem(title: 'Remind Me', icon: Icon(Icons.add_alarm)),
  TodoMenuItem(title: 'Flight', icon: Icon(Icons.flight)),
  TodoMenuItem(title: 'Music', icon: Icon(Icons.audiotrack)),
];




