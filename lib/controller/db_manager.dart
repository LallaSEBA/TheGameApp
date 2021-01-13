 import 'dart:convert';
 import 'package:shared_preferences/shared_preferences.dart';
 import 'package:http/http.dart' as http;
 import 'package:shaths_app_thegame/models/user.dart';
      
 class DBManager{
   String url = 'https://maak-app.herokuapp.com/api/user';
   var status;
   var rsponseMsg;
   static User user;

  loginData(String email, String password) async{
     String myUrl= "$url/login";     
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
    status = false;
    try{
        final response = await http.post(myUrl,
              headers: {'Accept':'application/json'},
              body:{'email':email, 'password':password, 'c_password':c_password}
              );
        var data = json.decode(response.body);
        status =  data['success'];
        if (status){
          var rspLogin = await loginData(email,  password);
          user.setOldPwd = password;
          user.setNewPwd = password;
          user.setEmail = email;

          print('data : ${data['error']} $rspLogin');
        } else{
          print('data : ${data['token']}');
        }
    }
    catch(e){
      if (e.message.contains('Failed host'))
      rsponseMsg = 'تأكد من اتصالك بالأنترنت';
    else rsponseMsg = e.toString();
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
      _saveToken(user.token, 'user');
      print('data : ${data['token']}');
    } else{
      print('data : ${data['error']}');
    }
    return status;
   }

  getData(String token) async{
    //var value = await readToken();
    String myUrl="$url/me" ;

    final response = await http.get(myUrl,
          headers: {
            'Accept':'application/json',
            'Authorization' : 'bearer $token'
            },            
          );
    var data = json.decode(response.body);
    status =  data['success'];
    var result;
    if (status){
      var result = data['data'];
      print('data : ${data['token']}');
    } else{
      print('data : ${data['error']}');
    }
    return result;
  }
   
   _saveToken(String token, String typeUser) async{
     final prefs = await SharedPreferences.getInstance();
     prefs.setString('token', token);
     prefs.setString('typeUser', typeUser);
   }

  static readToken() async{
     final prefs = await SharedPreferences.getInstance();
     final key = 'token';
     final value = prefs.get(key)?? 0;
     return prefs;
   }
   static isAdminToken() async{
     final prefs = await SharedPreferences.getInstance();
     final key = 'typeUser';
     final value = prefs.get(key)?? 0;
     return prefs=='Admin';
   }
 }     