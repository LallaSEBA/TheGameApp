import "package:flutter/material.dart";
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'countries.dart';


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

   var _fName = TextEditingController();
   var _sName = TextEditingController();
   var _tName = TextEditingController();
   var _rName = TextEditingController();
   var _phone = TextEditingController();
   var _adress = TextEditingController();
   var _liwa   = TextEditingController();
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
       height: 50,
       child: TextField(    
                    controller : controller,  
                    textAlign: align,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(fontSize:fontSize),
                    keyboardType: type == null ? TextInputType.text : type,                   
                    maxLength: length == null ? null : length,
                    
                      
                    decoration: InputDecoration(
                      contentPadding: length!=1 ? EdgeInsets.only(top:15.0, right: 6):EdgeInsets.only(top:0, left: 2),
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: hint,
                      counterText: '',
                      hintStyle: TextStyle(fontSize:13),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Colors.grey[200]),
                        borderRadius:BorderRadius.circular(radius),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Colors.grey[200]),
                        borderRadius:BorderRadius.circular(radius),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Colors.grey[200]),
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
                      fontSize: fntSize==null? 20 : fntSize,
                      fontWeight: FontWeight.bold
                    ),
                  ),
     );
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,        
        backgroundColor: Colors.white,
        
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:20, right: 20, bottom: 30),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children:<Widget>[
              Text(
                   "املأ", 
                    textAlign: TextAlign.left,
                    style:TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    ),
                  ),
              Padding(padding: EdgeInsets.only(top:3)),
              Text(
                   "المستند للاستمرار", 
                    textAlign: TextAlign.left,
                   style:TextStyle(
                      fontSize: 18,
                   ),
                  ),
              Padding(padding: EdgeInsets.only(top:10)),
              Expanded(
                  child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top:40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                    inputTitle (" اسمك الكامل"),                     
                    Row(
                      children:<Widget>[
                      Flexible(
                        child: decoratedTextField('الاسم الأول', 13, _fName, align:TextAlign.right),
                      ),
                      Padding(padding: EdgeInsets.only(left:10)),                      
                      Flexible(
                        child: decoratedTextField('الاسم الثاني', 13,_sName, align: TextAlign.right),
                      )
                    ]),
                    Padding(padding: EdgeInsets.only(bottom:10)),
                    Row(
                      children:<Widget>[
                      Flexible(
                        child: decoratedTextField('الاسم الثالث', 13,_tName, align:TextAlign.right),
                      ),
                      Padding(padding: EdgeInsets.only(left:10)),                      
                      Flexible(
                        child: decoratedTextField('الاسم الرابع', 13, _rName, align: TextAlign.right),
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
                              child: IconButton(alignment:Alignment.center, padding: EdgeInsets.only(right:1.5), icon: Icon( MdiIcons.genderMale, size: 24, color:Colors.grey.shade600),
                                       onPressed: (){setState(() {genderMale=1;});},),
                              decoration:BoxDecoration(
                                  color: genderMale == 1 && genderMale != null ?  Colors.grey[300] : Colors.white,
                                  border: new Border.all(
                                      width: 1.25,
                                      color:  Colors.grey[300]),
                                  borderRadius: const BorderRadius.all(const Radius.circular(100))
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
                              child: IconButton(alignment:Alignment.center, padding: EdgeInsets.only(right:1.5), icon: Icon( MdiIcons.genderFemale, size: 24, color:Colors.grey.shade600),
                                       onPressed: (){setState(() {genderMale=0;});},),
                              decoration:BoxDecoration(
                                  color: genderMale == 0 && genderMale != null  ? Colors.grey[300] : Colors.white,
                                  border: new Border.all(
                                      width: 1.25,
                                      color:  Colors.grey[300]),
                                  borderRadius: const BorderRadius.all(const Radius.circular(100))
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
                        DecoratedBox(
                          decoration: ShapeDecoration(
                          color: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1.0, style: BorderStyle.solid, color: Colors.grey[200]),
                            borderRadius: BorderRadius.all(Radius.circular(11.0)),
                          ),
                          ),
                          child: Container(
                                  width: MediaQuery.of(context).size.width/6+5,
                                  child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                                  hint:  Padding(
                                                    padding: const EdgeInsets.only(left:3.0),
                                                    child: Align(                                              
                                                            alignment: Alignment.centerLeft,
                                                            child: Text(
                                                              "اليوم",
                                                              style: TextStyle(color: Colors.grey, fontSize: 14),
                                                            )),
                                                  ),
                                                  value: _selectedDay,
                                                  items: drpDayItem, 
                                                  onChanged: _chagedDay
                                            ),
                                  ),
                                )
                       ),
                       
                        DecoratedBox(
                          decoration: ShapeDecoration(
                          color: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1.0, style: BorderStyle.solid, color: Colors.grey[200]),
                            borderRadius: BorderRadius.all(Radius.circular(11.0)),
                          ),
                          ),
                          child: Container(
                                  width: MediaQuery.of(context).size.width*2/6,
                                  child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                                  hint:  Padding(
                                                    padding: const EdgeInsets.only(left:3.0),
                                                    child: Align(                                              
                                                            alignment: Alignment.centerLeft,
                                                            child: Text(
                                                              "الشهر",
                                                              style: TextStyle(color: Colors.grey, fontSize: 14),
                                                            )),
                                                  ),
                                                  value: _selectedMth,
                                                  items: drpMthItem, 
                                                  onChanged: _chagedMth
                                            ),
                                  ),
                                )
                        ),
                        DecoratedBox(
                          decoration: ShapeDecoration(
                          color: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1.0, style: BorderStyle.solid, color: Colors.grey[200]),
                            borderRadius: BorderRadius.all(Radius.circular(11.0)),
                          ),
                          ),
                          child: Container(
                                  width: MediaQuery.of(context).size.width*2/6,
                                  child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                                  hint:  Padding(
                                                    padding: const EdgeInsets.only(left:3.0),
                                                    child: Align(                                              
                                                            alignment: Alignment.centerLeft,
                                                            child: Text(
                                                              "السنة",
                                                              style: TextStyle(color: Colors.grey, fontSize: 14),
                                                            )),
                                                  ),
                                                  value: _selectedYear,
                                                  items: drpYearItem, 
                                                  onChanged: _chagedYear
                                            ),
                                  ),
                                )
                        ),
                      ],
                    ),
                    
                    Padding(padding: EdgeInsets.only(bottom:40)),  
                    inputTitle ("رقم الهاتف"), 
                     Row(
                        mainAxisAlignment : MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                       
                         Stack(
                           children: <Widget>[
                             DecoratedBox(
                              decoration: ShapeDecoration(
                              color: Colors.grey[200],
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1.0, style: BorderStyle.solid, color: Colors.grey[200]),
                                borderRadius: BorderRadius.all(Radius.circular(11.0)),
                              ),
                              ),
                              child: Container(
                                      padding: EdgeInsets.only(left:25),
                                      child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                                    //  isExpanded: true,
                                                      iconSize: 0,
                                                      hint:  Padding(
                                                        padding: const EdgeInsets.only(left:3.0),
                                                        child: Align(                                              
                                                                alignment: Alignment.centerLeft,
                                                                child: Text(
                                                                  "",
                                                                  style: TextStyle(color: Colors.grey, fontSize: 14),
                                                                )),
                                                      ),
                                                      value: _selectedPhone,
                                                      items: drpPhoneItem, 
                                                      onChanged: _chagednbPhone
                                                ),
                                      ),
                                    )
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 13.0),
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.grey.shade800,
                                  size: 24.0,
                                ),),
                           ],
                         ),
                       
                      Padding(padding: EdgeInsets.only(left:8)),  
                      Expanded(child: decoratedTextField('', 13, _phone, type:TextInputType.number, length: 15))
                    ],),
                    
                    Padding(padding: EdgeInsets.only(bottom:40)),  
                    inputTitle ("العنوان"), 
                    decoratedTextField('', 13, _adress),
                    Padding(padding: EdgeInsets.only(bottom:40)),  
                    inputTitle ("المحافظة"), 
                    decoratedTextField('', 13, _mohafadha),
                    Padding(padding: EdgeInsets.only(bottom:40)),  
                    inputTitle ("اللواء"), 
                    decoratedTextField('', 13, _liwa),
                    Padding(padding: EdgeInsets.only(bottom:40)),  
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        color: Color.fromRGBO(174, 174, 174, 1),
                        padding: EdgeInsets.only(top:2, bottom: 2),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side:BorderSide(color: Color.fromRGBO(174, 174, 174, 1),)
                        ),
                        child: Text(  "تسجيل", 
                              textAlign: TextAlign.center,
                                style:TextStyle(
                                  fontSize: 22,
                                  color: Color.fromRGBO(137, 137, 137, 1),
                                ),
                              ),
                        onPressed: (){},
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom:40)),  
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                      Transform.rotate(
                          angle: 180 * 3.14 / 180, 
                          child: IconButton(padding: EdgeInsets.only(right:18,top: 0), icon: Icon(Icons.exit_to_app, size: 55,), onPressed: null),
                      ),
                      Container(
                          child: Column(
                          children: <Widget>[
                            Text( "هل لديك حساب", 
                              textAlign: TextAlign.right,
                              style:TextStyle(
                                fontSize: 12,
                                color: Colors.grey
                              ),
                            ), 
                            FlatButton(
                              child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "تسجيل الدخول",
                                style:TextStyle(                                  
                                decoration: TextDecoration.underline,
                                fontSize: 12,
                                color: Colors.grey),
                                textAlign: TextAlign.right
                              ),
                                      ),
                              onPressed: (){}
                            ,)
                        ],),
                      ),
                     ],
                   )
                  ],)
                ),
              ),            
            ]
          ),
      ),
      );
  }


}