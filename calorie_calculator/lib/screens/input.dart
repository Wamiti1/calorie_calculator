import 'package:flutter/material.dart';
import 'package:calorie_calculator/screens/results.dart';


class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<Input>
   createState() => _InputState();
}


class _InputState extends State<Input> {


  
  final formKey = GlobalKey<FormState>();
  var ageController = TextEditingController();
  var weight = TextEditingController();
  var height = TextEditingController();
  double initial = 0.0;
  var male = 'male';
  var female = 'female';
  String? gender;
  


  String determiner (initial){
    if (initial == 0){
      return 'Normal';
    }
    else if (initial == 1){
      return 'High';
    }
    else{
      return 'Extreme';
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Calorie counter'),),
      ),
      body: ListView(
        children: [Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: ageController,
                  maxLength: 2,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your age',
                    hintText: 'In years',
                  ),
                  validator: (value) {
                  if (value!.isEmpty || int.tryParse(value) == null) {
                      return 'Enter a valid age';
                    }
                    return null;
                  },),
              ),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text('Gender: $gender'),
                  Radio(
                    value: male,
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = (value!).toString();
                      });
                    },
                  ),
                  const Text('Male'),
                  Radio(
                    value: female,
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = (value!).toString();
                      });
                    },
                  ),
                  const Text('Female'),
                ],
              ),
        
        
        
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: weight,
                  maxLength: 5,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your weight',
                    hintText: 'In kg',
                  ),
                  validator: (value) {
                  if (value!.isEmpty || double.tryParse(value) == null) {
                      return 'Enter a valid number';
                    }
                    return null;
                  },
                ),
              ),
        
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: height,
                  maxLength: 5,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your height',
                    hintText: 'In cm',
                  ),
                  validator: (value) {
                  if (value!.isEmpty || double.tryParse(value) == null) {
                      return 'Enter a valid number';
                    }
                    return null;
                  },
                ),
              ),
        
              Text(
                'Activity level : ${determiner(initial)}', textAlign: TextAlign.start,
                
              ),
        
             Slider(
              divisions: 2,
              min: 0.0,
              max: 2.0,
              value: initial, 
              onChanged: (value){
                setState(() {
                  initial = value;
                });
              }),
        
        
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(25.0),
          child: OutlinedButton(
            style: ButtonStyle
            (backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
            foregroundColor: WidgetStateProperty.all(Colors.white),
            overlayColor: WidgetStateProperty.all(Colors.limeAccent),
            surfaceTintColor: WidgetStateProperty.all(Colors.orange),
            elevation: WidgetStateProperty.all(10.0),
            padding: WidgetStateProperty.all(const EdgeInsets.all(2.0)),
            minimumSize: WidgetStateProperty.all(const Size(20.0, 50.0))
            
            ),
            onPressed: (){
              var isValid = formKey.currentState!.validate();
              if  (isValid){
                Map <String, dynamic> results = {
                  'Age': int.parse(ageController.text),
                  'Gender': gender,
                  'Weight': double.parse(weight.text),
                  'Height': double.parse(height.text),
                  'Activity level': determiner(initial)
                };
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> Results(results: results,)));
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill all the fields')));
              }



            },
            child: const Center(child: Text('Calculate caloric need')) ),
        )


      ]),
      
      
      );
  }
}