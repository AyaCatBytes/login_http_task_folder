import 'package:flutter/material.dart';

import 'crud.dart';
import 'package:flutter/cupertino.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  Crud _crud=Crud();
  TextEditingController firstNameControler = TextEditingController();
  TextEditingController LastNameControler = TextEditingController();
  TextEditingController ageControler = TextEditingController();

  bool varObscureText = true;
  Icon visibilityIcon = Icon(Icons.visibility_off);

  bool isChecked = false;
  Color buttonColor = Color.fromARGB(255, 211, 27, 14);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(44.0),
        child: CupertinoNavigationBar(

          backgroundColor: Colors.black,
        ),
      ),


      body: Padding(
        padding: const EdgeInsets.only(left: 20,top: 58),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //netfliz picture


            //sign in text

            Center(
              child: Text(
                "Sign Up ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'sans-serif'),
              ),
            ),

            //user name text filed

            textFiledFun('First name', firstNameControler),
            textFiledFun('Last name', LastNameControler),
            textFiledFun2('Email'),
            textFiledFun('Age', ageControler),
            textFiledFun2('Password'),
            textFiledFun2('Confirm password'),



            //button sign in number 1
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 4, top: 15, right: 20),
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
                    var signup = await _crud.signUp("https://dummyjson.com/users/add", {
                                  "firstName": firstNameControler.text,
                                  "lastName": LastNameControler.text,
                                  "age": ageControler.text


                                  }
                                  );

                    if(signup == "201"){
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                              title:  Text("success"),
                              content:  Text("register complet")));



                    }else {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) =>
                              AlertDialog(
                                  title: Text("Error"),
                                  content: Text(signup)));
                    }



                    },
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'sans-serif',
                    ),
                  ),
                ),
              ),
            ),



            //check box

            Padding(
              padding: const EdgeInsets.only(top: 16, left: 0),
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

            //This page is protected by Google reCAPTCHA to ensure you're not a bot.Learn more.
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5, right: 30),
              child: Text(
                "This page is protected by Google reCAPTCHA to ensure you're not a bot.Learn more.",
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
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
      padding: const EdgeInsets.only(left: 4, top: 20, right: 20),
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
  Widget textFiledFun2(String hintmsg){
    return  Padding(
      padding: const EdgeInsets.only(left: 4, top: 20, right: 20),
      child: TextFormField(

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
}
