import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login/model/userdop.dart';
import 'package:login/model/userlocation.dart';
import 'package:login/model/username.dart';
import 'package:login/model/user.dart';
class UserApi{
   static Future<List<User>> fetchUsers() async{
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json =jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e)  {
      final name = userName
        (
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last'],
      );
      // final date = e['dop']['date'];
      // final dob = UserDob(
      //     date: DateTime.parse(date),
      //     age: e['dop']['age']);
      // final coordinates = LocationCoordinate(
      //   latitude: e['location']['coordinates']['latitude'],
      //   longitude: e['location']['coordinates']['longitude'],);
      // final street = LocationStreet(
      //     name: e['location']['street']['name'],
      //     nuber: e['location']['street']['number']);
      // final timezone= LocationTimezoneCordinates(
      //     description: e['location']['timezone']['description'],
      //     offset:     e['location']['timezone']['offset'],
      // );
      // final location = UserLocation(
      //     cite: e['location']['cite'],
      //     country: e['location']['country'],
      //     postcode: e['location']['postcode'].toString(),
      //     coordinates: coordinates,
      //     street: street,
      //   timezone:timezone,
      // );

      return User(
        cell:e['cell'],
        email:e['email'],
        gender:e['gender'],
        nat:e['nat'],
        phone:e['phone'],
        name:name,
        pictureLink: e['picture']['thumbnail'],
        // dob: dob,
        // location: location,

      );
    }).toList();
return users;
  }
}

