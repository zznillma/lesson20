import 'dart:io';

void main() {
  // Kelvin kelvin = Kelvin(0);
  // kelvin.convert();
  // Farengeit farengeit = Farengeit(0);
  // farengeit.convert();

  // Tiels tiels = Tiels('keramika', 20, 30, 200);
  // tiels.getData();

  // Children bob = Children();
  // bob.display();

  // Soda fanta = Soda(dobavka: 'orange');
  // fanta.show_my_drink();

  // Worker bob = Worker('Bob', 'Washington', 20, 3);
  // bob.getSalary();

  // Car car = Car('toyora', 'S', 3000, 'Bob', 'Washington', 300, 200);
  // car.start();
  // car.stop();
  // car.turnLeft();
  // car.turnRight();
  // car.printCarSettings();

  // Lorry lorry = Lorry('asd', 'sd', 20, 'asd', 'asd', 20, 123, 3000);
  // lorry.printCarSettings();

  // Train train = Train();
  // train.prolezet();

  Burger burger = Burger();
  burger.craft();

}

class BaseConverter {
  late int celsia;
  void convert() {}
}

abstract class Converter implements BaseConverter {
  int celsia;
  Converter(this.celsia);
  void convert() {}
}

class Kelvin implements Converter {
  @override
  int celsia;

  Kelvin(this.celsia);

  @override
  void convert() {
    print(celsia + 273.15);
  }
}

class Farengeit implements Converter {
  @override
  int celsia;

  Farengeit(this.celsia);

  @override
  void convert() {
    print(celsia + 32);
  }
}

class Tiels {
  String brand;
  int size_h;
  int size_w;
  int price;
  Tiels(this.brand, this.size_h, this.size_w, this.price);

  void getData() {
    print('brand: $brand\nsize_h: $size_h\nsize_w: $size_w\nprice: $price');
  }
}

class Children {
  String? _name;
  String? _surname;
  int? _age;

  void display() {
    print('введите свое имя');
    _name = stdin.readLineSync()!;
    print('введите вашу фамилию');
    _surname = stdin.readLineSync()!;
    print('введите ваш возраст');
    _age = int.parse(stdin.readLineSync()!);

    print('your name: $_name;\nyour surname: $_surname;\nyour age: $_age;');
  }
}

class Soda {
  String? dobavka;

  Soda({this.dobavka});

  void show_my_drink(){
    if(dobavka == null) {
      print('обычная газировка');
    } else {
      print('газировка и ${dobavka}');
    }
  }
}

class Worker {
  String name;
  String surname;
  int rate;
  int days;

  Worker(this.name, this.surname, this.rate, this.days);

  void getSalary() {
    print('$name $surname имеет зарплату в размере ${rate * days}\$');
  }
}

class Driver {
  String name;
  String surname;

  Driver(this.name, this.surname);
}

class Engine {
  int power;
  int producivity;

  Engine(this.power, this.producivity);
}

class Car implements Driver, Engine {
  String mark;
  String clas;
  int weight;
  
  String name = '';
  @override
  int power;
  @override
  int producivity;
  @override
  String surname;

  Car(this.mark, this.clas, this.weight, this.name, this.surname, this.power, this.producivity);

  void start() {
    print('поехали');
  }
  void stop() {
    print('останавливаемся');
  }
  void turnRight(){
    print('поворот направо');
  }
  void turnLeft(){
    print('поворот налево');
  }

  void printCarSettings(){
    print('mark: $mark\nclass: $clas\nweight: $weight\nname Driver: $name\nsurname Driver: $surname\npower: $power\nproducivity: $producivity');
  }
}

class Lorry extends Car {
 String mark;
  String clas;
  int weight;
  String name;
  String surname;
  int power;
  int producivity;
  int gruz;
  Lorry(
        this.mark,
        this.clas,
        this.weight,
        this.name,
        this.surname,
        this.power,
        this.producivity,
        this.gruz

  ) : super(mark, clas, weight, name, surname, power, producivity);
  @override
  void printCarSettings() {
    super.printCarSettings();
    print('gruz: $gruz');
  }
}

class SportCar extends Car{
  String mark;
  String clas;
  int weight;
  String name;
  String surname;
  int power;
  int producivity;
  SportCar(
        this.mark,
        this.clas,
        this.weight,
        this.name,
        this.surname,
        this.power,
        this.producivity,
        ) : super(mark, clas, weight, name, surname, power, producivity);
  @override
  void printCarSettings() {
    super.printCarSettings();
  }
}

class Train {
  int? size_h;
  int? size_w;
  int? size_h_p;
  int? size_w_p;
  Train({this.size_h, this.size_w, this.size_h_p, this.size_w_p});

  void prolezet() {
    print('введите высоту поезда: ');
    size_h_p =int.parse(stdin.readLineSync()!);
    print('введите ширину поезда: ');
    size_w_p = int.parse(stdin.readLineSync()!);

    print('введите высоту тунеля: ');
    size_h = int.parse(stdin.readLineSync()!);
    print('введите ширину тунеля: ');
    size_w = int.parse(stdin.readLineSync()!);

    if (size_h! >= size_h_p! && size_w! >= size_w_p! ) {
      print('поезд пролезет');
    } else {
      print('тунель узок для поезда');
    }
  }
}

class Burger {
  void craft() {
    int full_kal = 0;
    int full_price = 0;
    String razmer = '';
    print('какой размер бургера вы будете?(маленький(1) или большой(2)');
    razmer = stdin.readLineSync()!;
    if(razmer == '1'){
      razmer = 'маленький';
      full_price += 50 ;
      full_kal +=20;
    } else if (razmer == '2') {
      razmer = 'большой';
      full_price += 100;
      full_kal += 40;
    } else {
      print('введите корректное значение');
    }
    
    String nachinka1 = '';
    print('какую начинку вы хотите?');
    print('вы можете добавить сыр(1) салат(2) картошку(3)');
    print('если вы хотите все начинки введите "all"');
    print('если же вы хотите разные введите числа слитно');
    nachinka1 = stdin.readLineSync()!;
    if(nachinka1 == 'all') {
      nachinka1 = 'сыр, салат, картошка';
      full_price +=45;
      full_kal +=35;
      
    } else if(nachinka1 == '1') {
      nachinka1 = 'сыр';
      full_price +=10;
      full_kal +=20;
    } else if(nachinka1 == '2') {
      nachinka1 = 'салат';
      full_price +=20;
      full_kal +=5;
    } else if(nachinka1 == '3') {
      nachinka1 = 'картошка';
      full_price+=15;
      full_kal +=10;
    } else if(nachinka1 == '12' || nachinka1 == '21'){
      nachinka1 = 'сыр, салат';
      full_price +=30;
      full_kal+=25;
    } else if(nachinka1 == '13' || nachinka1 == '31') {
      nachinka1 = 'сыр, картошка';
      full_price +=25;
      full_kal +=30;
    } else if (nachinka1 == '23' || nachinka1 == '32') {
      nachinka1 = 'салат, картошка';
      full_price +=35;
      full_kal +=15;
    } else if(nachinka1 == '' || nachinka1 == ' ' || nachinka1 == 'ничего') {
      nachinka1 = 'без начинки';
    } else {
      print('введите корректное значение');
    }
    String dobavka = '';
    print('хотите ли вы добавить майонез или приправу?');
    print('если да то приправа(1) майонез(2)');
    print('если вы хотите и то и то то введите "all"');
    dobavka = stdin.readLineSync()!;
    if(dobavka == 'all') {
      dobavka = 'приправа, майонез';
      full_price +=35;
      full_kal += 5;
    } else if(dobavka == '1') {
      dobavka = 'приправа';
      full_price +=15;
      full_kal += 0;
    } else if(dobavka == '2') {
      dobavka = 'майонез';
      full_price +=20;
      full_kal +=5;
    } else {
      print('введите корректное значение');
    }
  print('<<<размер бургера: $razmer>>>,\n<<<начинки: $nachinka1>>>,\n<<<добавка: $dobavka>>>');
  print('<<<цена ващего бургера: $full_priceсом>>>');
  print('<<<каллорийность вашего бургера: $full_kalкалорий>>>');

  }
}



