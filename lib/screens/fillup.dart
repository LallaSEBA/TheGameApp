import "package:flutter/material.dart";
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../controller/const.dart';
import '../controller/countries.dart';
import '../controller/db_manager.dart';
import 'package:intl/intl.dart';

class Fillup extends StatefulWidget{
  @override
  _FillupState createState() => new _FillupState();
}

class _FillupState extends State<Fillup>{
   var genderMale = null;
   List<DropdownMenuItem<String>> drpDayItem  = new List<DropdownMenuItem<String>>();
   List<DropdownMenuItem<String>> drpMthItem  = new List<DropdownMenuItem<String>>();
   List<DropdownMenuItem<String>> drpYearItem = new List<DropdownMenuItem<String>>();
   List<DropdownMenuItem<String>> drpPhoneItem = new List<DropdownMenuItem<String>>();
   
   String _selectedDay;
   String _selectedMth;
   String _selectedYear;
   var months = ["جانفي", "فيفري", "مارس", "أفريل", "ماي", "جوان", "جويلية", "أوت", "سبتمبر", "أكتوبر", "نوفمبر", "ديسمبر"];
   String _selectedPhone;
   
  var db = DBManager();

   var _fName = TextEditingController();
   var _sName = TextEditingController();
   var _tName = TextEditingController();
   var _rName = TextEditingController();
   var _phone = TextEditingController();
   var _mantika = TextEditingController();
   var _liwa    = TextEditingController();
   var _mohafadha = TextEditingController();

   var _id1  = TextEditingController();
   var _id2  = TextEditingController();
   var _id3  = TextEditingController();
   var _id4  = TextEditingController();
   var _id5  = TextEditingController();
   var _id6  = TextEditingController();
   var _id7  = TextEditingController();
   var _id8  = TextEditingController();
   var _id9  = TextEditingController();
   var _id10 = TextEditingController();
   String natioalNo = '';
   
   register() async{
     natioalNo = "${_id1.text.trim()}${_id2.text.trim()}${_id3.text.trim()}${_id4.text.trim()}${_id5.text.trim()}${_id6.text.trim()}${_id7.text.trim()}"+
                 "${_id8.text.trim()}${_id9.text.trim()}${_id10.text.trim()}";
      DBManager.user.setFname = _fName.text;
      DBManager.user.setSname = _sName.text;
      DBManager.user.setTname = _tName.text;
      DBManager.user.setLname = _rName.text;           
      DBManager.user.setNational_no = natioalNo;       
       
      var sdate = "$_selectedMth/$_selectedDay/$_selectedYear";  
      try
      {
      var inputFormat = DateFormat('dd/MM/yyyy');
      var inputDate = inputFormat.parse(sdate); 

      var outputFormat = DateFormat('dd/MM/yyyy');
      var outputDate = outputFormat.format(inputDate); 
        //DateTime dt = DateTime.parse(sdate);
      DBManager.user.setDate_of_birth = outputDate;

      }catch( e){print(e);}

      genderMale==1 ? DBManager.user.setGender ='ذكر' : DBManager.user.setGender = 'أنثى';

      DBManager.user.setPhone       = '$_selectedPhone${_phone.text}';
      DBManager.user.setGovernorate = _mohafadha.text;
      DBManager.user.setDistrict    = _liwa.text;
      DBManager.user.setCity        = _mantika.text;
      var response = await db.upadateData();
      if (response) Navigator.of(context).pushReplacementNamed('/done');
   }

   addDayItem(){
     var mth;
     var nbDay;
     var is_29;
     if( _selectedMth!= null)
     mth = int.tryParse(_selectedMth);
     else mth = 1;

     if (_selectedYear!= null)
     is_29 = (int.tryParse(_selectedYear)%4)==0;
     else is_29 = false; 

     if(mth==2) nbDay = is_29 ? 29 : 28;
     else nbDay = (mth<=7 && mth.isOdd) || (mth>=8 && mth.isEven) ? 31 : 30;
    drpDayItem.clear();
    for(var i = 1; i<=nbDay; i++){
      drpDayItem.add(new DropdownMenuItem(
          value: "$i",
          child : Container(
            padding: EdgeInsets.only(left:6),
            child:new Text("$i",  style: TextStyle(fontSize :14),)
          )
        ));
    }
    if(_selectedDay!=null)
    _selectedDay = int.tryParse(_selectedDay)>nbDay ? '$nbDay' : _selectedDay;
   }

   initState() {
    addDayItem();
    for(var i = 1; i<=12; i++){
      drpMthItem.add(new DropdownMenuItem(
          value: "$i",
          child:Container(
            padding: EdgeInsets.only(left:6),
            child: new Text(months[i-1], style: TextStyle(fontSize :14),),
          )
      ));
    }

    for(var i = 1950; i<=DateTime.now().year; i++){
      drpYearItem.add(new DropdownMenuItem(
          value: "$i",
          child: Container(
            padding: EdgeInsets.only(left:6),
            child: new Text("$i", style: TextStyle(fontSize :14),))
      ));
    }
   addPhoneNumber();
    super.initState();
   }

  _chagedDay(String day){
    setState(() {
      _selectedDay = day;
    });
  }
  _chagedMth(String mth){
    setState(() {
      _selectedMth = mth;
      addDayItem();
    });
  }
  _chagedYear(String year){
    setState(() {
      _selectedYear = year;
      addDayItem();
    });
}
void _chagednbPhone(String number){
    setState(() {
      _selectedPhone = number;
    });
}
addPhoneNumber(){
  countries.forEach((item){
    drpPhoneItem.add(
      new DropdownMenuItem(
          value: item['dial_code'],
          child:Container(
            padding: EdgeInsets.only(left:0),
            child: new Text(item['dial_code'], style: TextStyle(fontSize :14), textAlign: TextAlign.left,),
          )
    ));
    });
  
}
   Widget decoratedTextField(String hint, double fontSize, TextEditingController controller,  {TextAlign align=TextAlign.center,TextInputType type=null, int length=null } ){
     double radius = length!=1 ? 11 : 9;
     return  Container(       
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: cGreyL,
            blurRadius:7,
            offset: const Offset(3, 5),
          ),
        ],
      ),
       height: 50,
       child: TextField(    
                    controller : controller,  
                    textAlign: align,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(fontSize:fontSize, color: cBlack),
                    keyboardType: type == null ? TextInputType.text : type,                   
                    maxLength: length == null ? null : length,
                    
                      
                    decoration: InputDecoration(
                      contentPadding: length!=1 ? EdgeInsets.only(top:17.0, right: 6):EdgeInsets.only(top:0, left: 2),
                      filled: true,
                      fillColor: cGreyF,
                      hintText: hint,
                      counterText: '',
                      hintStyle: TextStyle(fontSize:13, color:cGreyT ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:cGreyB),
                        borderRadius:BorderRadius.circular(radius),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:cGreyB),
                        borderRadius:BorderRadius.circular(radius),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:cGreyB),
                        borderRadius:BorderRadius.circular(radius),
                      )
                    ),
                  ),
     );
   }
   Widget inputTitle(String text, {double fntSize=null}){
     return Padding(
       padding: const EdgeInsets.only(bottom:10.0),
       child: Text( 
                  text, 
                  textAlign: TextAlign.right,
                    style:TextStyle(
                      color: cBlack,
                      fontSize: fntSize==null? 20 : fntSize,
                      fontWeight: FontWeight.bold
                    ),
                  ),
     );
   }
   comboBox(String txt, double wdth, String selectedVal, List<DropdownMenuItem<String>> itemVal, dynamic charged){
     return  Material(
                shadowColor: cGreyL,
                color: cGreyF,
                borderRadius: BorderRadius.all(Radius.circular(11.0)),
                elevation: 5,
                child: Container(
                    padding: const EdgeInsets.only(left:3.0),
                  width: wdth,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(iconEnabledColor: cBlack,
                                    hint:  Align(                                              
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              txt,
                                              style: TextStyle(color: cGreyT, fontSize: 14),
                                            )),
                                    value: selectedVal,
                                    items: itemVal, 
                                    onChanged: charged   
                              ),
                  ),
                ),
              );
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                      Container(height:1550,
                       decoration: new BoxDecoration(image: DecorationImage(image: AssetImage("assets/image/u7.JPG"), fit: BoxFit.fill)),
                      ),
                  Padding(padding: const EdgeInsets.only(top:110, left:20, right: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children:<Widget>[
                        Container(
                          height: 45,
                          padding: EdgeInsets.only(left:3),
                          child: Text(
                               "املأ", 
                                textAlign: TextAlign.left,
                              
                                style:TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: cWhite,
                                ),
                              ),
                        ),
                        //Padding(padding: EdgeInsets.only(top:3)),
                        Container(
                          child: Text(
                              "المستند للاستمرار", 
                              textAlign: TextAlign.left,
                              style:TextStyle(
                                  fontSize: 18,
                                  color: cWhite
                              ),
                              ),
                        ),
                        Padding(padding: EdgeInsets.only(top:80)),
                        inputTitle (" اسمك الكامل"),                     
                        Row(
                          children:<Widget>[
                          Flexible(
                            child: decoratedTextField('الاسم الثاني', 13,_sName, align: TextAlign.right),
                          ),
                          Padding(padding: EdgeInsets.only(left:10)),     
                          Flexible(
                            child: decoratedTextField('الاسم الأول', 13, _fName, align:TextAlign.right),
                          )                                           
                        ]),

                        Padding(padding: EdgeInsets.only(bottom:10)),
                        Row(
                          children:<Widget>[                     
                          Flexible(
                            child: decoratedTextField('الاسم الرابع', 13, _rName, align: TextAlign.right),
                          ),
                          Padding(padding: EdgeInsets.only(left:10)), 
                          Flexible(
                            child: decoratedTextField('الاسم الثالث', 13,_tName, align:TextAlign.right),
                          )
                        ]),
                        Padding(padding: EdgeInsets.only(bottom:40)),                    
                        inputTitle ("الرقم الوطني"), 
                        Row(
                          children:<Widget>[
                          Flexible(
                            child: Container(height: (MediaQuery.of(context).size.width-27)/10, child: decoratedTextField('', 13,_id1, type:TextInputType.number ,length:1)),
                          ),
                          Padding(padding: EdgeInsets.only(left:5)),
                          Flexible(
                            child: Container(height: (MediaQuery.of(context).size.width-27)/10, child: decoratedTextField('', 13,_id2, type:TextInputType.number ,length:1)),
                          ),
                          Padding(padding: EdgeInsets.only(left:5)),
                          Flexible(
                            child: Container(height: (MediaQuery.of(context).size.width-27)/10, child: decoratedTextField('', 13, _id3, type:TextInputType.number ,length:1)),
                          ),
                          Padding(padding: EdgeInsets.only(left:5)),
                          Flexible(
                            child: Container(height: (MediaQuery.of(context).size.width-27)/10, child: decoratedTextField('', 13, _id4, type:TextInputType.number ,length:1)),
                          ),
                          Padding(padding: EdgeInsets.only(left:5)),
                          Flexible(
                            child: Container(height: (MediaQuery.of(context).size.width-27)/10, child: decoratedTextField('', 13, _id5, type:TextInputType.number ,length:1)),
                          ),
                          Padding(padding: EdgeInsets.only(left:5)),
                          Flexible(
                            child: Container(height: (MediaQuery.of(context).size.width-27)/10, child: decoratedTextField('', 13, _id6, type:TextInputType.number ,length:1)),
                          ),
                          Padding(padding: EdgeInsets.only(left:5)),
                          Flexible(
                            child: Container(height: (MediaQuery.of(context).size.width-27)/10, child: decoratedTextField('', 13, _id7, type:TextInputType.number ,length:1)),
                          ),
                          Padding(padding: EdgeInsets.only(left:5)),
                          Flexible(
                            child: Container(height: (MediaQuery.of(context).size.width-27)/10, child: decoratedTextField('', 13, _id8, type:TextInputType.number ,length:1)),
                          ),
                          Padding(padding: EdgeInsets.only(left:5)),
                          Flexible(
                            child: Container(height: (MediaQuery.of(context).size.width-27)/10, child: decoratedTextField('', 13,  _id9, type:TextInputType.number ,length:1)),
                          ),
                          Padding(padding: EdgeInsets.only(left:5)),
                          Flexible(
                            child: Container(height: (MediaQuery.of(context).size.width-27)/10, child: decoratedTextField('', 13, _id10, type:TextInputType.number ,length:1)),
                          ),
                          Padding(padding: EdgeInsets.only(left:5)),
                        ]),

                        Padding(padding: EdgeInsets.only(bottom:40)),  
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:<Widget>[                                                                       
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 35,
                                  height: 35,
                                  child: IconButton(alignment:Alignment.center, padding: EdgeInsets.only(right:1.5), 
                                                   icon: Icon( MdiIcons.genderMale, size: 24, 
                                                   color:genderMale == 1 && genderMale != null ?  cGreen: cWhite),
                                           onPressed: (){setState(() {genderMale=1;});},),
                                  decoration:BoxDecoration(
                                      color: genderMale == 1 && genderMale != null ?  cWhite: cGreen,
                                      border: new Border.all(
                                          width: 1.25,
                                          color:  cGreen),
                                      borderRadius: const BorderRadius.all(const Radius.circular(100)),                                      
                                      boxShadow: [
                                        BoxShadow(
                                          color: cGreen,
                                          blurRadius:5,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                  )
                                ),
                                Padding(
                                 padding: const EdgeInsets.only(top:5, left:8.0),
                                 child: inputTitle ("ذكر", fntSize: 16),
                                ),                             
                              ],
                            ),                  
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 35,
                                  height: 35,
                                  child: IconButton(alignment:Alignment.center, padding: EdgeInsets.only(right:1.5), 
                                                    icon: Icon( MdiIcons.genderFemale, size: 24,                  
                                                    color:genderMale == 0 && genderMale != null ?  cPinck: cWhite),
                                           onPressed: (){setState(() {genderMale=0;});},),
                                  decoration:BoxDecoration(
                                      color: genderMale == 0 && genderMale != null  ? cWhite : cPinck,
                                      border: new Border.all(
                                          width: 1.25,
                                          color:  cPinck),
                                      borderRadius: const BorderRadius.all(const Radius.circular(100)), 
                                      boxShadow: [
                                        BoxShadow(
                                          color: cPinck,
                                          blurRadius:5,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                  )
                                ),
                              Padding(
                                padding: const EdgeInsets.only(top:5, left:8.0),
                                child: inputTitle ("أنثى", fntSize: 16),
                              ),                             
                              ],
                            ),
                            
                            inputTitle ("الجنس"), 
                          ]
                        ),
                        
                        Padding(padding: EdgeInsets.only(bottom:40)),  
                        inputTitle ("تاريخ الميلاد"), 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[                            
                               comboBox( "اليوم", MediaQuery.of(context).size.width*1.22/6, _selectedDay,drpDayItem,_chagedDay),                           
                               comboBox( "الشهر", MediaQuery.of(context).size.width*2/6, _selectedMth,drpMthItem,_chagedMth),   
                               comboBox("السنة", MediaQuery.of(context).size.width*1.5/6,_selectedYear,drpYearItem,_chagedYear),   
                          ],
                        ),
                        
                        Padding(padding: EdgeInsets.only(bottom:40)),  
                        inputTitle ("رقم الهاتف"), 
                         Row(
                            mainAxisAlignment : MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                           
                             Stack(
                               children: <Widget>[
                                 Material(
                                   color: cGreyF,
                                   borderRadius: BorderRadius.all(Radius.circular(11.0)),
                                   elevation: 5,
                                   shadowColor: cGreyL,
                                   child: Container(
                                           padding: EdgeInsets.only(left:25),
                                           child: DropdownButtonHideUnderline(
                                                 child: DropdownButton(
                                                         //  isExpanded: true,
                                                           iconSize: 0,
                                                           value: _selectedPhone,
                                                           items: drpPhoneItem, 
                                                           onChanged: _chagednbPhone
                                                     ),
                                           ),
                                         ),
                                 ),
                                  Container(
                                    margin: EdgeInsets.only(top: 13.0),
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      color: cBlack,
                                      size: 24.0,
                                    ),),
                               ],
                             ),
                           
                          Padding(padding: EdgeInsets.only(left:8)),  
                          Expanded(child: decoratedTextField('', 13, _phone, type:TextInputType.number, length: 15, align: TextAlign.left))
                        ],),
                        
                        Padding(padding: EdgeInsets.only(bottom:40)),  
                        inputTitle ("منطقة"), 
                        decoratedTextField('', 13, _mantika, align: TextAlign.right),
                        Padding(padding: EdgeInsets.only(bottom:40)),  
                        inputTitle ("المحافظة"), 
                        decoratedTextField('', 13, _mohafadha, align: TextAlign.right),
                        Padding(padding: EdgeInsets.only(bottom:40)),  
                        inputTitle ("اللواء"), 
                        decoratedTextField('', 13, _liwa, align: TextAlign.right),
                        Padding(padding: EdgeInsets.only(bottom:40)),  
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                            color: cBlue,
                            padding: EdgeInsets.only(top:2, bottom: 2),
                            elevation: 0,
                           /* shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                              side:BorderSide(color: Color.fromRGBO(174, 174, 174, 1),)
                            ),*/
                            child: Text(  "تسجيل", 
                                  textAlign: TextAlign.center,
                                    style:TextStyle(
                                      fontSize: 22,
                                      color:cWhite,
                                    ),
                                  ),
                            onPressed:() => register()
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom:40)),  
                         Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                         IconButton(padding: EdgeInsets.only(right:1,top: 0), icon:Container(child: Image.asset("assets/image/exit2.png" ,fit: BoxFit.fitHeight,),width: 120,height: 90,), onPressed: null),
                        
                          Container(
                              child: Column(
                              children: <Widget>[
                                Text( "هل لديك حساب؟", 
                                  textAlign: TextAlign.right,
                                  style:TextStyle(
                                    fontSize: 14,
                                    color: cGreyT,
                                  ),
                                ), 
                                FlatButton(
                                  child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "تسجيل الدخول",
                                    style:TextStyle(                                  
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    color: cBlue),
                                    textAlign: TextAlign.right
                                  ),
                                          ),
                                  onPressed: (){}
                                ,)
                            ],),
                          ),
                         ],
                         ),
                        //Padding(padding: EdgeInsets.only(top:60))          
                      ]
                    ),
            ),
                ],
              ),
          ),
      );
  }


}