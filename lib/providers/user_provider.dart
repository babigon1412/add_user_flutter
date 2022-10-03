import 'package:add_user_flutter/models/leader_model.dart';
import 'package:add_user_flutter/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  List<UserModel> users = [
    UserModel(
      firstName: 'General1',
      lastName: 'Name',
      age: '25',
      email: 'General1@gmail.com',
      password: '123456789',
      position: 'Normal',
    ),
    UserModel(
      firstName: 'General2',
      lastName: 'Name',
      age: '25',
      email: 'General2@gmail.com',
      password: '123456789',
      position: 'Normal',
    ),
    UserModel(
      firstName: 'General3',
      lastName: 'Name',
      age: '25',
      email: 'General3@gmail.com',
      password: '123456789',
      position: 'Normal',
    ),
    UserModel(
      firstName: 'General4',
      lastName: 'Name',
      age: '25',
      email: 'General4@gmail.com',
      password: '123456789',
      position: 'Normal',
    ),
    UserModel(
      firstName: 'General5',
      lastName: 'Name',
      age: '25',
      email: 'General5@gmail.com',
      password: '123456789',
      position: 'Normal',
    ),
    UserModel(
      firstName: 'General6',
      lastName: 'Name',
      age: '25',
      email: 'General6@gmail.com',
      password: '123456789',
      position: 'Normal',
    ),
    UserModel(
      firstName: 'General7',
      lastName: 'Name',
      age: '25',
      email: 'General7@gmail.com',
      password: '123456789',
      position: 'Normal',
    ),
  ];
  List<LeaderModel> leaders = [
    LeaderModel(
      firstName: 'Leader1',
      lastName: 'Name',
      age: '25',
      email: 'Leader1@gmail.com',
      password: '123456789',
      position: 'Leader',
    ),
    LeaderModel(
      firstName: 'Leader2',
      lastName: 'Name',
      age: '25',
      email: 'Leader2@gmail.com',
      password: '123456789',
      position: 'Leader',
    ),
    LeaderModel(
      firstName: 'Leader3',
      lastName: 'Name',
      age: '25',
      email: 'Leader3@gmail.com',
      password: '123456789',
      position: 'Leader',
    ),
    LeaderModel(
      firstName: 'Leader4',
      lastName: 'Name',
      age: '25',
      email: 'Leader4@gmail.com',
      password: '123456789',
      position: 'Leader',
    ),
  ];

  List<UserModel> getUserList() => users;
  List<LeaderModel> getLeaderList() => leaders;

  void addUser(UserModel value) {
    users.insert(0, value);
    notifyListeners();
  }

  void addLeader(LeaderModel value) {
    leaders.insert(0, value);
    notifyListeners();
  }

  void removeUser(String firstName, String lastName) {
    for (int i = 0; i < users.length; i++) {
      if (users[i].firstName == firstName && users[i].lastName == lastName) {
        users.removeAt(i);
        break;
      }
    }

    for (int i = 0; i < leaders.length; i++) {
      if (leaders[i].firstName == firstName &&
          leaders[i].lastName == lastName) {
        leaders.removeAt(i);
        break;
      }
    }

    notifyListeners();
  }

  void reducePosition(int index) {
    var userGeneral = UserModel(
      firstName: leaders[index].firstName,
      lastName: leaders[index].lastName,
      age: leaders[index].age,
      email: leaders[index].email,
      password: leaders[index].password,
      position: 'Normal',
    );

    users.insert(0, userGeneral);

    leaders.removeAt(index);

    notifyListeners();
  }

  void promotionUser(int index) {
    var userLeader = LeaderModel(
      firstName: users[index].firstName,
      lastName: users[index].lastName,
      age: users[index].age,
      email: users[index].email,
      password: users[index].password,
      position: 'Leader',
    );

    leaders.insert(0, userLeader);

    users.removeAt(index);

    notifyListeners();
  }
}
