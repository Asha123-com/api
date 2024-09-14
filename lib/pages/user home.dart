// import 'package:flutter/material.dart';
// class user extends StatefulWidget {
//   const user({super.key});
//
//   @override
//   State<user> createState() => _userState();
// }
//
// class _userState extends State<user> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text("USER"),
//         centerTitle: true,
//       ),
//       body: FutureBuilder<List<UserModel>?>(
//         future: UserServices().fetchDataUsingFromMap(5),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data == null) {
//             return Center(child: Text('No data found'));
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 final person = snapshot.data![index];
//                 return ListTile(
//                   title: Text("${person.firstName}"),
//                 );
//               },
//             );
//           }
//         },
//       )
//     );
//   }
// }
