// import 'dart:convert';

// import 'package:http/http.dart';

// import '../Api/model/user.dart';

// class HttpService {
//   final String postsURL = "http://3.21.228.107/api/register";

//   Future<List<User>> getPosts() async {
//     Response res = await get(postsURL);

//     if (res.statusCode == 200) {
//       List<dynamic> body = jsonDecode(res.body);

//       List<User> posts = body
//           .map(
//             (dynamic item) => User.fromJson(item),
//           )
//           .toList();

//       return posts;
//     } else {
//       throw "Can't get posts.";
//     }
//   }
// }
