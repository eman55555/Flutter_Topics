class Vehicle {
  String? type;
  String? color;
  String? velocity;
  String? size;
  String? usage;

  Vehicle(this.color, this.type, this.velocity, this.size, this.usage)
  {
    // color = color;
    // type = type;
    // velocity= velocity;
    // size = size;
    // usage= usage;
  }
  


  // named constructor
  Vehicle.named() {
    print("Vehicle Parent class => ");
  }
  printInfo() {
    print(" This Vehicle : $type , $color , $velocity , $size , $usage");
  }
}

class Car extends Vehicle {
  String? model;
  String? company;

// super
  Car(color, type, velocity, size, usage, this.model, this.company)
      : super(color, type, velocity, size, usage);

  Car.named() : super.named() {
    print("Car Child class  ");
  }
// super in function
  printCar() {
    super.printInfo();
    print(" This Car : $model , $company ");
  }
}

class Truck extends Vehicle {
  final String? cargoType;
  final int? workHours;
   Truck(
    color,
    type,
    velocity,
    size,
    usage,
    this.cargoType,
    this.workHours,
  ) : super(color, type, velocity, size, usage);

// override
  @override
   printInfo() {
    print(" This Truck : $cargoType , $workHours ");
  }
}

class Bus extends Vehicle {
  final int? workHours;
  final String? workType;

  Bus(
    color,
    type,
    velocity,
    size,
    usage,
    this.workHours,
    this.workType,
  ) : super(color, type, velocity, size, usage);

   printBus() {
    print(" This Truck : $workHours , $workType ");
  }
}


void main()
{
 var v =Vehicle("red", "bycle", "slow",  "small", "walk");
  print(v.color);
  var v1 =  Vehicle.named();// red
  print(v1);


  var t = Truck("Blue", "truck", "quick", "big", "carraige", "vetables", 9);
  print(t.size); // big
  print(t.printInfo());

  var c = Car(v.color, "car" , "fast" ,"meduim",v.usage ,"SUV","BMW");
  print(c.model); // SUV
  print(c.printCar());
  print(c.printInfo());

  var b = Bus("orange", "bus", "quick", "big", "carraige", 5, "bussiness");

  print(b.workType);
  print(b.printBus());

}