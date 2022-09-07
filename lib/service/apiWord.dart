import 'package:dio/dio.dart';

Future<String> getWord() async {
  try {
    var response = await Dio().get("https://random-word-api.herokuapp.com/word");
    return response.data;
  } catch (e) {
    return "ERROR";
  }
}

Future<List<String>> getWords(int number,int len) async {
   try {
    var response = await Dio().get("https://random-word-api.herokuapp.com/word",queryParameters: {"length":len,"number":number});
    return response.data;
  } catch (e) {
    return [];
  }
}

//Version plus optimisé
Future<List<String>?> getWordsV2({int number = 1,int len = 10}) async {
  try {
    var response = await Dio().get("https://random-word-api.herokuapp.com/word",queryParameters: {"length":len,"number":number});
    return response.data;
  } catch (e) {
    return null;
  }
}