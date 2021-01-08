import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data :ModalRoute.of(context).settings.arguments;
    print(data['isDateTime']);
    print('=======================');

    String bgImage = data['isDateTime'] ? 'skyDay.jpg' : 'night.jpg';
    Color bhColor = data['isDateTime'] ? Colors.blue[200] : Colors.black45;
    bool checkTime=data['isDateTime'];
    return Scaffold(
      backgroundColor: bhColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/'+bgImage),
                fit: BoxFit.cover,
              )
            ),
            child: Column(
        children: <Widget>[
            FlatButton.icon(
              padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
              onPressed: () async {
               dynamic result = await Navigator.pushNamed(context, '/location');
               setState(() {
                 data = {
                   'location':result['location'],
                   'time':result['time'],
                   'isDateTime':result['isDateTime'],
                   'flag':result['flag'],
                 };
               });
              },
              icon: Icon(Icons.edit_location,
                color: checkTime ? Colors.black45:Colors.white10,
              ),
              label: Text('Choose location',
                style: TextStyle(
                color: checkTime ? Colors.black:Colors.white,
              ),
              ),
//                color: Colors.blueAccent,
            ),
            SizedBox(
              height: 30.5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20.5,
                  ),
                  Text(
                    data['location'],
                    style: TextStyle(fontSize: 20.0, letterSpacing: 1.0,
                      color: checkTime ? Colors.black:Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20.5,
                  ),
                  Text(
                    data['time'],
                    style: TextStyle(fontSize: 75.0, letterSpacing: 1.2,
                      color: checkTime ? Colors.black:Colors.white,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
          )),
    );
  }
}
