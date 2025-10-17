import '../models/user_model.dart';
import '../services/api_service.dart';

class UserController {
  final ApiService _apiService = ApiService();

  Future<List<User>> fetchUsers() async {
    return await _apiService.getUsers();
  }

  Future<void> createUser(String name, String email) async {
    User newUser = User(id: 0, name: name, email: email);
    await _apiService.addUser(newUser);
  }
}