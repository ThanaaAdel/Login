
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/pages/foretpassword.dart';
import 'package:login/pages/home.dart';
import 'package:login/shared/colors.dart';
import 'package:login/shared/contants.dart';
import 'package:login/shared/snakbar.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisable = true;
  bool isLoading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  signIn() async{
    setState(() {

      isLoading = true;
    });
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERROR :  ${e.code} ");
    }}
  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          // backgroundColor:  Colors.black,
          backgroundColor: const Color.fromARGB(255,247, 247, 247),
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
              SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    const Text(
                      "Log in",
                      style: TextStyle(fontSize: 33, fontFamily: "myfont"),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    SvgPicture.asset(
                      "assets/images/girl-2696947__340.jpg",
                      width: 288,
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    TextFormField(

                        validator: (email) {
                          return email!.contains(
                              RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                              ? null
                              : "Enter a valid email";
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        decoration: decorationTextfield.copyWith(
                            hintText: "Enter Your Email : ",
                            suffixIcon: const Icon(Icons.email)
                        )),
                    const SizedBox(
                      height: 33,
                    ),
                    TextField(

                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: isVisable ? true : false,
                        decoration: decorationTextfield.copyWith(
                            hintText: "Enter Your Password : ",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisable = !isVisable;
                                  });
                                },
                                icon: isVisable
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off)))),
                    const SizedBox(
                      height: 33,
                    ),
                    ElevatedButton(
                      onPressed: () async{
                        await signIn();
                        if (!mounted) return;
                        showSnackBar(context, "successfully sign-in ☺");


                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.purple),
                        padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : const Text(
                        "Log In",
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                    const SizedBox(height: 22,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Do You Forget Password ?  ",style: TextStyle(fontSize: 15),),
                        TextButton(  onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgetPassword(),
                            ),
                          );
                        }, child:const Text('Click Here',
                            style: TextStyle(color: Colors.black,fontSize: 15)),)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),),
    );
  }
}
