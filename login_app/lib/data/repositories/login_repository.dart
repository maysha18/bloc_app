import 'package:login_app/data/models/login_model.dart';
import 'package:login_app/data/repositories/api/api.dart';

class AuthRepository {
  API api = API();

  Future<LoginModel> loginUser(Map<String, dynamic> data) async {
    try {
      var response = await api.sendRequest.post(
          data: data,
          "http://sgfabricatordemo.netcarrots.in/SGFabricatorAPI/Service.svc/UserLoginAPI");
      return LoginModel.fromJson(response.data);
    } catch (ex) {
      throw ex;
    }
  }
}
