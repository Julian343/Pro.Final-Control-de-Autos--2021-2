
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
  String trademark='N/A',model='N/A',submodel='N/A',vin='N/A',typetr='N/A',year='N/A',motor='N/A';
  bool activebutton=false, tra=false,mod=false,ye=false;
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
          TextField(
            decoration: InputDecoration(
              filled: true,
              labelText: 'Trademark / Marca'
            ),
            textAlign: TextAlign.center,
            onChanged: (_trademark){
              setState(() {
              trademark=_trademark;
              tra = true;
            });}

          ),
          TextField(
            decoration: InputDecoration(
              filled: true,
              labelText: 'Model / Modelo'
            ),
            textAlign: TextAlign.center,
            onChanged: (_model){setState(() {
              model=_model;
              mod=true;
            });},
          ),
           TextField(
             decoration: InputDecoration(
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
             decoration: InputDecoration(
              filled: true,
              labelText: 'Year / Año'
            ),
            textAlign: TextAlign.center,
            onChanged: (_year){setState(() {
              year=_year;
              ye=true;
            });},
          ),
           TextField(
             decoration: InputDecoration(
              filled: true,
              labelText: 'Vin'
            ),
            textAlign: TextAlign.center,
            onChanged: (_vin){setState(() {
              vin=_vin;
            });},
          ),
           TextField(
             decoration: InputDecoration(
              filled: true,
              labelText: 'Motor / '
            ),
            textAlign: TextAlign.center,
            onChanged: (_motor){setState(() {
              motor=_motor;
            });},
          ),
           TextField(
             decoration: InputDecoration(
              filled: true,
              labelText: 'Typetransmission / Transmision'
            ),
            textAlign: TextAlign.center,
            onChanged: (_typetr){setState(() {
              typetr=_typetr;
            });},
          ),
          


         Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             TextButton(
               onPressed: mod&ye&tra ? (){
               _vehicles.add(vehicle(trademark,model,submodel,year,vin,motor,typetr,[]));
                Navigator.of(context).pop(_vehicles);
             }:null, 
             child: Column(children: [
               const Text('Add'),
               const Icon(Icons.note_add)
             ],)),
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