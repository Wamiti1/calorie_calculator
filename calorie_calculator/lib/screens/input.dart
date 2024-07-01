import 'package:flutter/material.dart';
import 'package:calorie_calculator/screens/classes.dart';


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
      body: Form(
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
                ),
                validator: (value) {
                if (value!.isEmpty || int.tryParse(value) == null) {
                    return 'Enter a valid age';
                  }
                  return null;
                },
              ),
            ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text('Gender: $gender '),
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
                maxLength: 2,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your weight',
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
                maxLength: 2,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your height',
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
      
      
      );
  }
}