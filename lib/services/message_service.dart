import 'package:condo_app/config/constants/api_routes.dart';
import 'package:condo_app/models/models.dart';
import 'package:condo_app/providers/user_provider.dart';
import 'package:condo_app/providers/providers.dart';
import 'package:dio/dio.dart';

class MessageService {
  final dio = Dio(
    BaseOptions(baseUrl: ApiRoute.BASE_URL),
  );

  Future<List<Message>> getRecivedMessages(ref) async {
    final Person user = ref.read(userProvider);
    final String condomioId = ref.read(condominioId);

    final response =
        await dio.get("${ApiRoute.MESSAGE_RECIVED}${user.id}/$condomioId",
            options: Options(
              headers: {"Authorization": user.token},
            ));

    if (response.statusCode == 200 && response.data["Result"] != null) {
      List<Message> messages = [];

      response.data["Result"].forEach((v) {
        messages.add(Message.fromJson(v));
      });

      return messages;
    } else {
      throw Exception("Error al obtener los mensajes");
    }
  }

  Future<List<Message>> getSentMessages(ref) async {
    final Person user = ref.read(userProvider);
    final String condomioId = ref.read(condominioId);

    final response =
        await dio.get("${ApiRoute.MESSAGE_SENT}${user.id}/$condomioId",
            options: Options(
              headers: {"Authorization": user.token},
            ));

    if (response.statusCode == 200 && response.data["Result"] != null) {
      List<Message> messages = [];

      response.data["Result"].forEach((v) {
        messages.add(Message.fromJson(v));
      });

      return messages;
    } else {
      throw Exception("Error al obtener los mensajes");
    }
  }
}
