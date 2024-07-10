import '../webservices/auth_webservice.dart';

class AuthRepo {
  final AuthWebServices characterWebServices;

  AuthRepo(this.characterWebServices);

  // Future<List<Character>> fectchCharacters() async {
  //   final characters = await characterWebServices.getCharacters();
  //   print('1111111111');
  //   print(CharacterM.fromJson(characters).chars);
  //   return CharacterM.fromJson(characters).chars;
  // }
}
