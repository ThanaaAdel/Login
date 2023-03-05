import 'package:flutter/material.dart';
import 'package:login/model/user.dart';
import 'package:login/pages/login.dart';
import 'package:login/services/user_api.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  final emailController = TextEditingController();
  List<User> users = [];
  @override
  void initState(){
    super.initState();
    fetchUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,  size: 30),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
            },
        ),

        title: Text("Rest Api Call"),

      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final email = user.email;
            final pictureLink = user.pictureLink;
          //  final imageUrl = user[];
            //  final color = user.gender == 'male' ? Colors.blue : Colors.green;


            return ListTile(
              leading: ClipOval(
                child: Image.network(pictureLink),
              ),

              title: Text(user.fullName,style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text(user.email),

            );
          }),

    );
  }

Future<void> fetchUsers() async{
final response = await UserApi.fetchUsers();
setState(() {
  users = response;
});
  }
}