import 'dart:convert';

import 'package:condo_app/models/person.dart';
import 'package:condo_app/providers/providers.dart';
import 'package:condo_app/utils/secure_storage.dart';
import 'package:dio/dio.dart';

import '../config/constants/api_routes.dart';

class AuthService {
  final dio = Dio(
    BaseOptions(baseUrl: ApiRoute.BASE_URL),
  );

  Future<Map<String, dynamic>> login(String email, String password) async {
    // Simulate API call and parsing JSON response8fbd44f6-9ddc-4433-a86f-c9fcedac479c
    final jsonResponse = await dio.post(
      ApiRoute.AUTHENTICATE,
      data: {"Email": email, "Password": password, "AuthType": "Mobile"},
    );

    if (jsonResponse.statusCode == 200 && jsonResponse.data["Result"] != null) {
      Person authUser = Person.fromJson(jsonResponse.data["Result"]["User"]);
      authUser.token = jsonResponse.data["Result"]["Token"];

      // Store user in secure storage
      await SecureStorage.writeUser(authUser);

      return {'Success': jsonResponse.data["Status"], 'User': authUser};
    } else {
      return {
        'Error': jsonResponse.data["Status"],
        'Message': 'Usuario o Contraseña incorrectos'
      };
    }
  }

  Future<void> logout() async {
    // Clear the user from secure storage
    await SecureStorage.clearUser();
  }

  Future<Person?> getAuthUserInStorage(ref) {
    // Get the user from secure storage
    return SecureStorage.readUser().then((user) {
      if (user != null) {
        // If the user is not null, then set the user in the userProvider
        return user;
      }
      return null;
    });
  }

  Future<Person?> saveDataUser(ref, Map<String, dynamic> person) async {
    final Person user = ref.read(userProvider);
    final response = await dio.put(
      "${ApiRoute.GET_USER}${user.id}",
      data: jsonEncode(person),
      options: Options(
        headers: {"Authorization": user.token},
      ),
    );

    if (response.statusCode == 200 && response.data["Status"] == 'SUCCESS') {
      final jsonResponse = await dio.get(
        "${ApiRoute.GET_USER}${user.id}",
        options: Options(
          headers: {"Authorization": user.token},
        ),
      );

      if (jsonResponse.statusCode == 200 &&
          jsonResponse.data["Result"] != null) {
        Person authUser = Person.fromJson(jsonResponse.data["Result"]);
        authUser.token = user.token;

        // Store user in secure storage

        return authUser;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
