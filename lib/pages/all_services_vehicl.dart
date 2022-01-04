import 'package:control_autos/class.dart';
import 'package:control_autos/pages/add_service.dart';
import 'package:flutter/material.dart';

class detail_vehicle extends StatefulWidget {
  final trademark,model,submodel,year,vin,motor,typetr,services;
  detail_vehicle(this.trademark,this.model, this.submodel,this.year,this.vin,this.motor,this.typetr,this.services);

  @override
  State<detail_vehicle> createState() => _detail_vehicleState();
}

class _detail_vehicleState extends State<detail_vehicle> {
late List<service> _services;
@override
void initState() {
      _services=widget.services;
  super.initState();
  
}


  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
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
          Text(widget.trademark,style: const TextStyle(fontSize: 15),),
        ],
      ),
      
      ),





      body: ListView.builder(
        reverse: true,
        itemBuilder: (context,i){

          void _done(){
            setState(() {
              _services[i].done=true;
            });
          }

        return
        ExpansionTile(
          expandedAlignment: Alignment.topLeft,
          trailing: _services[i].done?null: IconButton(onPressed: (){_done();}, icon: const Icon(Icons.done_sharp,color: Colors.red,)),
          leading: Text(_services[i].date),
          title: Text('\$'+_services[i].price.toString(),textAlign: TextAlign.center,),
          children: [
           Text('Mieleage:   '+_services[i].mileage+'\nService:   '+_services[i].servicee+'\nWorkshop:   '+_services[i].workshop,style: const TextStyle(fontSize: 24),),
           Text( '',style: const TextStyle(fontSize: 25),),
        ],)
        ;
      },
      
      itemCount: _services.length, ));
  }
}