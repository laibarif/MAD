import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  Order _order = Order(item: 'Example Item', quantity: 5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SafeArea(
        child: Form(
          key: _formStateKey,
          autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Espresso',
                    labelText: 'Item',
                  ),
                  validator: (value) => _validateItemRequired(value),
                  onSaved: (value) => _order.item = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: '3',
                    labelText: 'Quantity',
                  ),
                  validator: (value) => _validateItemCount(value),
                  onSaved: (value) => _order.quantity = int.tryParse(value!) ?? 0,
                ),
                Divider(height: 32.0),
                ElevatedButton(
                  onPressed: _submitOrder,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _validateItemRequired(String? value) {
    return value?.isEmpty ?? true ? 'Item Required' : null;
  }

  String? _validateItemCount(String? value) {
    int? _valueAsInteger = value?.isEmpty ?? true ? 0 : int.tryParse(value!);
    return _valueAsInteger == 0 ? 'At least one Item is Required' : null;
  }

  void _submitOrder() {
    if (_formStateKey.currentState?.validate() ?? false) {
      _formStateKey.currentState?.save();
      print('Order Item: ${_order.item}');
      print('Order Quantity: ${_order.quantity}');
    }
  }
}

class Order {
  String? item;
  int quantity = 0;

  Order({this.item, required this.quantity});
}
