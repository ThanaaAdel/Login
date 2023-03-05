import 'package:login/model/userdop.dart';
import 'package:login/model/userlocation.dart';
import 'package:login/model/username.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final userName name;
  final String pictureLink;

   // final UserDob dob;
   // final UserLocation location;
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.pictureLink,
    // required this.dob,
    // required this.location,


  });
  String get fullName{
    return '${name.title} ${name.first} ${name.last}';
}

}
