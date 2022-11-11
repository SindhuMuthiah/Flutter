import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/main.dart';

class readdata extends StatefulWidget {
  const readdata({super.key});

  @override
  State<readdata> createState() => _readdataState();
}

class _readdataState extends State<readdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Database"),
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('touristplaces').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          }
          return DataTable(
            columns: [
              DataColumn(label: Text("Name")),
              DataColumn(label: Text("Place")),
              //DataColumn(label: Text("docu-id")),
            ],
            rows: buildDatas(context, snapshot.data!.docs),
          );
        },
      ),
    );
  }

  List<DataRow> buildDatas(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    return snapshot.map((data) {
      Map record = (data.data() as Map);
      record['docu-id'] = data.id;
      return DataRow(
          onSelectChanged: (value) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FormPage(Record: record)));
          },
          onLongPress: () {
            data.reference.delete();
          },
          cells: [
            DataCell(Text(record["Studentname"])),
            DataCell(Text(record["place"])),
            //DataCell(Text(record["docu-id"])),
          ]);
    }).toList();
  }
}
