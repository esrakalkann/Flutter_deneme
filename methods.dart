void main() {
  final newUserMoney = 50;

  print(newUserMoney / 13);

  int result = convertToDolar(newUserMoney);

  print(result);
  if (result > 0) {}

  //final newResult = convertToStandartDolar(100, dolarIndex: 13);
  //final newResult2 = convertToStandartDolar(100);
  //final newREsult3 = convertToEuro(userMoney: 500);
  sayHello('aa');
}

void controlUserMoney(int money, int minumumValue) {
  if (money > minumumValue) {
    print('para var');
  } else {
    print('para yok');
  }
}

int convertToDolar(int userMoney) {
  return userMoney ~/ 13;
}

int convertToStandartDolar(int userMoney, {int dolarIndex = 14}) {
  return userMoney ~/ dolarIndex;
}

int convertToEuro({required int userMoney, int dolarIndex = 14}) {
  return userMoney ~/ dolarIndex;
}

String sayHello(String name) {
  return 'hello $name';
}

//optional default and required parameters
