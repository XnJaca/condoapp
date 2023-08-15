import 'package:condo_app/config/constants/api_routes.dart';
import 'package:condo_app/models/models.dart';
import 'package:condo_app/providers/auth_provider.dart';
import 'package:dio/dio.dart';

class CondominioService {
  final dio = Dio(
    BaseOptions(baseUrl: ApiRoute.BASE_URL),
  );
  Future<List<Condominio>> getCondominios(ref) async {
    final Person user = ref.read(userProvider);
    final token = user.token;
    final idPerson = user.id;

    final response = await dio.get("${ApiRoute.CONDOMINIOS}$idPerson",
        options: Options(
          headers: {"Authorization": token},
        ));

    if (response.statusCode == 200 && response.data["Result"] != null) {
      List<Condominio> condominios = [];

      response.data["Result"].forEach((v) {
        condominios.add(Condominio.fromJson(v));
      });

      return condominios;
    } else {
      throw Exception("Error al obtener las fincas asociadas");
    }
  }
}
