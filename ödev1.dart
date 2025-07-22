import 'dart:async';

class Category {
  final int id;
  final String name;

  Category(this.name, this.id);
}

class Wallet {
  double balance;
  final Category category;

  Wallet({required this.balance, required this.category});

  get wallets => null;

  void deposit(double amount) {
    if (amount <= 0) throw Exception("Geçersiz miktar");
    balance += amount;
    print("${category.name} cüzdanına $amount para yatırıldı.");
    print("yeni bakiye $balance");
  }

  void withdraw(double amount) {
    if (amount <= 0) throw Exception("Geçersiz miktar");
    if (amount > balance) throw Exception("Yetersiz bakiye");
    balance -= amount;
    print("${category.name} cüzdanından $amount para çekildi.");
    print("yeni bakiye $balance");
  }
}

class User {
  final String name;
  final String surname;
  List<Wallet> wallets = [];

  User({required this.name, required this.surname, required this.wallets});

  String getFullName() => "$name $surname";
  int getWalletCount() => wallets.length;
  double getTotalBalance() {
    double sum = 0;
    for (final wallet in wallets) {
      sum += wallet.balance;
    }
    return sum;
  }

  void transfer(Wallet toWallet, Wallet fromWallet, double amount) {
    if (!wallets.contains(fromWallet) || !wallets.contains(toWallet)) {
      throw Exception("Cüzdan bulunamadı.");
    }
    fromWallet.withdraw(amount);
    toWallet.deposit(amount);
    print(
        "Transfer başarılı: $amount ₺, ${fromWallet.category.name} -> ${toWallet.category.name}");
  }

  
}

void main() {
  final cash = Category("Nakit", 1);
  final investment = Category("Yatırım", 2);
  final savings = Category("Birikim", 4);

  final wallet1 = Wallet(balance: 1500, category: cash);
  final wallet2 = Wallet(balance: 2000, category: savings);
  final wallet3 = Wallet(balance: 3000, category: investment);
  final wallet4 = Wallet(balance: 5000, category: savings);

  final user = User(
      name: "Esra",
      surname: "Kalkan",
      wallets: [wallet1, wallet2, wallet3, wallet4]);

  print("Ad Soyad: ${user.getFullName()}");
  print("Toplam Cüzdan Sayısı: ${user.getWalletCount()}");
  print("Toplam Bakiye: ${user.getTotalBalance()} ₺");

  try {
    user.transfer(wallet1, wallet2, 300);
  } catch (e) {
    print("Transfer hatası: $e");
  }

  
}
