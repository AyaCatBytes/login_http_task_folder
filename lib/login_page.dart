// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:login_http_task_folder/change_password.dart';
import 'package:login_http_task_folder/signup_page.dart';

import 'crud.dart';

class LoginPage extends StatefulWidget {


  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Crud _crud=Crud();
  TextEditingController userNameControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();



  bool isChecked = false;
  Color buttonColor = Color.fromARGB(255, 211, 27, 14);
  bool varObscureText = true;
  Icon visibilityIcon = Icon(Icons.visibility_off);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      /*  appBar: AppBar(
        backgroundColor: Colors.black,
      ), */
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 50),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //netfliz picture

            Container(
              margin:EdgeInsets.only(right: MediaQuery.of(context).size.width / 1.6) ,

              // color: Colors.green,
              //height: 30,
              //width: 30,4
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.width / 5,
              child: Image.asset("images/thumb-1920-1152301 (1).png",
                fit: BoxFit.cover,),
            ),

            //sign in text

            Text(
              "Sign In ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'sans-serif'),
            ),

            //user name text filed
            //user name text filed

            textFiledFun('Email or UserName', userNameControler),

            //password--textfiled
            textFiledFunPass('Password', passwordControler),
            //button sign in number 1
            SizedBox(height: 15),
            Padding(
              paddinaya g: const EdgeInsets.only(left: 4, top: 15, right: 20),
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: buttonColor,
                  //

                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () async{
                  //var getUsers =await _crud.getUsers("https://dummyjson.com/users");
                  var login= await _crud.Login("https://dummyjson.com/user/login", {
                    "username": userNameControler.text,
                    "password": passwordControler.text,
                  });

                  if(login == "200"){
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                            title:  Text("success"),
                            content:  Text(login)));


                  }else{
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                            title:  Text("Error"),
                            content:  Text(login)));



                  }

                },
                child: Center(
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'sans-serif',
                    ),
                  ),
                ),
              ),
            ),

            //text or
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: Center(
                  child: Text(
                    "OR",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'sans-serif'),
                  ),
                ),
              ),
            ),

            // number 2 button

            Padding(
              padding: const EdgeInsets.only(left: 4, top: 15, right: 20),
              child: FilledButton(
                style: FilledButton.styleFrom(

                  backgroundColor: Color.fromRGBO(79, 76, 76, 0.73),
                  //Color.fromARGB(255, 211, 27, 14),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () async{
                  //var getUsers =await _crud.getUsers("https://dummyjson.com/users");
                  var deleteAct= await _crud.DeleteAcount("https://dummyjson.com/users/1");

                  if(deleteAct == "200"){
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                            title:  Text("success"),
                            content:  Text("account deleted")));


                  }else{
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                            title:  Text("Error"),
                            content:  Text(deleteAct)));



                  }

                },
                child: Center(
                    child: Text(
                      "Delete acount",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'sans-serif',
                      ),
                    )),
              ),
            ),

            //Forget password? text
                                TextButton(
                                style: TextButton.styleFrom(


                        foregroundColor: Colors.white,
                        ),
                                    child: Center(
                                      child: Text(
                                        "Forget password?",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 19,
                                            fontFamily: 'sans-serif'),
                                      ),
                                    ),
                        onPressed: () {


                                  Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ChangePassword()),
                        );}),

            //check box

            Padding(
              padding: const EdgeInsets.only(top: 22, left: 0),
              child: Row(
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)),
                    side: BorderSide(color: Colors.white, width: 1),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Text(
                    "Remember me",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'sans-serif'),
                  ),
                ],
              ),
            ),

            //New to Netflix? Sign up now.
            Row(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.center,
              children: [


                   Text(
                    "New to Netflix? ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: 'sans-serif'),
                  ),


                TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,


                      foregroundColor: Colors.white,
                    ),
                    child:Text(
                        "Sign up now.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'sans-serif'),
                      ),

                    onPressed: () { Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignupPage()),
                    );}),

              ],
            ),

            //This page is protected by Google reCAPTCHA to ensure you're not a bot.Learn more.
            Padding(
              padding: const EdgeInsets.only(top: 18, bottom: 5, right: 30),
              child: Text(
                "This page is protected by Google reCAPTCHA to ensure you're not a bot.Learn more.",
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 10,
                    fontFamily: 'sans-serif'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textFiledFun(String hintmsg,TextEditingController controller){
    return  Padding(
      padding: const EdgeInsets.only(left: 4, top: 35, right: 20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(

            border: OutlineInputBorder(),
            hintStyle: TextStyle(
              color: Colors.white70,
            ),
            hintText: hintmsg),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );


  }

  Widget textFiledFunPass(String hintmsg,TextEditingController controller){
    return  Padding(
      padding: const EdgeInsets.only(left: 4, top: 35, right: 20),
      child: TextFormField(
        obscureText: varObscureText,
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: visibilityIcon,
              onPressed: () {
                setState(() {
                  varObscureText = !varObscureText;
                  visibilityIcon = varObscureText
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility);
                });
              },
            ),

            border: OutlineInputBorder(),
            hintStyle: TextStyle(
              color: Colors.white70,
            ),
            hintText: hintmsg),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );


  }
}
