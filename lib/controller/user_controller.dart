import 'package:get/get.dart';
import 'package:flutter_base_project/model/user_model.dart';
import 'package:flutter_base_project/services/base_api_services.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var userList = <User>[].obs;
  final BaseApiService apiService;
  UserController(this.apiService);


  void fetchUsers() async {
    isLoading(true);
    try {
      final response = await apiService.getRequest('/users');
      if (response.status.hasError) {
        Get.snackbar('Error', 'Failed to fetch users');
      } else {
        final List<dynamic> data = response.body;
        userList.value = data.map((e) => User.fromJson(e)).toList();
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
