import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/qr.dart';

import 'config/endpoints.dart';
import 'view.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({required this.list, required this.index});
  String selectedValue = 'Option 1';
  List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {
  // late TextEditingController selectedValue;
  late TextEditingController controller_qrInfo;
  late TextEditingController controllerselectedValue1;
  late TextEditingController controllerselectedValue2;
  String? _qrInfo = 'Scan a QR Code';
  // void knit1() {
  //   var url = "http://10.0.1.197/f/knit.php";
  //   http.post(url as Uri, body: {
  //     "id": widget.list[widget.index]['id'],
  //     "hole": selectedValue,
  //     "roleid": _qrInfo,
  //     "niddle": selectedValue1,
  //     "countmix": selectedValue2,
  //   });
  // }
  Future editData() async {
    var url = Uri.http(BASE_URL, '/f/editdata.php');
    print(selectedValue);
    var response = await http.post(url, body: {
      // "id": widget.list[widget.index]['id'],
      "hole": selectedValue,
      "roleid": _qrInfo,
      "niddle": selectedValue1,
      "countmix": selectedValue2,
    });

    // if (data == "Error") {
    //   Fluttertoast.showToast(
    //     backgroundColor: Colors.orange,
    //     textColor: Colors.white,
    //     msg: 'User already exist!',
    //     toastLength: Toast.LENGTH_SHORT,
    //   );
    // } else {
    //   Fluttertoast.showToast(
    //     backgroundColor: Colors.green,
    //     textColor: Colors.white,
    //     msg: 'Registration Successful',
    //     toastLength: Toast.LENGTH_SHORT,
    //   );
    //   Navigator.push(context,
    //     MaterialPageRoute(
    //       builder: (context) => Home(),
    //     ),
    //   );
    // }
  }

  @override
  void initState() {
    // selectedValue =
    //     new TextEditingController(text: widget.list[widget.index]['hole']);
    controller_qrInfo =
        new TextEditingController(text: widget.list[widget.index]['roleid']);
    controllerselectedValue1 =
        new TextEditingController(text: widget.list[widget.index]['niddle']);
    controllerselectedValue2 =
        new TextEditingController(text: widget.list[widget.index]['countmix']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDIT DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                // new TextField(
                //   controller: selectedValue,
                //   decoration: new InputDecoration(
                //       hintText: "Item Code", labelText: "Item Code"),
                // ),
                // new TextField(
                //   controller: controller_qrInfo,
                //   decoration: new InputDecoration(
                //       hintText: "Item Name", labelText: "Item Name"),
                // ),
                // new TextField(
                //   controller: controllerselectedValue1,
                //   decoration: new InputDecoration(
                //       hintText: "Price", labelText: "Price"),
                // ),
                // new TextField(
                //   controller: controllerselectedValue2,
                //   decoration: new InputDecoration(
                //       hintText: "Stock", labelText: "Stock"),
                // ),
                DropdownButton<String>(
                  value: selectedValue,
                  isExpanded: true,
                  onChanged: (newVal) {
                    setState(() {
                      selectedValue = newVal!;
                    });
                  },
                  items: dropdownItems
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                            fontSize: 18, color: Colors.pinkAccent),
                      ),
                    );
                  }).toList(),
                ),
                GestureDetector(
                  onTap: () {
                    editData();
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 53,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 4,
                              color: Colors.black12.withOpacity(.2),
                              offset: const Offset(2, 2))
                        ],
                        borderRadius: BorderRadius.circular(100)
                            .copyWith(bottomRight: const Radius.circular(0)),
                        gradient: LinearGradient(colors: [
                          Colors.purple.shade600,
                          Colors.amber.shade900
                        ])),
                    child: Text('Save',
                        style: TextStyle(
                            color: Colors.white.withOpacity(.8),
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                ),

                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new ElevatedButton(
                  child: new Text("EDIT DATA"),
                  // color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    // Navigator.of(context).push(new MaterialPageRoute(
                    //     builder: (BuildContext context) => new Homei()));
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
