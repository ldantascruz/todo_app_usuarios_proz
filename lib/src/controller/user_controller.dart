import 'package:todo_app/src/repository/user_repository.dart';
import 'package:todo_app/src/model/user_model.dart';

class UserController {
  final IUserRepository userRepository;

  UserController(this.userRepository);

  Future<void> createUser(UserModel user) async {
    try {
      await userRepository.createUser(user);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getAllUsers() async {
    try {
      final result = userRepository.getAllUsers();      
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
