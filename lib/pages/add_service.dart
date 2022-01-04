
import 'package:control_autos/class.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class addServices extends StatefulWidget {
  final eservices;
  addServices(this.eservices);

  @override
  _addServicesState createState() => _addServicesState();
}

class _addServicesState extends State<addServices> {
  late List<service> _services;
   String date= DateFormat('dd/MM/yyyy').format(DateTime.now());
  late String servicee, workshop, mileage;
  late double price;
  late bool done;
  bool ser = false, wor = false, mil = false, pri = false;

  @override
  void initState() {
    _services = widget.eservices;
    done = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Date / Fecha : ',style: TextStyle(fontSize: 25)),
              TextButton(
                  onPressed: () {
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100)).then((result){
                          setState(() {
                            date=DateFormat('dd/MM/yyyy').format(result!);
                          });
                        });
                  },
                  child: const Icon(Icons.calendar_today)),
                  Text(date)
            ],
          ),
          TextField(
            decoration:
                InputDecoration(filled: true, labelText: 'Service / Servicio'),
            textAlign: TextAlign.center,
            onChanged: (_service) {
              setState(() {
                servicee = _service;
                ser = true;
              });
            },
          ),
          TextField(
            decoration:
                InputDecoration(filled: true, labelText: 'Cost / Costo'),
            textAlign: TextAlign.center,
            onChanged: (_price) {
              setState(() {
                price = double.parse('$_price');
                pri = true;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
                filled: true, labelText: 'Mileage / Kilometrage'),
            textAlign: TextAlign.center,
            onChanged: (_mileage) {
              setState(() {
                mileage = _mileage;
                mil = true;
              });
            },
          ),
          TextField(
            decoration:
                InputDecoration(filled: true, labelText: 'Workshop / Taller'),
            textAlign: TextAlign.center,
            onChanged: (_workshop) {
              setState(() {
                workshop = _workshop;
                wor = true;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: done? Colors.greenAccent:Colors.redAccent),
                height: 50,
                width: 150,
                child: TextButton(
                  onPressed: () {
                    if (done == true) {
                      setState(() {
                        done = false;
                      });
                    } else {
                      setState(() {
                        done = true;
                      });
                    }
                  },
                  child:Text(done?'Done / Hecho':'Not Done / No hecho',style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: ser & wor & mil & pri
                      ? () {
                          _services.add(service(
                              date, servicee, price, mileage, workshop, done));
                          Navigator.of(context).pop(_services);
                        }
                      : null,
                  child: Column(
                    children: [const Text('Add'), const Icon(Icons.note_add)],
                  )),
              TextButton(
                  onPressed: () {
                    _services = widget.eservices;
                    Navigator.of(context).pop(_services);
                  },
                  child: Column(
                    children: [
                      Text('Cancel'),
                      Icon(Icons.cancel),
                    ],
                  ))
            ],
          )
        ],
      ),
    ));
  }
}
