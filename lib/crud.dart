import 'dart:convert';
import 'package:http/http.dart' as http;

class Crud{

  //this one for testing
  Future getUsers(String url) async{

    try {
      http.Response r = await http.get(
          Uri.parse(url));


      if (r.statusCode == 200) {
        var result = jsonDecode(r.body);
        print(result);
        return (result);
      } else {
        return ("code error ");
      }
    }catch(e){
      print("error: $e");
    }

    }



    //create opration

  Future signUp(String url,Map body) async{

    try {
      http.Response r = await http.post(
          Uri.parse(url),
        body: body
      );


      if (r.statusCode == 201) {
        var result = jsonEncode(r.body);
        print(result);
        return ("201");
      } else {
        return (" ${r.statusCode}code error ");
      }
    }catch(e){
      print("error: $e");
    }

  }

  //read opration

  Future Login(String url,Map body) async{

    try {
      http.Response r = await http.post(
          Uri.parse(url),
          body: body
      );


      if (r.statusCode == 200) {
        var result = jsonEncode(r.body);
        print(result);
        return ("200");
      } else {
        return (" ${r.statusCode}code error ");
      }
    }catch(e){
      print("error: $e");
    }

  }


  //update opration

  Future updatePass(String url,Map body) async{

    try {
      http.Response r = await http.put(
          Uri.parse(url),
          body: body
      );


      if (r.statusCode == 200) {
        var result = jsonEncode(r.body);
        print(result);
        return ("200");
      } else {
        return (" ${r.statusCode}code error ");
      }
    }catch(e){
      print("error: $e");
    }

  }

  //delete opration



  Future DeleteAcount(String url) async{

    try {
      http.Response r = await http.delete(
          Uri.parse(url));


      if (r.statusCode == 200) {
        var result = jsonEncode(r.body);
        print(result);
        return ("200");
      } else {
        return (" ${r.statusCode}code error ");
      }
    }catch(e){
      print("error: $e");
    }

  }
  }







