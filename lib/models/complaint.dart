class Complaint {
  int _id, _employee_id;
  String _subject;
  String _details;
  String _type;
  String _section;
  String _user_email;

  Complaint(this._id , this._employee_id , this._details , this._section , this._subject , this._type , this._user_email);

  String get subject => _subject;
  String get details => _details;
  String get type => _type;
  String get section => _section;
  String get user_email => _user_email;
  int get id => _id;
  int get employee_id => _employee_id;
}
