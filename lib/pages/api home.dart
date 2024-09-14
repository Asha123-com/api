import 'package:api/model/api%20model.dart';
import 'package:flutter/material.dart';
import '../services/api services.dart';
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Application"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<UserModel>>(
        future: UserServices().fetchUserData(5),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
                  color: Colors.yellow,
                ));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title:
                  Text("${user.title} ${user.firstName} ${user.lastName}"),
                );
              },
            );
          } else {
            return Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}
