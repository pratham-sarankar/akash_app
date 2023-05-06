import 'package:akash/app/data/values/constants.dart';
import 'package:akash/app/interfaces/model.dart';
import 'package:intl/intl.dart';

class User extends Model {
  String? _photoUrl;
  String? username;
  String? displayName;
  String? email;
  final bool isEmailVerified;
  String? contactNumber;
  final bool isContactNumberVerified;
  DateTime? _dateOfBirth;
  String? password;

  User({
    this.username,
    this.displayName,
    this.email,
    this.isEmailVerified = false,
    this.contactNumber,
    this.isContactNumberVerified = false,
    this.password,
  });

  //Setter and Getter for dateOfBirth
  String get dateOfBirth => DateFormat('dd-MM-yyyy').format(_dateOfBirth!);

  set dateOfBirth(String? dateOfBirth) {
    if (_dateOfBirth == null) {
      return;
    }
    _dateOfBirth = DateFormat('dd-MM-yyyy').parse(dateOfBirth!);
  }

  //Setter and Getter for photoUrl
  String? get photoKey => _photoUrl;

  set photoKey(String? photoUrl) {
    if (photoUrl == null) {
      return;
    }
    _photoUrl = "$host/users/profile/me/photo/$photoUrl?t=${DateTime.now().millisecondsSinceEpoch}";
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'contactNumber': contactNumber,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    var user = User(
      username: map['username'],
      displayName: map['displayName'],
      email: map['email'],
      isEmailVerified: map['isEmailVerified'],
      contactNumber: map['contactNumber'],
      isContactNumberVerified: map['isContactNumberVerified'],
    );
    user.id = map['id'];
    user.dateOfBirth = map['dateOfBirth'];
    user.photoKey = map['photoKey'];
    return user;
  }

  @override
  String get name => displayName ?? username ?? "Username";

  String get contact => (contactNumber ?? email)!;
}
