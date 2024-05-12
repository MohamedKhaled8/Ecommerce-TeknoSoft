import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/core/utils/formatters/e-formatter.dart';

class UserModel {
  final String? id;
  final String username;
  final String email;
  late final String firstName;
  late final String lastName;
  final String phoneNumber;
  final String password;
  String profilePic;
  UserModel({
    this.id,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.profilePic,
  });

  String get fullName => '$firstName $lastName';

  String get formattedPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUserName(fullName) {
    List<String> nameParts = fullName.split(" ");

    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUserName = "$firstName$lastName";
    String userNameWithPrefix = "cwt_$camelCaseUserName";
    return userNameWithPrefix;
  }

  static UserModel empty() => UserModel(
        username: "",
        email: "",
        phoneNumber: "",
        password: "",
        profilePic: "",
        firstName: "",
        lastName: "",
      );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'profilePic': profilePic,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        username: data['username'] ?? '',
        email: data['email'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        password: data['password'] ?? '',
        profilePic: data['profilePic'] ?? '',
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
      );
    } else {
      throw Exception("Document data is null");
    }
  }
}
