
import 'package:apidart/modal/dog.dart';
import 'package:dio/dio.dart';

const String URL = "https://dog.ceo/api";

//Version simple
Future<Dog> getDog() async {
  try {
    var response = await Dio().get("$URL/breeds/image/random");
    return Dog.fromJson(response.data);
  } catch (e) {
    return Dog(message: "NULL", status: "NULL");
  }
}

Future<Dog> getDogoByBreed(String name) async {
  try{
    var response = await Dio().get("$URL/breed/$name/images/random");
    return Dog.fromJson(response.data);
  }catch(e){
    print(e);
    return Dog(message: "NULL", status: "NULL");
  }
}

//version optimisé
Future<Dog?> getDogv2({String? name}) async {
  try {
    String get = URL;
    if(name == null){
      get += "/breeds/image/random";
    }else{
      get += "breed/$name/images/random";
    }
    var response = await Dio().get(get);
    return Dog.fromJson(response.data);
  } catch (e) {
    print(e);
    return null;
  }
}