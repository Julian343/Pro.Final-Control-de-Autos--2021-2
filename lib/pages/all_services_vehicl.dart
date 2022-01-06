//Proyecto final sobre Control y programacion de servicios automotrices.
// MPOO  2021-2
// --Juan Carlos Julian Luis--


// Pagina que muestra los servicios de un auto

import 'package:control_autos/class.dart';
import 'package:control_autos/pages/add_service.dart';
import 'package:flutter/material.dart';

class detail_vehicle extends StatefulWidget {
  final plate,trademark,model,submodel,year,vin,motor,typetr,services;
  detail_vehicle(this.plate,this.trademark,this.model, this.submodel,this.year,this.vin,this.motor,this.typetr,this.services);

  @override
  State<detail_vehicle> createState() => _detail_vehicleState();
}

class _detail_vehicleState extends State<detail_vehicle> {
late List<service> _services;
@override
void initState() {

  //Pasa los ervicos para imprimirlos
      _services=widget.services;
  super.initState();
  
}


  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){

            //Abre la ventana de agregar un nuevo servicio
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>addServices(_services))).then((result){
              setState(() {
                _services=result;
              });
            });
          }
          
          , icon: Icon(Icons.add_circle))
        ],
        leading: IconButton(onPressed: (){
            Navigator.of(context).pop(_services);
          }, icon: const Icon(Icons.arrow_back)),
        title: Row(
        children: [
          Text(widget.model+' '+widget.year+'    ',style: const TextStyle(fontSize: 30),),
          Text(widget.trademark+'     '+widget.plate,style: const TextStyle(fontSize: 15),),
        ],
      ),
      
      ),





      body: ListView.builder(
        reverse: true,
        itemBuilder: (context,i){

          // Funcion para cambiar el estado del servicio si ya se hizo
          void _done(){
            setState(() {
              _services[i].done=true;
            });
          }

        return

        // Targetas que muestran la informacion de cada servicio 
        ExpansionTile(
          expandedAlignment: Alignment.center,
          trailing: _services[i].done? const Icon(Icons.done_sharp,color: Colors.green,): IconButton(onPressed: (){_done();}, icon: const Icon(Icons.done_sharp,color: Colors.red,)),
          title: Text(_services[i].date),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('\$'+_services[i].price.toString()),
              Text(_services[i].mileage+' KM')
            ],
          ),
          children: [
           Text(_services[i].servicee,style: const TextStyle(fontSize: 25),),
           Text( '\n\nWorkshop:   '+_services[i].workshop ,style: const TextStyle(fontSize: 18),),
        ],)
        ;
      },
      
      itemCount: _services.length, ));
  }
}