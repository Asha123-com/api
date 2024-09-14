import 'package:flutter/material.dart';
import '../model/people_model.dart';
import '../services/userservices.dart';

class DessupUserPage extends StatefulWidget {
  const DessupUserPage({super.key});

  @override
  State<DessupUserPage> createState() => _DesuupUserPageState();
}

class _DesuupUserPageState extends State<DessupUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Application"),
      ),
      body: FutureBuilder<PeopleModel?>(
        future: UserServices().fetchPeopleData(20),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data found'));
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 13.0,
                mainAxisSpacing: 12.0,
                childAspectRatio: 2 / 3, // Adjust the ratio as needed
              ),
              itemCount: snapshot.data!.results!.length,
              itemBuilder: (context, index) {
                final person = snapshot.data!.results![index];

                // Access the location properties from the person object
                final location = person.location;
                final locationDetails =
                    '${location?.city}, ${location?.state}, ${location?.country}';

                return Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                          NetworkImage(person.picture?.thumbnail ?? ''),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${person.name?.first} ${person.name?.last}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 10),

                        // Email with icon
                        Row(
                          children: [
                            Icon(Icons.email, size: 16, color: Colors.blue),
                            SizedBox(width: 5),
                            Expanded(child: Text(person.email ?? '')),
                          ],
                        ),
                        SizedBox(height: 5),

                        // Location with icon
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 16, color: Colors.red),
                            SizedBox(width: 5),
                            Expanded(child: Text(locationDetails)),
                          ],
                        ),
                        SizedBox(height: 5),

                        // Contact information with icon
                        Row(
                          children: [
                            Icon(Icons.phone, size: 16, color: Colors.green),
                            SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                person.phone ?? 'No contact available',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}