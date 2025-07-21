//aynı özelliklerin aynı şekilde gösterilebilmesi için bir sınıflama

//dart oo ve değişkenleri korumaya odaklı

void main()
{


     // bool result = controlMoney(item) == null ? false : true;
    //print(result);
}

void controlCustomerAge(int value) {
  if (value > 10) {
    print('alisveris yapabilirsiniz');
  } else {
    print('alisvers yapamaiyz');
  }
}

class User {
  // ozellikleri neler
  late final String name;
  late int money;
  late final int? age;
  late final String? city;

  late final String userCode;

  late final String _id;

  User(String name, int money, {required String id, int? age, String? city}) 
  //opsiyonel olarak gelmeyebileceğini söylüyoruz burada '{}' ile
  {
    this.name = name;
    this.money = money;
    this.age = age;
    this.city = city;
    _id = id;
    userCode = (city ?? 'ist') + name;
  }
}

