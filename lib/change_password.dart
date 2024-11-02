
import 'package:flutter/material.dart';

import 'crud.dart';
import 'package:flutter/cupertino.dart';


class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  Crud _crud=Crud();
  TextEditingController passwordControler1 = TextEditingController();
  TextEditingController passwordControler2 = TextEditingController();
  bool varObscureText = true;
  Icon visibilityIcon = Icon(Icons.visibility_off);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(44.0),
        child: CupertinoNavigationBar(

          backgroundColor: Colors.black,
        ),
      ),

      /*  appBar: AppBar(
        backgroundColor: Colors.black,
      ), */
      body: Padding(
        padding: const EdgeInsets.only(left: 20,top: 130),
        child: ListView(

          children: [

            const Center(
              child: Text(
                "Forget Password?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'sans-serif'),
              ),
            ),

            //user name text filed

            textFiledFun('new password', passwordControler1),
            textFiledFun('confirm new passowrd',passwordControler2 ),




            //button sign in number 1
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 4, top: 15, right: 20),
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 37, 125, 211),

                  foregroundColor: Colors.white,

                ),
                onPressed: () async{
                  //var getUsers =await _crud.getUsers("https://dummyjson.com/users");
                  //var getUsers =await _crud.getUsers("https://dummyjson.com/users");
                  var updatePass= await _crud.updatePass("https://dummyjson.com/users/2", {

                    "passwor": "Owais"

                  });

                  if(updatePass == "200"){
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => const AlertDialog(
                            title:  Text("success"),
                            content:  Text("password change successfulyy")));


                  }else{
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => const AlertDialog(
                            title:  Text("Error"),
                            content:  Text("there is error happening")));



                  }},

              child: const Center(
                  child: Text(
                    "Reset Password",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'sans-serif',
                    ),
                  ),
                ),
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


            border: const OutlineInputBorder(),
            hintStyle: const TextStyle(
              color: Colors.white70,
            ),
            hintText: hintmsg),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );


  }

}
