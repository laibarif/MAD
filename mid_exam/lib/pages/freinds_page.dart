import 'package:flutter/material.dart';

class Friend {
  final String name;
  final String email;
  final IconData icon;

  Friend({
  required this.name,
  required this.email,
  required this.icon,
});
}

class FriendsPage extends StatelessWidget {
  final List<Friend> friends = [
    Friend(name: 'Alice', email: 'alice@example.com', icon: Icons.person),
    Friend(name: 'Bob', email: 'bob@example.com', icon: Icons.person),
    Friend(name: 'Charlie', email: 'charlie@example.com', icon: Icons.person),
    Friend(name: 'David', email: 'david@example.com', icon: Icons.person),
    Friend(name: 'Eve', email: 'eve@example.com', icon: Icons.person),
    Friend(name: 'Frank', email: 'frank@example.com', icon: Icons.person),
    Friend(name: 'Grace', email: 'grace@example.com', icon: Icons.person),
    Friend(name: 'Helen', email: 'helen@example.com', icon: Icons.person),
    Friend(name: 'Ivy', email: 'ivy@example.com', icon: Icons.person),
    Friend(name: 'Jack', email: 'jack@example.com', icon: Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends Page'),
      ),
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          final friend = friends[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FriendDetailsPage(friend: friend),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(friend.icon, size: 40.0),
                title: Text(
                  friend.name,
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text(friend.email),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FriendDetailsPage extends StatelessWidget {
  final Friend friend;

  FriendDetailsPage({required this.friend});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          friend.name,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            // textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${friend.name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Email: ${friend.email}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.work, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Portfolio:',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
            Text(
              'Friend-specific portfolio information goes here. For example, accomplishments and projects.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.book, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Study Skills:',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
            Text(
              'Friend-specific study skills information goes here. For example, preferred study methods and resources.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.info, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Random Information:',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
            Text(
              'Some random information about your friend can go here. This could be hobbies, interests, or anything else you\'d like to share.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.blue,
        height: 50,
        alignment: Alignment.center,
        child: Text(
          'Footer Information',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}