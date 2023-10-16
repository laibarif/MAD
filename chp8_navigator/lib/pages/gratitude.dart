import 'package:flutter/material.dart';

class Gratitude extends StatefulWidget {
  final int? radioGroupValue;
  Gratitude({Key? key, this.radioGroupValue}) : super(key: key);

  @override
  _GratitudeState createState() => _GratitudeState();
}

class _GratitudeState extends State<Gratitude> {
  List<String> _gratitudeList = ['Coffee', 'Family', 'Friends'];
  String _selectedGratitude = '';
  int _radioGroupValue = 0;

  void _radioOnChanged(int? index) {
    if (index != null) {
      setState(() {
        _radioGroupValue = index;
        _selectedGratitude = _gratitudeList[index];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.radioGroupValue != null) {
      _radioGroupValue = widget.radioGroupValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gratitude'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => Navigator.pop(context, _selectedGratitude),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              for (int i = 0; i < _gratitudeList.length; i++)
                RadioListTile<int>( // Specify the type
                  value: i,
                  groupValue: _radioGroupValue,
                  onChanged: (index) => _radioOnChanged(index),
                  title: Text(_gratitudeList[i]),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
