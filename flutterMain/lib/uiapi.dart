import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class uiApi extends StatefulWidget {
  @override
  _uiApiState createState() => _uiApiState();
}

class _uiApiState extends State<uiApi> {
  final String url = 'http://10.0.2.2:8000/api/transaction';

  Future getTransaction() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title:  Padding(
          padding: const EdgeInsets.only(left: 110),
          child: Text('SHOP'),
        ),
      ),
      body: FutureBuilder(
          future: getTransaction(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data['data'].length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 180,
                      child: Card(
                        elevation: 5,
                        child: Row(children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0)
                            ),
                            height: 120,
                            width: 120,
                            child: Image.network(
                              snapshot.data['data'][index]['image'],
                              fit: BoxFit.cover),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(snapshot.data['data'][index]['title'],
                                    style:TextStyle(
                                      fontSize: 20.0, 
                                      fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(snapshot.data['data'][index]['description'])),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.mode_edit),
                                      Text(snapshot.data['data'][index]["price"].toString()),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                        ),
                      ),
                    );
                  });
            } else {
              return Text('Data Not Found');
            }
          }),
    );
  }
}
