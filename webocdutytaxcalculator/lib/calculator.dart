import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class calculator extends StatefulWidget {

  final int tab;
  calculator({Key key, this.tab}) : super(key: key);

  @override
  _calculatorState createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {

  double _profitPercentage = 0;

  final input1 = TextEditingController();
  final input2 = TextEditingController();
  final input3 = TextEditingController();
  final input4 = TextEditingController();
  final input5 = TextEditingController();
  final input6 = TextEditingController();
  final input7 = TextEditingController();
  final input8 = TextEditingController();
  final input9 = TextEditingController();
  final input10 = TextEditingController();
  List<String> hints = ["","","","","","","","","","",""];

  String _total = "0";

  void calculate(){
    var value1Fixed  = input1.text.length == 0 ? 0 : int.parse(input1.text.replaceAll(",", "")); //TOTAL IMPORT VALUE IN PKR
    var value2Fixed  = input2.text.length == 0 ? 0 : int.parse(input2.text.replaceAll(",", "")); //SINDH STAMP DUTY (FIXED)
    var value3Fixed  = input3.text.length == 0 ? 0 : int.parse(input3.text.replaceAll(",", "") ?? 0); //DUTY/TAX/SURCHARGE (FIXED)
    var value4  = input4.text.length == 0 ? 0 : double.parse(input4.text.replaceAll(",", "") ?? 0); //CUSTOM DUTY (CD)
    var value5  = input5.text.length == 0 ? 0 : double.parse(input5.text.replaceAll(",", "") ?? 0); //SALES TAX (ST)
    var value6  = input6.text.length == 0 ? 0 : double.parse(input6.text.replaceAll(",", "") ?? 0); //ADDITIONAL SALES TAX (AddST)
    var value7  = input7.text.length == 0 ? 0 : double.parse(input7.text.replaceAll(",", "") ?? 0); //REGULATORY DUTY (RD)
    var value8  = input8.text.length == 0 ? 0 : double.parse(input8.text.replaceAll(",", "") ?? 0); //FEDERAL EXCISE DUTY (FED)    
    var value9  = input9.text.length == 0 ? 0 : double.parse(input9.text.replaceAll(",", "") ?? 0); //INCOME TAX (IT)
    var value10 = input10.text.length == 0 ? 0 : double.parse(input10.text.replaceAll(",", "") ?? 0); //ADDITIONAL CUSTOM DUTY (AddCD)

    print(value4);

    //4
    var value4Fixed   = (((value1Fixed)/100)*value4);

    //7
    var value7Fixed   = (((value1Fixed)/100)*value7);
    
    //10
    var value10Fixed   = (((value1Fixed)/100)*value10);

    //8
    var value8Fixed   = (((value1Fixed+value4Fixed+value7Fixed)/100)*value8);

    //5
    var value5Fixed   = (((value1Fixed+value4Fixed+value7Fixed+value8Fixed+value10Fixed)/100)*value5);

    //6
    var value6Fixed   = (((value1Fixed+value4Fixed+value7Fixed+value8Fixed+value10Fixed)/100)*value6);

    //9
    var value9Fixed   = (((value1Fixed+value4Fixed+value5Fixed+value6Fixed+value7Fixed+value8Fixed+value10Fixed)/100)*value9);

    setState(() {
      hints[2] = value2Fixed.toStringAsFixed(0).replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
      hints[3] = value3Fixed.toStringAsFixed(0).replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
      hints[4] = value4Fixed.toStringAsFixed(0).replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
      hints[5] = value5Fixed.toStringAsFixed(0).replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
      hints[6] = value6Fixed.toStringAsFixed(0).replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
      hints[7] = value7Fixed.toStringAsFixed(0).replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
      hints[8] = value8Fixed.toStringAsFixed(0).replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
      hints[9] = value9Fixed.toStringAsFixed(0).replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
      hints[10] = value10Fixed.toStringAsFixed(0).replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');

      _total = (value2Fixed+value3Fixed+value4Fixed+value5Fixed+value6Fixed+value7Fixed+value8Fixed+value9Fixed+value10Fixed).toStringAsFixed(0);

    });
  }

  void saveValue(key,value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();    
    print('tab_${widget.tab}_key_$key');
    prefs.setString('tab_${widget.tab}_key_$key', value);
  }

  void showSavedValues() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var savedValue1 = prefs.getString('tab_${widget.tab}_key_1');
    if(savedValue1 != null){input1.text = savedValue1;}
    var savedValue2 = prefs.getString('tab_${widget.tab}_key_2');
    if(savedValue2 != null){input2.text = savedValue2;}
    var savedValue3 = prefs.getString('tab_${widget.tab}_key_3');
    if(savedValue3 != null){input3.text = savedValue3;}
    var savedValue4 = prefs.getString('tab_${widget.tab}_key_4');
    if(savedValue4 != null){input4.text = savedValue4;}
    var savedValue5 = prefs.getString('tab_${widget.tab}_key_5');
    if(savedValue5 != null){input5.text = savedValue5;}
    var savedValue6 = prefs.getString('tab_${widget.tab}_key_6');
    if(savedValue6 != null){input6.text = savedValue6;}
    var savedValue7 = prefs.getString('tab_${widget.tab}_key_7');
    if(savedValue7 != null){input7.text = savedValue7;}
    var savedValue8 = prefs.getString('tab_${widget.tab}_key_8');
    if(savedValue8 != null){input8.text = savedValue8;}
    var savedValue9 = prefs.getString('tab_${widget.tab}_key_9');
    if(savedValue9 != null){input9.text = savedValue9;}
    var savedValue10 = prefs.getString('tab_${widget.tab}_key_10');
    if(savedValue10 != null){input10.text = savedValue10;}
    calculate();
  }

  void clearSavedValues() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('tab_${widget.tab}_key_1',null);
    input1.text = "";
    prefs.setString('tab_${widget.tab}_key_2',null);
    input2.text = "";
    prefs.setString('tab_${widget.tab}_key_3',null);
    input3.text = "";
    prefs.setString('tab_${widget.tab}_key_4',null);
    input4.text = "";
    prefs.setString('tab_${widget.tab}_key_5',null);
    input5.text = "";
    prefs.setString('tab_${widget.tab}_key_6',null);
    input6.text = "";
    prefs.setString('tab_${widget.tab}_key_7',null);
    input7.text = "";
    prefs.setString('tab_${widget.tab}_key_8',null);
    input8.text = "";
    prefs.setString('tab_${widget.tab}_key_9',null);
    input9.text = "";
    prefs.setString('tab_${widget.tab}_key_10',null);
    input10.text = "";
    calculate();
  }

  Widget inputField(label,controller,hint,hintText,double width, isFormatted) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 0, bottom: 0, right: 8, left: 8),
      // margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(label.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
              Spacer(),
              Container(
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
                ),
                width: width,
                child: TextField(
                  controller: controller,
                  inputFormatters: isFormatted ? [CustomTextInputFormatter()] : [],
                  style: TextStyle(fontSize: 13),
                  decoration: new InputDecoration(
                    //isCollapsed: true,            
                    contentPadding: EdgeInsets.all(5),
                    isDense: true,
                    fillColor: Colors.grey,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    hintText: hintText,
                    disabledBorder: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String value){
                    saveValue(hint,value);
                    calculate();
                  },
                ),
              )
            ],
          ),
          (hints[hint] == "") ? Container(height: 0, width: 0,) : Align(
            child: Text("${hints[hint]}/-", style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),),
            alignment: Alignment.centerRight,
          )
        ],
      )
    );
  }

  @override
  void initState() {
    showSavedValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[     
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 8),
                margin: EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xffdddddd),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Total Import Value".toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)
                          ),
                          width: 125,
                          child: TextField(
                            controller: input1,
                            inputFormatters: [CustomTextInputFormatter()],
                            style: TextStyle(fontSize: 13),
                            decoration: new InputDecoration(
                              //isCollapsed: true,            
                              contentPadding: EdgeInsets.all(0),
                              isDense: true,
                              fillColor: Colors.grey,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              hintText: 'Enter Value (PKR)',
                              disabledBorder: InputBorder.none,
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (String value){
                              saveValue(1,value);
                              calculate();
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ),         
              
              Align(
                alignment: Alignment.center,
                child: Text("DUTY & TAXES LEVIABLE (PKR) 👇", style: TextStyle(fontSize: 18, color: Colors.blueGrey, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              ),
              
              SizedBox(height: 5,),
              inputField("Stamp Duty",input2,2,'Fixed (if any)',125,true),
              inputField("Duty/Tax/Surcharge",input3,3,'Fixed (if any)',125,true),
              inputField("Custom Duty (CD)",input4,4,'%',50,false),
              inputField("Sales Tax (ST)",input5,5,'%',50,false),
              inputField("Add Sales Tax (AST)",input6,6,'%',50,false),
              inputField("Regulatory Duty (RD)",input7,7,'%',50,false),
              inputField("Federal Excise Duty (FED)",input8,8,'%',50,false),
              inputField("Income Tax (IT)",input9,9,'%',50,false),
              inputField("Add Custom Duty (ACD)",input10,10,'%',50,false),
                          
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top:2, bottom:2, left:6, right:6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(
                      padding: EdgeInsets.all(0),
                      // color: Colors.redAccent,
                      onPressed: (){
                        clearSavedValues();
                      },
                      child: Text("Clear Values", style: TextStyle(color: Colors.yellow),),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text("TOTAL", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                        // SizedBox(height: 5,),
                        Text("TOTAL= ${_total.replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}/-", style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),),


                      ],
                    ),
                    
                  ],
                )
                
                
                
              ),
              SizedBox(height: 10,),
              

            ],
          ),
        ),
      );
  }
}


class CustomTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      int selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.extentOffset;
      List<String> chars = newValue.text.replaceAll(',', '').split('');
      String newString = '';
      for (int i = 0; i < chars.length; i++) {
        if (i % 3 == 0 && i != 0) newString += ',';
        newString += chars[i];
      }

      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndexFromTheRight,
        ),
      );
    } else {
      return newValue;
    }
  }
}