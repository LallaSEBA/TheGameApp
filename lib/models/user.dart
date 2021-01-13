class User{
  String _token;
  int    _id;
  String _f_Name;
  String _s_Name;
  String _t_Name;
  String _l_Name;
  
  String _email;
  String _governorate;
  String _district;
  String _city;
  String _date_of_birth;
  String _phone;
  String _gender;
  String _national_no;
  String _created_at;
  String _updateded_at;
  String _old_password;
  String _new_password;

  
  User(this._email, this._f_Name, this._s_Name, this._t_Name, this._l_Name, this._governorate, this._district, this._city, 
       this._date_of_birth, this._phone, this._gender, this._national_no, this._created_at, this._updateded_at);

  
  String get token         => _token;
  int    get id            => _id;
  String get f__name       => _f_Name;
  String get s__name       => _s_Name;
  String get t__name       =>_t_Name;
  String get l__name       =>_l_Name;  
  String get email         =>_email;
  String get governorate   =>_governorate;
  String get district      =>_district;
  String get city          => _city;
  String get date_of_birth => _date_of_birth;
  String get phone         => _phone;
  String get gender        => _gender;
  String get national_no   => _national_no;
  String get old_password   => _old_password;
  String get new_password   => _new_password;

  
  set setToken(String token)             => _token = token;
  set setId(int id)                      => _id = id;
  set setFname(String fName)             => _f_Name = fName;
  set setSname(String sName)             => _s_Name = sName;
  set setTname(String tName)             => _t_Name = tName;
  set setLname(String lName)             => _l_Name = lName;  
  set setEmail(String email)             => _email = email;
  set setGovernorate(String governorate) => _governorate = governorate;
  set setDistrict(String district)       => _district = district;
  set setCity(String city)               => _city = city;
  set setDate_of_birth(String dateBirth) => _date_of_birth = dateBirth;
  set setPhone(String phone)             => _phone = phone;
  set setGender(String gender)           => _gender = gender;
  set setNational_no(String nationalNo)  => _national_no = nationalNo;
  set setOldPwd(String old_password)     => _old_password = old_password;
  set setNewPwd(String new_password)     => _new_password = new_password;

  User.fromJson(Map<String, dynamic> map){
   _id     = map["id"];
   _email  = map["email"];
   _f_Name = map["f_name"];
   _s_Name = map["s_name"];
   _t_Name = map["t_name"];
   _l_Name = map["l_name"];
   _phone  = map["phone"];
   _gender = map["gender"];
   _city   = map["city"];
   _district      = map["district"];
   _governorate   = map["governorate"];
   _date_of_birth = map["date_of_birth"];
   _national_no   = map["national_no"];
   _created_at    = map["created_at"];
   _updateded_at  = map["updateded_at"];
 }
  
 
  Map<String, dynamic> toMap(){
    Map map = Map<String, dynamic>();
   map["email"]  = _email ;
   map["f_name"] = _f_Name;
   map["s_name"] = _s_Name;
   map["t_name"] = _t_Name;
   map["l_name"] = _l_Name;
   map["phone"]  = _phone ;
   map["gender"] = _gender;
   map["city"]   = _city;

   map["district"]      = _district     ; 
   map["governorate"]   = _governorate  ; 
   map["date_of_birth"] = _date_of_birth; 
   map["national_no"]   = _national_no  ; 
   map["old_password"]  = _old_password ; 
   map["new_password"]  = _new_password ; 

   return map;
 }
}