import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AccountScreen(),
  ));
}

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String selectedEmail = "";

  List<AccountItem> accountItems = [
    AccountItem(name: 'John Doe', email: 'john@example.com'),
    AccountItem(name: 'Jane Doe', email: 'jane@example.com'),
    AccountItem(name: 'Bob Smith', email: 'bob@example.com'),
    AccountItem(name: 'Alice Johnson', email: 'alice@example.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 32,
                    color: Colors.black,
                  ),
                  Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Switch between your existing account and manage your account.',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  color: Colors.black.withOpacity(0.8),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: accountItems.length,
                itemBuilder: (context, index) {
                  AccountItem item = accountItems[index];
                  bool isSelected = item.email == selectedEmail;
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text(item.email),
                    leading: CircleAvatar(
                      backgroundColor: isSelected ? Colors.blue : Colors.grey,
                      child: Text(item.name[0], style: TextStyle(fontSize: 24)),
                    ),
                    onTap: () {
                      setState(() {
                        selectedEmail = item.email;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen(selectedEmail),
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add logic to add another account
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  minimumSize: Size(200, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Add Another Account',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountItem {
  final String name;
  final String email;

  AccountItem({required this.name, required this.email});
}

class ForgotPasswordScreen extends StatelessWidget {
  final String selectedEmail;

  ForgotPasswordScreen(this.selectedEmail);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: 300,
            height: 300,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock,
                      size: 32,
                      color: Colors.orange,
                    ),
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Enter your email that you need to register your account, so we can send you a link to reset your password.',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      color: Colors.black.withOpacity(0.8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 180,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    controller: TextEditingController(text: selectedEmail),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Add logic to send the reset link
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: Size(200, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Send Link',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
