import 'package:condo_app/config/constants/api_routes.dart';
import 'package:condo_app/models/models.dart';
import 'package:condo_app/providers/auth_provider.dart';
import 'package:condo_app/providers/general_providers.dart';
import 'package:dio/dio.dart';

class CasasService {
  final dio = Dio(
    BaseOptions(baseUrl: ApiRoute.BASE_URL),
  );

  Future<List<Finca>> getFincas(ref) async {
    final Person user = ref.read(userProvider);
    final String condomioId = ref.read(condominioId);

    final response = await dio.get("${ApiRoute.FINCAS}$condomioId/${user.id}",
        options: Options(
          headers: {"Authorization": user.token},
        ));

    if (response.statusCode == 200 && response.data["Result"] != null) {
      List<Finca> fincas = [];

      response.data["Result"].forEach((v) {
        fincas.add(Finca.fromJson(v));
      });

      return fincas;
    } else {
      throw Exception("Error al obtener las fincas asociadas");
    }
  }
}
