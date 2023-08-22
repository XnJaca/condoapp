import 'dart:convert';

import 'package:condo_app/config/constants/api_routes.dart';
import 'package:condo_app/models/models.dart';
import 'package:condo_app/providers/providers.dart';
import 'package:dio/dio.dart';

class VisitorsService {
  final dio = Dio(
    BaseOptions(baseUrl: ApiRoute.BASE_URL),
  );

  Future<List<Visitor>> getVisitors(ref) async {
    final Person user = ref.read(userProvider);
    final String idCondominio = ref.read(condominioId);
    final response = await dio.get(
      "${ApiRoute.GET_VISITORS}$idCondominio/${user.id}/2023/7/26",
      options: Options(
        headers: {"Authorization": user.token},
      ),
    );

    if (response.statusCode == 200 && response.data["Result"] != null) {
      List<Visitor> visitors = [];

      response.data["Result"].forEach((v) {
        visitors.add(Visitor.fromJson(v));
      });

      return visitors;
    } else {
      throw Exception("Error al obtener los visitantes");
    }
  }

  Future<Visitor> saveVisitor(ref, Map<String, dynamic> visitor) async {
    final Person user = ref.read(userProvider);

    final response = await dio.post(
      ApiRoute.POST_VISITORS,
      data: jsonEncode(visitor),
      options: Options(
        headers: {"Authorization": user.token},
      ),
    );

    if (response.statusCode == 200 && response.data["Result"] != null) {
      return Visitor.fromJson(response.data["Result"]);
    } else {
      throw Exception("Error al guardar el visitante");
    }
  }
}
