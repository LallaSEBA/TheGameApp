
 import 'dart:convert';
 import 'package:shared_preferences/shared_preferences.dart';
 import 'package:http/http.dart' as http;
 import '../models/user.dart';

 class UserController{
   String url = 'https://maak-app.herokuapp.com/api/user';
   var status;
   static User user;
   var rsponseMsg='';

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
          var status = await getData();
          if (user.id != null)
          {
           _saveToken(user.token, false);
          }
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
    rsponseMsg = '';
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
        /*  user.setOldPwd = password;
          user.setNewPwd = password;
          user.setEmail = email;*/

          print('data : ${data['token']} $rspLogin');
        } else{
          print('data : ${data['error']}');
          
          rsponseMsg = '${data['errors']}';
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
      print('data : ${data['error']}');
    } else{
      print('data : ${data['token']}');
    }
    return status;
   }

  Future getData() async{
    //var value = await readToken();
    String myUrl="$url/me" ;
   try{
      final response = await http.get(myUrl,
            headers: {
              'Accept':'application/json',
              'Authorization' : 'bearer ${user.token}'
              },            
            );
      var data = json.decode(response.body);
      status =  data['success'];
      var result;
      if (status){
        result = data['data'];
        
        user.setId     = result["id"];
        user.setEmail  = result["email"];
        user.setFname  = result["f_name"];
        user.setSname  = result["s_name"];
        user.setTname  = result["t_name"];
        user.setLname  = result["l_name"];
        user.setPhone  = result["phone"];
        user.setGender = result["gender"];
        user.setCity   = result["city"];
        user.setDistrict      = result["district"];
        user.setGovernorate   = result["governorate"];
        user.setDate_of_birth = result["date_of_birth"];
        user.setNational_no   = result["national_no"];
    }  
   }
   catch(e) {
     rsponseMsg = e.message;
     status = false;
   }
   
    return status;
  }
  
   _saveToken(String token, bool isAdmin) async{
     final prefs = await SharedPreferences.getInstance();
     prefs.setString('token', token);
     prefs.setBool('isAdmin', isAdmin);
   }

   static isAdmin() async{
     final prefs = await SharedPreferences.getInstance();
     final key = 'typeUser';
     final value = prefs.get(key)?? 0;
     return prefs=='Admin';
   }
   readToken() async{
     final prefs = await SharedPreferences.getInstance();
     final key = 'token';
     final value = prefs.get(key)?? 0;
     return prefs;
   }
 }