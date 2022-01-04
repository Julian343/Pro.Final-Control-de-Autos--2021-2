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
late Color _done;
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
          }, icon: Icon(Icons.arrow_back)),
        title: Row(
        children: [
          Text(widget.model+' '+widget.year+'    ',style: TextStyle(fontSize: 30),),
          Text(widget.trademark,style: TextStyle(fontSize: 15),),
        ],
      ),
      
      ),





      body: ListView.builder(
        reverse: true,
        itemBuilder: (context,i){
        return
        ListTile(
          tileColor: _services[i].done? null:Colors.deepOrange,
          leading: Text(_services[i].date),
          trailing: Text('\$'+_services[i].price.toString()),
          title: Text(_services[i].mileage),
          subtitle: Column(children: [
            Text(_services[i].servicee),
            Text(_services[i].workshop),
            Text(i.toString())
          ],),
        );
      },
      
      itemCount: _services.length, ));
  }
}