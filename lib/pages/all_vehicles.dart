import 'package:control_autos/class.dart';
import 'package:control_autos/pages/services_vehicl.dart';
import 'package:control_autos/pages/add_vheicles.dart';
import 'package:flutter/material.dart';

class allVehicles extends StatefulWidget {
  const allVehicles({Key? key}) : super(key: key);

  @override
  State<allVehicles> createState() => _allVehiclesState();
}

class _allVehiclesState extends State<allVehicles> {
  late List<vehicle> vehicles;
  @override
  void initState() {
    vehicles = [
      vehicle('Ford', 'Focus', 'SLE', '2006', 'JNAB656DADSAJBDAH6', '4.2', 'std',[service('Macrch','cambio de aceite', 300.34,'40000','Remac',true),service('Macrch','cambio de aceite', 300.34,'40000','Remac',false),service('Macrch','cambio de aceite', 300.34,'40000','Remac',true),service('Macrch','cambio de aceite', 300.34,'40000','Remac',false),service('Macrch','cambio de aceite', 300.34,'40000','Remac',false),],),
      
      
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Image.asset('assets/logo.png'),
          actions: [
            IconButton(
              tooltip: 'Search vehicle',
              onPressed: (){}, 
              icon: Icon(Icons.search)),
            IconButton(
              tooltip: 'Add Vehicle',
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (context) => editvh(vehicles)))
                      .then((result) {
                    setState(() {
                      vehicles = result;
                    });
                  });
                },
                icon: const Icon(Icons.add_circle))
          ],
        ),
        body: ListView.builder(
          itemBuilder: (context, i) {
            return ExpansionTile(
              expandedAlignment: Alignment.topLeft,
              tilePadding: EdgeInsets.all(10),
              textColor: Colors.grey,
              iconColor: Colors.grey,
              title: Text(vehicles[i].trademark,style: TextStyle(fontSize: 30),),
              subtitle: Text(vehicles[i].model+'  '+vehicles[i].year,style: TextStyle(fontSize: 25),),
              trailing: IconButton(
                tooltip: 'View Services',
                onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>detail_vehicle(
                        vehicles[i].trademark,
                        vehicles[i].model,
                        vehicles[i].submodel,
                        vehicles[i].year,
                        vehicles[i].vin,
                        vehicles[i].motor,
                        vehicles[i].typetr,
                        vehicles[i].services,
                        )
                        )).then((result){
                          setState(() {
                            vehicles[i].services=result;
                          });
                        })
                        ;
                    }, icon: const Icon(Icons.list)),
              initiallyExpanded: false,
              children: [
                    Text('  Submodel :     ' + vehicles[i].submodel+'\n  Vin :     ' + vehicles[i].vin+'\n  Motor :     ' + vehicles[i].motor+'\n  TypeTransmision :     ' + vehicles[i].typetr, style: TextStyle(fontSize: 20,)),
                    

              ],
            );
          },
          itemCount: vehicles.length,
        ));
  }
}
