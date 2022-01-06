//Proyecto final sobre Control y programacion de servicios automotrices.
// MPOO  2021-2
// --Juan Carlos Julian Luis--


//Pagina en la que defino los contructores que uilizare


class vehicle {
    late List<service> services;
    late String plate,trademark,model,submodel,vin,typetr,motor,year;
    vehicle(this.plate,this.trademark,this.model,this.submodel,this.year,this.vin,this.motor,this.typetr,this.services);
}

class service {
    late String date,servicee, workshop, mileage;
    late double price;
    late bool done;
    service(this.date,this.servicee,this.price,this.mileage,this.workshop,this.done);

}