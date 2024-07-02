import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final Map<String, dynamic> results;
  const Results({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Center(child: Text('Results'),),
      ),
      
      body: ListView(
        children:  [
          Column(
            children: [
              ResultsTable(results: results,)
            ],
          )
        ],),
      
      
      );

  }
}

class ResultsTable extends StatelessWidget {
   ResultsTable({super.key, required this.results});
  final Map<String, dynamic> results;

  @override
  Widget build(BuildContext context) {
    return DataTable(
    headingRowColor: const WidgetStatePropertyAll(Colors.limeAccent),
      columns: const [
        DataColumn(label: Text('Parameters', style: TextStyle(color: Colors.black),)),
        DataColumn(label: Text('Values',style: TextStyle(color: Colors.black),))
        ], 
      rows: generated);
  }

  late final generated =  List.generate(results.length, (index){
  return DataRow(

    color: const WidgetStatePropertyAll( Colors.blueGrey),
    cells: [
      DataCell(Text(results.entries.toList()[index].key)),
      DataCell(Text(results.entries.toList()[index].value.toString())),
      
    ],
  );
});
}

