//Proyecto final sobre Control y programacion de servicios automotrices.
// MPOO  2021-2
// --Juan Carlos Julian Luis--


//Es la pagina principal en la que se muestran los vehiculos
// Muestran un lisitile con el modelo, la marca , y el año.
//Ademas tiene un boton para ver la lista de servicios hecho.

import 'package:control_autos/class.dart';
import 'package:control_autos/decoration.dart';
import 'package:control_autos/pages/all_services_vehicl.dart';
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

    //Lista para ejemplo
    vehicles = [
      vehicle('NFG-FC8','Ford', 'Focus', 'SLE', '2006', 'JNAB656DADSAJBDAH6', '4.2', 'std',[service('12/14/2021','cambio de aceite', 300.34,'40000','Remac',true),service('16/06/2019','cambio de aceite', 300.34,'40000','Remac',false),service('12/14/2021','cambio de aceite', 300.34,'40000','Remac',true),service('12/14/2021','cambio de aceite', 300.34,'40000','Remac',false),service('12/14/2021','cambio de aceite', 300.34,'40000','Remac',false),],),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          //Imagen pra utilizar la decoracion
          leading: IconButton(onPressed: (){showAboutDialog(
            context: context,
            applicationName: 'Proyecto Final - MPOO 2021-2',
            applicationVersion: 'Juan Carlos Julian Luis',
            applicationIcon: logo(),
            applicationLegalese: 'Proyecto para llevar un registro de autmoviles, asi como los servicios realizados a los mismos',
            ); },
           icon: const Icon(Icons.info) ),
          actions: [

            //Boton que no es funcional, pero es pra buscar
            IconButton(
              tooltip: 'Search vehicle',
              onPressed: (){}, 
              icon: const Icon(Icons.search)),

              //Boton para agregar un nuevo vehiculo
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

        //Impresion de los listile
        body: ListView.builder(
          itemBuilder: (context, i) {
            return ExpansionTile(
              expandedAlignment: Alignment.topLeft,
              tilePadding: const EdgeInsets.all(10),
              textColor: Colors.grey,
              iconColor: Colors.grey,
              title: Text(vehicles[i].plate,style: const TextStyle(fontSize: 30),),
              subtitle: Text(vehicles[i].model+'  '+vehicles[i].year,style: const TextStyle(fontSize: 25),),
              trailing: IconButton(
                tooltip: 'View Services',
                onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>detail_vehicle(
                        vehicles[i].plate,
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
                    Text('  Trademark :     '+vehicles[i].trademark+'\n  Submodel :     ' + vehicles[i].submodel+'\n  Vin :     ' + vehicles[i].vin+'\n  Motor :     ' + vehicles[i].motor+'\n  TypeTransmision :     ' + vehicles[i].typetr, style: TextStyle(fontSize: 20,)),
                    

              ],
            );
          },
          itemCount: vehicles.length,
        ));
  }
}
