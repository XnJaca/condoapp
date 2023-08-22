import 'package:condo_app/config/constants/api_routes.dart';
import 'package:condo_app/models/models.dart';
import 'package:condo_app/providers/providers.dart';
import 'package:dio/dio.dart';

class BoardService {
  final dio = Dio(
    BaseOptions(baseUrl: ApiRoute.BASE_URL),
  );

  Future<List<Board>> getBoards(ref) async {
    final Person user = ref.read(userProvider);
    final String idCondominio = ref.read(condominioId);
    final token = user.token;
    final idPerson = user.id;

    final response =
        await dio.get("${ApiRoute.POSTS_RECIEVED}$idPerson/$idCondominio",
            options: Options(
              headers: {"Authorization": token},
            ));

    if (response.statusCode == 200 && response.data["Result"] != null) {
      List<Board> boards = [];

      response.data["Result"].forEach((v) {
        boards.add(Board.fromJson(v));
      });

      return boards;
    } else {
      throw Exception("Error al obtener las fincas asociadas");
    }
  }
}
