import 'package:flutter/material.dart';
import 'package:flutter_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url:'Asia/Colombo',location: 'Colombo',flag: 'SriLanka.jpg'),
    WorldTime(url:'Europe/London',location: 'London',flag: 'uk.png'),
    WorldTime(url:'Asia/Tokyo',location: 'Tokyo',flag: 'Tokyo.png'),
    WorldTime(url:'Australia/Hobart',location: 'Hobart',flag: 'Australia.png'),
    WorldTime(url:'Pacific/Norfolk',location: 'Norfolk',flag: 'Norfolk.png'),
    WorldTime(url:'Antarctica/Davis',location: 'Davis',flag: 'uk.png'),
    WorldTime(url:'America/Yakutat',location: 'Yakutat',flag: 'Yakutat.png'),
  ];

  void updateTime(index)async{
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDateTime':instance.isDateTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
      ),
      body:
      ListView.builder(
          itemCount: locations.length,
          itemBuilder:(context,index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 5.0),
              child:
              Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title:Text( locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('asset/'+locations[index].flag),
                  ),
                  subtitle:Text(locations[index].url) ,
                ),
              ),
            );
          },
      ),
    );
  }
}
