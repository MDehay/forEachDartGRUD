import 'package:apidart/service/apiDog.dart';
import 'package:apidart/service/apiReqRes.dart';
import 'package:apidart/service/apiWord.dart';

import 'modal/dog.dart';
import 'modal/user.dart';

Future<void> apiCallDog() async {
//API dog
  //Je viens chercher un chien
  Dog dogOne = await getDog();
  print(dogOne.message);

  //Je viens chercher un chien par rapport a sa race
  Dog dogTwo = await getDogoByBreed("corgi");
  print(dogTwo.message);

  //Une version optimisé du get
  Dog? dogThree = await getDogv2();
  print(dogThree!.message);
  Dog? dogFour = await getDogv2();
  print(dogFour!.message); 

}

Future<void> apiCallWord() async {
//Api WORD
  String word = await getWord();
  print(word);
  List<String> words = await getWords(10,5);
  print(words);

  List<String>? wordsv2 = await getWordsV2();
  print(wordsv2);
}

Future<void> appCallReqRes() async {
  //Get
 //Je veux récuperer un user  
  User? monUser = await getUser(); 
  print(monUser!.firstName);
  //Get 
  //Je veux récuperer une liste de user
  List<User>? mesUsers = await getUsers();
  for (var element in mesUsers!) {
     print("Mon element => ${element.email}");
  }

  //Post 
  //Je veux crée un user
  User user = User(2, "email", "firstName", "lastName", "avatar");
  await createUser(user: user);

  //PUT
  //Je veux mettre à jour mon user
  await updateUser(user: monUser);

  //Delete
  //Je veux supprimer mon user
  await deleteUser(id: monUser.id);
}

Future<void> main(List<String> args) async {
 //apiCallDog();
 //apiCallWord();
 //appCallReqRes();
}

