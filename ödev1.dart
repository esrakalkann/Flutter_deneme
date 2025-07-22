

class Category {
  final String id;
  final int name;

  Category(this.name, this.id);
}

class Wallet {
  double balance;
  final Category category;

  Wallet({required this.balance, required this.category});

  void deposit(double amount) {
    if (amount <= 0) throw Exception("Geçersiz miktar");
    balance += amount;
    print("${category.name} cüzdanına $amount para yatırıldı.");
    print("yeni bakiye $balance");
  }

  void withdraw(double amount){
    if (amount<=0) throw Exception("Geçersiz miktar");
    if(amount>balance) throw Exception ("Yetersiz bakiye");
    balance -=amount;
    print("${category.name} cüzdanından $amount para çekildi.");
    print("yeni bakiye $balance");


  }
}

class User {
  final String name;
  final String surname;
  List<Wallet> wallets=[];

  User({required this.name, required this.surname, required this.wallets});

  String getFullName()=> "$name $surname";
  int getWalletCount()=> wallets.length;
  double getTotalBalance() {
  double sum = 0;
  for (final wallet in wallets) {
    sum += wallet.balance;
  }
  return sum;
}

}

void main() {
  final cash = Category(1, "Nakit");
  final investment = Category(2, "Yatırım");
  final savings=Category(3, "Birikim");

  final wallet1 = Wallet(balance: 1500, category: cash);
  final wallet2 = Wallet(balance: 2000, category: savings);
  final wallet3 = Wallet(balance: 3000, category: investment);
  final wallet4 = Wallet(balance: 5000, category: savings);


  final user = User(name: "Esra", surname: "Kalkan", wallets: [wallet1, wallet2, wallet3]);

  print("Ad Soyad: ${user.getFullName()}");
  print("Toplam Cüzdan Sayısı: ${user.getWalletCount()}");
  print("Toplam Bakiye: ${user.getTotalBalance()} ₺");

}