
import 'package:apidart/modal/user.dart';
import 'package:dio/dio.dart';

const String URL = "https://reqres.in/api";
//Doc : https://reqres.in/
//GET
Future<User?> getUser({int id = 1}) async {
  try {
    var response = await Dio().get("$URL/users/$id");
    return User.fromJson(response.data["data"]);
  } catch (e) {
    return null;
  }
}

//https://reqres.in/api/users?page=2
Future<List<User>?> getUsers({int page = 1}) async {
  try {
    var response =
        await Dio().get("$URL/users", queryParameters: {"page": page});
    List<User> users = [];
    print(response.data["data"]);
    response.data["data"]
        .forEach((element) => {users.add(User.fromJson(element))});
    return users;
  } catch (e) {
    return null;
  }
}

//POST
Future<void> createUser({required User user}) async {
  try {
    var response = await Dio().post("$URL/users", data: user);
    if (response.statusCode == 201) {
      print("Post user succes");
    } else {
      print("Not update data ${response.statusCode}");
    }
  } catch (e) {
    print(e);
  }
}
//PUT
Future<void> updateUser({required User user}) async {
  try {
    var response = await Dio().put("$URL/users/${user.id}",data: user);
    if (response.statusCode == 200) {
      print("Update user succes");
    } else {
      print("Not Posting data ${response.statusCode}");
    }
  } catch (e) {
    print(e);
  }
}
//DELETE
Future<void> deleteUser({required int id}) async {
  try {
    var response = await Dio().delete("$URL/users/$id");
    if (response.statusCode == 204) {
      print("Delete user succes");
    } else {
      print("Not delete data ${response.statusCode}");
    }
  } catch (e) {
    print(e);
  }
}