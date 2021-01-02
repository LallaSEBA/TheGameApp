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
   var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
   String _selectedPhone;
    
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
   Widget decoratedTextField(String hint, double fontSize, {TextInputType type=null, int length=null } ){
     double radius = length!=1 ? 11 : 9;
     return  Container(
       height: 50,
       child: TextField(       
                    textAlign: length!=1 ? TextAlign.left :  TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(fontSize:fontSize),
                    keyboardType: type == null ? TextInputType.text : type,                   
                    maxLength: length == null ? null : length,
                      
                    decoration: InputDecoration(
                      contentPadding: length!=1 ? EdgeInsets.only(top:15.0, left: 6):EdgeInsets.only(top:0, left: 2),
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
                  textAlign: TextAlign.center,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
              Text(
                   "Fill up", 
                    textAlign: TextAlign.left,
                    style:TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    ),
                  ),
              Padding(padding: EdgeInsets.only(top:3)),
              Text(
                   "The Form to continue", 
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    inputTitle ("Full Name"),                     
                    Row(
                      children:<Widget>[
                      Flexible(
                        child: decoratedTextField('First Name',13),
                      ),
                      Padding(padding: EdgeInsets.only(left:10)),                      
                      Flexible(
                        child:  decoratedTextField('Second Name',13)
                      )
                    ]),
                    Padding(padding: EdgeInsets.only(bottom:10)),
                    Row(
                      children:<Widget>[
                      Flexible(
                        child: decoratedTextField('Third Name',13),
                      ),
                      Padding(padding: EdgeInsets.only(left:10)),                      
                      Flexible(
                        child:  decoratedTextField('Fourth Name',13)
                      )
                    ]),
                    Padding(padding: EdgeInsets.only(bottom:40)),                    
                    inputTitle ("National ID"), 
                    Row(
                      children:<Widget>[
                      Flexible(
                        child: Container(height: (MediaQuery.of(context).size.width-27)/10, child: decoratedTextField('', 13,type:TextInputType.number ,length:1)),
                      ),
                      Padding(padding: EdgeInsets.only(left:5)),
                      Flexible(
                        child: Container(height: (MediaQuery.of(context).size.width-27)/10, child: decoratedTextField('', 13,type:TextInputType.number ,length:1)),
                      ),
                      Padding(padding: EdgeInsets.only(left:5)),
                      Flexible(
                        child: Container(height: (MediaQuery.of(context).size.width-27)/10, child: decoratedTextField('', 13,type:TextInputType.number ,length:1)),
                      ),
                      Padding(padding: EdgeInsets.only(left:5)),
                      Flexible(
                        child: Container(height: (MediaQuery.of(context).size.width-27)/10, child: decoratedTextField('', 13,type:TextInputType.number ,length:1)),
                      ),
                      Padding(padding: EdgeInsets.only(left:5)),
                      Flexible(
                        child: Container(height: (MediaQuery.of(context).size.width-27)/10, child: decoratedTextField('', 13,type:TextInputType.number ,length:1)),
                      ),
                      Padding(padding: EdgeInsets.only(left:5)),
                      Flexible(
                        child: Container(height: (MediaQuery.of(context).size.width-27)/10, child: decoratedTextField('', 13,type:TextInputType.number ,length:1)),
                      ),
                      Padding(padding: EdgeInsets.only(left:5)),
                      Flexible(
                        child: Container(height: (MediaQuery.of(context).size.width-27)/10, child: decoratedTextField('', 13,type:TextInputType.number ,length:1)),
                      ),
                      Padding(padding: EdgeInsets.only(left:5)),
                      Flexible(
                        child: Container(height: (MediaQuery.of(context).size.width-27)/10, child: decoratedTextField('', 13,type:TextInputType.number ,length:1)),
                      ),
                      Padding(padding: EdgeInsets.only(left:5)),
                      Flexible(
                        child: Container(height: (MediaQuery.of(context).size.width-27)/10, child: decoratedTextField('', 13,type:TextInputType.number ,length:1)),
                      ),
                      Padding(padding: EdgeInsets.only(left:5)),
                      Flexible(
                        child: Container(height: (MediaQuery.of(context).size.width-27)/10, child: decoratedTextField('', 13,type:TextInputType.number ,length:1)),
                      ),
                      Padding(padding: EdgeInsets.only(left:5)),
                    ]),

                    Padding(padding: EdgeInsets.only(bottom:40)),  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:<Widget>[
                        inputTitle ("Gender"),                                                                        
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
                             child: inputTitle ("Male", fntSize: 16),
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
                            child: inputTitle ("Female", fntSize: 16),
                          ),                             
                          ],
                        ),
                      ]
                    ),
                    
                    Padding(padding: EdgeInsets.only(bottom:40)),  
                    inputTitle ("Date of birthday"), 
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
                                  width: MediaQuery.of(context).size.width/6,
                                  child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                                  hint:  Padding(
                                                    padding: const EdgeInsets.only(left:3.0),
                                                    child: Align(                                              
                                                            alignment: Alignment.centerLeft,
                                                            child: Text(
                                                              "Day",
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
                                                              "Month",
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
                                                              "Year",
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
                    inputTitle ("Number Phone"), 
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
                      Expanded(child: decoratedTextField('', 13, type:TextInputType.number, length: 15))
                    ],),
                    
                    Padding(padding: EdgeInsets.only(bottom:40)),  
                    inputTitle ("Adress"), 
                    decoratedTextField('', 13),
                    Padding(padding: EdgeInsets.only(bottom:40)),  
                    inputTitle ("City"), 
                    decoratedTextField('', 13),
                    Padding(padding: EdgeInsets.only(bottom:40)),  
                    inputTitle ("District"), 
                    decoratedTextField('', 13),
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
                        child: Text(  "Sign Up", 
                              textAlign: TextAlign.center,
                                style:TextStyle(
                                  fontSize: 25,
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
                      Container(
                         // padding: EdgeInsets.only(top:5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          //  mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text( "If you have already an account", 
                              textAlign: TextAlign.left,
                              style:TextStyle(
                                fontSize: 12,
                                color: Colors.grey
                              ),
                            ), 
                            FlatButton(
                              padding: EdgeInsets.only(right:40,left: 0),
                              child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Sign In",
                                style:TextStyle(                                  
                                decoration: TextDecoration.underline,
                                fontSize: 12,
                                color: Colors.grey),
                                textAlign: TextAlign.left
                              ),
                                      ),
                              onPressed: (){}
                            ,)
                        ],),
                      ),
                      IconButton(padding: EdgeInsets.only(right:18,top: 4), icon: Icon(Icons.exit_to_app, size: 55,), onPressed: null)
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