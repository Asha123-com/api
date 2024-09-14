// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
//
// class UserServices {
//   String _baseUrl = "https://randomuser.me/api/";
//
//
//   /// Hand Made Model Class Using Hand Made fromMap function
//   Future<List<UserModel>> fetchDataUsingFromMap(int numberOfUser) async {
//     final url = "${_baseUrl}?results=${numberOfUser}";
//     final response = await http.get(
//       Uri.parse(url),
//     );
//
//
//     if (response.statusCode == 200) {
//       final allData = jsonDecode(response.body);
//       final List data = allData["results"];
//       return data
//           .map((user) => UserModel.fromMap(user))
//           .toList();
//     } else {
//       throw Exception('Failed to load wallpapers');
//     }
//   }
// }
//
