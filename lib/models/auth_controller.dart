import 'package:demo_mobile/models/profile_model.dart';
import 'package:demo_mobile/models/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  UserModel? user = UserModel();
  ProfileModel? profile = ProfileModel();

  final storage = GetStorage();
}
