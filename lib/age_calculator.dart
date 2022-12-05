import 'package:flutter/material.dart';



class AgeCalculator extends StatefulWidget {
  const AgeCalculator({Key? key}) : super(key: key);

  @override
  State<AgeCalculator> createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  var formKey = GlobalKey<FormState> ();

  var yearCtrl = TextEditingController();
  var monthCtrl = TextEditingController();
  var dayCtrl = TextEditingController();

  var inputYear,inputMonth,inputDay;
  var year = 0;
  var month = 0;
  var day = 0;

  static final DateTime now = DateTime.now();
  var current_year = now.year.toInt();
  var current_month = now.month.toInt();
  var current_day = now.day.toInt();



  void handleSubmit(){
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      // do something.....
      setState((){

        // age = 2022-int.parse("1995");
        if(current_day<int.parse(inputDay)){
          current_day= current_day+30;
          current_month = current_month -1;
        }
        if(current_month<int.parse(inputMonth)){
          current_month = current_month+12;
          current_year = current_year-1;
        }

        day = current_day-int.parse(inputDay);
        month = current_month-int.parse(inputMonth);
        year = current_year-int.parse(inputYear);

      });


    }
  }

  void handleReset(){
    yearCtrl.clear();
    monthCtrl.clear();
    dayCtrl.clear();

    setState(() {
      year = 0;
      month = 0;
      day = 0;
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Age Calculator"),),
      body: ListView(
        children:  [
          Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: yearCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      // prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        labelText: "Birth Year"
                    ),
                    validator: (value){
                      if(value!.length==0)  return ("Year is required");
                    },
                    onSaved: (value){
                      this.inputYear = value;
                    },

                  ),

                  SizedBox(height: 20,),

                  TextFormField(
                    controller: monthCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      //prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        labelText: "Birth Month"
                    ),
                    validator: (value){
                      if(value!.length==0)  return ("Month is required");
                    },
                    onSaved: (value){
                      this.inputMonth = value;
                    },

                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: dayCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      // prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        labelText: "Day"
                    ),
                    validator: (value){
                      if(value!.length==0)  return ("Day is required");
                    },
                    onSaved: (value){
                      this.inputDay = value;
                    },

                  ),
                  const SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton( child: Text("Calculate"),
                          onPressed: handleSubmit),


                      SizedBox(width: 10,),

                      ElevatedButton( child: Text("Reset"),
                          onPressed: handleReset),
                    ],
                  ),
                  SizedBox(height: 30,),

                  Text("Your age is: "+year.toString()+" Year, "+month.toString()+" Month, "+day.toString()+" days",style: TextStyle(fontSize: 25,),)
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
