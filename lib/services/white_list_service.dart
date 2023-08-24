import 'package:condo_app/config/constants/api_routes.dart';
import 'package:condo_app/models/models.dart';
import 'package:condo_app/providers/providers.dart';
import 'package:dio/dio.dart';

class WhiteListService {
  final dio = Dio(
    BaseOptions(baseUrl: ApiRoute.BASE_URL),
  );

  Future<List<WhiteList>> getWhiteList(ref, idFinca) async {
    final Person user = ref.read(userProvider);
    final String idCondominio = ref.read(condominioId);

    final response = await dio.get(
      "${ApiRoute.GET_WHITE_LIST}$idCondominio/${user.id}/$idFinca",
      options: Options(
        headers: {"Authorization": user.token},
      ),
    );

    if (response.statusCode == 200 && response.data["Result"] != null) {
      List<WhiteList> whiteList = [];

      response.data["Result"].forEach((v) {
        whiteList.add(WhiteList.fromJson(v));
      });

      return whiteList;
    } else {
      throw Exception("Error al obtener la lista blanca");
    }
  }
}
