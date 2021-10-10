import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cryptoworld/data';

Future signUp(
    String firstName, String userName, String email, String password) async {
  var url = Uri.parse("http://localhost:8080/Users/register");
  final bodydata = jsonEncode({
    'firstName': firstName,
    'username': userName,
    'email': email,
    'password': password
  });
  http.Response response = await http.post(url,
      headers: {"content-type": "application/json"}, body: bodydata);
  print("signup");
  print(response.body);
  return response.body;
}

// Future listOfUser(
//     // String firstName,
//     // String userName,
//     // String email,
//     ) async {
//   // String url = "http://localhost:8080/Users/User/list";
//   var url = Uri.parse("http://localhost:8080/Users/User/list/search?keyword");
//   http.Response response = await http.get(url);
//   List<ShowData> processedObject = jsonDecode(response.body)
//       .map((item) => ShowData.from(item))
//       .toList()
//       .cast<ShowData>();
//   return processedObject;
// }

Future getSearchListSize(String keyword) async {
  var url = Uri.parse(
      "http://localhost:8080/Users/User/list/search/size?keyword=$keyword");

  http.Response response = await http.get(url);

  return response.body;
}

Future getFullListSize() async {
  var url = Uri.parse("http://localhost:8080/Users/User/list/fullsize");

  http.Response response = await http.get(
    url,
    headers: {"content-type": "application/json"},
  );
  print("FULL-LIST-API");
  return response.body;
}

Future searchListUsers(String keyword, int pageNo) async {
  var url = Uri.parse(
      "http://localhost:8080/Users/User/list/search?keyword=$keyword&pageNo=$pageNo");
  http.Response response = await http.get(
    url,
    headers: {"content-type": "application/json"},
  );
  List<ShowData> searchlistofUser = jsonDecode(response.body)
      .map((item) => ShowData.from(item))
      .toList()
      .cast<ShowData>();
  print("dfgfhfg");
  return searchlistofUser;
}

Future fullListUsers(int pageNo) async {
  var url = Uri.parse("http://localhost:8080/Users/User/list?pageNo=$pageNo");
  http.Response response = await http.get(
    url,
    headers: {"content-type": "application/json"},
  );
  List<ShowData> fullListofUser = jsonDecode(response.body)
      .map((item) => ShowData.from(item))
      .toList()
      .cast<ShowData>();
  print("huub");
  return fullListofUser;
}

Future signIn(String email, String password) async {
  var url = Uri.parse('http://localhost:8080/Users/login/$email/$password');
  http.Response response = await http.get(url, headers: {
    "Accept": "text/plain",
  });
  return response.body;
}




// Future signUpUser(String name, String bloodGroup, String phoneNumber,
//     String pinCode, String email, String password) async {
//   int pincode = int.parse(pinCode);
//   var url = Uri.parse("http://103.146.234.212:8085/optimist/register");
//   final bodydata = jsonEncode({
//     'name': name,
//     'bloodType': bloodGroup,
//     'phoneNumber': phoneNumber,
//     'pinCode': pincode,
//     'email': email,
//     'password': password,
//   });
//   http.Response response = await http.post(url,
//       headers: {"content-type": "application/json"}, body: bodydata);
//   print("signup");
//   print(response.body);
//   return response.body;
// }
