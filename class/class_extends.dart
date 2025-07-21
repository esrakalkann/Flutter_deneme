void main()
{




}



/*extendte farklı özelliklere sahip olabilir
implement'te ekstra method atayamazsın
*/
abstract class IUser{
  final  String name;
  final int money;

  IUser (this.name, this.money);
  void sayMoneyWithCompanyName(){


    print('CompanyA has $money');
  }




}
class User extends IUser{
  final String name;
  final int money;
  User(this.name,this.money): super(name,money);


}

class BankUser extends User{
  final int bankingCode;
  BankUser(String name, int money, this.bankingCode): super(name,money);

  void bankSpecialLogic(){


    print(money);
  }
  



}

/*


class Television {
  void turnOn() {
    _illuminateDisplay();
    _activateIrSensor();
  }
  
}

class SmartTelevision extends Television {
  void turnOn() {
    super.turnOn();
    _bootNetworkInterface();
    _initializeMemory();
    _upgradeApps();
  }
  
}


*/
