import 'package:flutter/material.dart';
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

  String _total = "0.00";

  void calculate(){
    var value1Fixed  = input1.text.length == 0 ? 0 : int.parse(input1.text); //TOTAL IMPORT VALUE IN PKR
    var value2Fixed  = input2.text.length == 0 ? 0 : int.parse(input2.text); //SINDH STAMP DUTY (FIXED)
    var value3Fixed  = input3.text.length == 0 ? 0 : int.parse(input3.text ?? 0); //DUTY/TAX/SURCHARGE (FIXED)
    var value4  = input4.text.length == 0 ? 0 : int.parse(input4.text ?? 0); //CUSTOM DUTY (CD)
    var value5  = input5.text.length == 0 ? 0 : int.parse(input5.text ?? 0); //SALES TAX (ST)
    var value6  = input6.text.length == 0 ? 0 : int.parse(input6.text ?? 0); //ADDITIONAL SALES TAX (AddST)
    var value7  = input7.text.length == 0 ? 0 : int.parse(input7.text ?? 0); //REGULATORY DUTY (RD)
    var value8  = input8.text.length == 0 ? 0 : int.parse(input8.text ?? 0); //FEDERAL EXCISE DUTY (FED)    
    var value9  = input9.text.length == 0 ? 0 : int.parse(input9.text ?? 0); //INCOME TAX (IT)
    var value10 = input10.text.length == 0 ? 0 : int.parse(input10.text ?? 0); //ADDITIONAL CUSTOM DUTY (AddCD)

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
      hints[4] = "Amount Leviable in PKR: ${value4Fixed.toStringAsFixed(2)}";
      hints[5] = "Amount Leviable in PKR: ${value5Fixed.toStringAsFixed(2)}";
      hints[6] = "Amount Leviable in PKR: ${value6Fixed.toStringAsFixed(2)}";
      hints[7] = "Amount Leviable in PKR: ${value7Fixed.toStringAsFixed(2)}";
      hints[8] = "Amount Leviable in PKR: ${value8Fixed.toStringAsFixed(2)}";
      hints[9] = "Amount Leviable in PKR: ${value9Fixed.toStringAsFixed(2)}";
      hints[10] = "Amount Leviable in PKR: ${value10Fixed.toStringAsFixed(2)}";

      _total = (value2Fixed+value3Fixed+value4Fixed+value5Fixed+value6Fixed+value7Fixed+value8Fixed+value9Fixed+value10Fixed).toStringAsFixed(2);

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

  Widget inputField(label,controller,hint,suffix) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xffeeeeee),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 18),
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.all(0),
          fillColor: Colors.grey,
          labelText: label,
          prefixIcon: Icon(Icons.calculate_outlined),
          suffixIcon: Container(margin: EdgeInsets.only(top:12), padding: EdgeInsets.all(5),child: Text(suffix, style: TextStyle(color: Colors.grey),),),
          suffixStyle: TextStyle(color: Colors.grey),
          helperText: (hints[hint] == "") ? null : hints[hint],
          helperStyle: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        keyboardType: TextInputType.number,
        onChanged: (String value){
          saveValue(hint,value);
          calculate();
        },
      ),
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
          padding: EdgeInsets.all(15),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[              
              inputField("Total Import Value (In PKR)",input1,1,"Fixed Value"),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Leviable Duties:", style: TextStyle(fontSize: 14, color: Colors.blueGrey),textAlign: TextAlign.left,),
              ),
              SizedBox(height: 5,),
              inputField("Sindh Stamp Duty",input2,2,"Fixed Value"),
              inputField("Duty/Tax/Surcharge",input3,3,"Fixed Value"),
              inputField("Custom Duty (CD)",input4,4,"Percentage (%)"),
              inputField("Sales Tax (ST)",input5,5,"Percentage (%)"),
              inputField("Additional Sales Tax (AddST)",input6,6,"Percentage (%)"),
              inputField("Regulatory Duty (RD)",input7,7,"Percentage (%)"),
              inputField("Federal Excise Duty (FED)",input8,8,"Percentage (%)"),
              inputField("Income Tax (IT)",input9,9,"Percentage (%)"),
              inputField("Additional Custom Duty (AddCD)",input10,10,"Percentage (%)"),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Total in PAK Rupee:", style: TextStyle(fontSize: 14, color: Colors.blueGrey),textAlign: TextAlign.left,),
              ),              
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey,
                ),
                child:  Text(_total, style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10,),
              RaisedButton(
                color: Colors.redAccent,
                onPressed: (){
                  return // flutter defined function
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        // return object of type Dialog
                        return AlertDialog(
                          content: new Text("Clear values ?"),
                          actions: <Widget>[
                            new FlatButton(
                              child: new Text("Back"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            new FlatButton(
                              child: new Text("Yes"),
                              onPressed: () {
                                clearSavedValues();
                                Navigator.of(context).pop();
                              },
                            ),
                            
                          ],
                        );
                      },
                    );

                },
                child: Text("Clear Values", style: TextStyle(color: Colors.white),),
              )

            ],
          ),
        ),
      );
  }
}