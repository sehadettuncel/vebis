import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vebis_app/widgets/Api.dart';


import 'package:vebis_app/widgets/BuildActivityCard.dart';
import 'package:vebis_app/widgets/BuildAppBar.dart';


class Classroom extends StatefulWidget {
  final String class_name;
  final String class_id;

  const Classroom({
    Key key,
    this.class_name, this.class_id,
  }) : super(key: key);

  @override
  _ClassroomState createState() => _ClassroomState();
}

class _ClassroomState extends State<Classroom> {
    final api = new Api();
  var response;
  @override
  void initState() {
    super.initState();
    get();
  }

  get() async {
    api.get('/get-classroom-and-activities/${widget.class_id}').then((res) async {
      setState(() {
        response = jsonDecode(res.body);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BuildAppBar(widget.class_name),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: response != null ? response["activities"].length : 0,
                  itemBuilder:(context, index){
                    return BuildActivityCard(activity_name:response["activities"][index]["name"], activity_id:response["activities"][index]["id"], class_id:widget.class_id) ;
                  },
                ),
          ],
            ),
          ),
        ),
      ),
    );
  }
}
