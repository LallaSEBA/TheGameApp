 import 'dart:convert';
 import 'package:shared_preferences/shared_preferences.dart';
 import 'package:http/http.dart' as http;
import 'package:shaths_app_thegame/models/user.dart';

 class DBManager{
   String url = 'https://maak-app.herokuapp.com/api/user';
   var status;
   static User user;

  loginData(String email, String password) async{
     String myUrl= "$url/login";
     bool isDone;
     try{
     final response = await http.post(myUrl,
            headers: {'Accept':'application/json'},
            body:{'email':email, 'password':password}
            );
      var data = json.decode(response.body);
      status =  data['success'];
      if (status){
        user = User.fromJson(data);
        user.setToken = data['access_token'];
        var user2 = await getData();
        print('data : ${data['access_token']}');
      } else{
        print('data : ${data['error']}');
      }
    }
    catch(e){
      print(e.message());
       status = false;
    }
    return status;
   }
   
  logout() async{
     String myUrl="$url/logout";
     try{
     final response = await http.post(myUrl,
            headers: {'Accept':'application/json',
                      'Authorization' : 'bearer ${user.token}'},
            );
      var data = json.decode(response.body);
      status =  data['success'];
      if (status){
        print('data : ${data['error']}');
      } else{
        print('data : ${data['token']}');
      }
    }
    catch(e){
      print(e.message());
       status = false;
    }
    return status;
   }

  registerData(String email, String password, String c_password) async{
    String myUrl="$url/register";
    final response = await http.post(myUrl,
          headers: {'Accept':'application/json'},
          body:{'email':email, 'password':password, 'c_password':c_password}
          );
    var data = json.decode(response.body);
    status =  data['success'];
    if (status){
      var rspLogin = await loginData(email,  password);
      print('data : ${data['error']} $rspLogin');
    } else{
      print('data : ${data['token']}');
    }
    return status;
  }
 
  upadateData() async{
    String myUrl="$url/me";
    final response = await http.put(myUrl,
          headers: {'Accept':'application/json', 
                    'Authorization' : 'bearer ${user.token}'},
          body:{
              "email": user.email,
              "old_password": user.old_password,
              "new_password": user.new_password,
              "f_name": user.f__name,
              "s_name": user.s__name,
              "t_name": user.t__name,
              "l_name":  user.l__name,
              "governorate": user.governorate,
              "district": user.district,
              "city":  user.city,
              "date_of_birth" : user.date_of_birth,
              "phone": user.phone,
              "gender": user.gender,
              "national_no":  user.national_no
            }
      );

    var data = json.decode(response.body);
    status =  data['success'];
    if (status){
      print('data : ${data['error']}');
    } else{
      print('data : ${data['token']}');
    }
    return status;
   }


    Future<User> getData() async{
     var value = await readToken();
     String myUrl="$url/me" ;

     final response = await http.get(myUrl,
            headers: {
              'Accept':'application/json',
              'Authorization' : 'bearer ${user.token}'
              },            
            );
      //print(json.decode(response.body)["data"]);
      return json.decode(response.body);

   }

    deletetData(int id)async {
     var value = await readToken();
     String myUrl="$url/products/$id";
     final response = http.delete(myUrl,
            headers: {
              'Accept':'application/json',
              'Authorization' : 'Bearer $value'
              },          
            ).then((response){print('status: ${response.statusCode}, body:${response.body}');});
   }

   addData(String name, String price)async {
     var value = await readToken();
     String myUrl="$url/products";
     final response = http.post(myUrl,
            headers: {
              'Accept':'application/json',
              'Authorization' : 'bearer $value'
              }, 
            body:{
              'name':name,
              'price':price
            }         
            ).then((response){print('status: ${response.statusCode}, body:${response.body}');});
   }

    editData(String id, String name, String price)async {
     var value = await readToken();
     String myUrl="$url/products/$id";
     final response = http.put(myUrl,
            headers: {
              'Accept':'application/json',
              'Authorization' : 'Bearer $value'
              }, 
            body:{
              'name':name,
              'price':price
            }         
            ).then((response){print('status: ${response.statusCode}, body:${response.body}');});
   }
   _saveToken(String roken) async{
     final prefs = await SharedPreferences.getInstance();
     final key = 'token';
     final value = user.token;
     prefs.setString(key, value);
   }

   readToken() async{
     final prefs = await SharedPreferences.getInstance();
     final key = 'token';
     final value = prefs.get(key)?? 0;
     return prefs;
   }
 }