import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class vehicle {
    late List<service> services;
    late String trademark,model,submodel,vin,typetr,motor,year;
    vehicle(this.trademark,this.model,this.submodel,this.year,this.vin,this.motor,this.typetr,this.services);
}

class service {
    late String date,servicee, workshop, mileage;
    late double price;
    late bool done;
    service(this.date,this.servicee,this.price,this.mileage,this.workshop,this.done);

}

