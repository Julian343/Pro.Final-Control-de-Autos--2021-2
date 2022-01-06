//Proyecto final sobre Control y programacion de servicios automotrices.
// MPOO  2021-2
// --Juan Carlos Julian Luis--


// Pagina para agregar los vehiculos

import 'package:control_autos/class.dart';
import 'package:flutter/material.dart';


class editvh extends StatefulWidget {
  final vehicles;
  editvh(this.vehicles);

  @override
  State<editvh> createState() => _editvhState();
}

class _editvhState extends State<editvh> {  
  late List<vehicle> _vehicles;
  String trademark='N/A',model='N/A',submodel='N/A',vin='N/A',typetr='Standar',year='N/A',motor='N/A', plate='N/A';
  bool activebutton=false, tra=false,mod=false,ye=false, trans=true;
  @override
  void initState() {
    _vehicles=widget.vehicles;
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body :Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          // Aqui leemos la informacion que se necesita para agregar un nuevo vehiculo
          TextField(
             decoration: const InputDecoration(
              filled: true,
              labelText: 'Vin'
            ),
            textAlign: TextAlign.center,
            onChanged: (_plate){setState(() {
              plate=_plate;
            });},
          ),
          
          TextField(
            decoration: const InputDecoration(
              filled: true,
              labelText: '* Trademark / Marca'
            ),
            textAlign: TextAlign.center,
            onChanged: (_trademark){
              setState(() {
              trademark=_trademark;
              tra = true;
            });}

          ),
          TextField(
            decoration: const InputDecoration(
              filled: true,
              labelText: '* Model / Modelo'
            ),
            textAlign: TextAlign.center,
            onChanged: (_model){setState(() {
              model=_model;
              mod=true;
            });},
          ),
           TextField(
             decoration: const InputDecoration(
              filled: true,
              labelText: 'Submodel / Submodelo'
            ),
            textAlign: TextAlign.center,
            onChanged: (_submodel){setState(() {
              submodel=_submodel;
            });
            },
          ),
           TextField(
             decoration: const InputDecoration(
              filled: true,
              labelText: '* Year / Año'
            ),
            textAlign: TextAlign.center,
            onChanged: (_year){setState(() {
              year=_year;
              ye=true;
            });},
          ),
           TextField(
             decoration: const InputDecoration(
              filled: true,
              labelText: 'Vin'
            ),
            textAlign: TextAlign.center,
            onChanged: (_vin){setState(() {
              vin=_vin;
            });},
          ),
           TextField(
             decoration: const InputDecoration(
              filled: true,
              labelText: 'Motor / '
            ),
            textAlign: TextAlign.center,
            onChanged: (_motor){setState(() {
              motor=_motor;
            });},
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Transmission:  ',style: TextStyle(color: Colors.black, fontSize: 20)),
              Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.indigo),
                    height: 50,
                    width: 150,
                    child: TextButton(
                      onPressed: () {
                        if (trans == true) {
                          setState(() {
                            trans = false;
                            typetr='Automatica';
                          });
                        } else {
                          setState(() {
                            trans = true;
                            typetr='Standar';
                          });
                        }
                      },
                      child:Text(trans?'Standar':'Automatic',style: const TextStyle(color: Colors.black, fontSize: 20),textAlign: TextAlign.center,),
                    ),
                  ),
            ],
          ),
          


         Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [

             // Boton para agregar en el que obrigatoriamente hay que poner marca, modelo y año
             TextButton(
               onPressed: mod&ye&tra ? (){
               _vehicles.add(vehicle(plate,trademark,model,submodel,year,vin,motor,typetr,[]));
                Navigator.of(context).pop(_vehicles);
             }:null, 
             child: Column(children: [
               const Text('Add'),
               const Icon(Icons.note_add)
             ],)),

             // Boton para cancelar
             TextButton(onPressed: (){
               _vehicles=widget.vehicles;
               Navigator.of(context).pop(_vehicles);
             }, child: Column(children: [
               Text('Cancel'),
               Icon(Icons.cancel),
             ],))
           ],
         )
          
        ],
      ),
    ));
  }
}