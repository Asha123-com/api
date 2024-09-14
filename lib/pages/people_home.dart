import 'package:flutter/material.dart';
import '../model/people_model.dart';
import '../services/userservices.dart';
class PeopleHome extends StatelessWidget {
  const PeopleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('REST API'),
        centerTitle: true,
      ),
      body: FutureBuilder<PeopleModel?>(
        future: UserServices().fetchPeopleData(9),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.results!.length,
              itemBuilder: (context, index) {
                final person = snapshot.data!.results![index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    NetworkImage(person.picture?.thumbnail ?? ''),
                  ),
                  title: Text('${person.name?.first} ${person.name?.last}'),
                  subtitle: Text(person.email ?? ''),
                );
              },
            );
          }
        },
      ),
    );

  }
}
