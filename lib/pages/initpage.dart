import 'package:flutter/material.dart';

class initpages extends StatelessWidget {
  const initpages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: 
          ListView(scrollDirection: Axis.vertical,padding: const EdgeInsets.all(20),
          children: [
            Card(color: Colors.indigo[900],
              child: 
                Column(
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.directions_car),iconSize: 150),
                    const Text('All vehicles', style: TextStyle(fontSize: 30),)
                  ],
                ),
            ),
            Card(color: Colors.lightGreen,
              child: Column(
                children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.car_repair),iconSize: 150,),
                  const Text('Pending repair', style: TextStyle(fontSize: 30),)
                ],
              ))
          ],
          ),
    );
}
}