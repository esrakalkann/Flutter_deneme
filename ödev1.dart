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

void CategoryBalances(List<Wallet> wallets) {
  final Map<int, double> categoryTotals = {};
  final Map<int, String> categoryNames = {};

  for (var wallet in wallets) {
    final id = wallet.category.id;
    final name = wallet.category.name;
    final balance = wallet.balance;

    categoryTotals.update(
      id,
      (existing) => existing + balance,
      ifAbsent: () => balance,
    );

    /*

      putIfAbsent methodu
        Returns the value associated to key, if there is one.
         Otherwise calls ifAbsent to get a new value, associates key to that value, and then returns the new value.

        That is, if the key is currently in the map, map.putIfAbsent(key, ifAbsent) is equivalent to map[key]. 
        If the key is not currently in the map, it's instead equivalent to map[key] = ifAbsent()
         (but without any guarantee that the [] and []= operators are actually called to achieve that effect).


      */
    categoryNames.putIfAbsent(id, () => name);
  }

  for (final entry in categoryTotals.entries) {
    final name = categoryNames[entry.key]!;
    print("Kategori: $name → Toplam: ${entry.value} ₺");
  }
}

void HighestWallet(List<Wallet> wallets) {
  Wallet highest = wallets.first;

  for (var wallet in wallets) {
    if (wallet.balance > highest.balance) {
      highest = wallet;
    }
  }

  print(
    "En yüksek bakiyeye sahip cüzdan: ${highest.balance} ₺ (${highest.category.name})",
  );
}

void WalletByCategorySorted(List<Wallet> wallets, Category category) {
  final filtered = wallets
      .where((wallet) => wallet.category == category)
      .toList()
    ..sort((a, b) => a.balance.compareTo(b.balance));

  final total = filtered.fold(0.0, (sum, wallet) => sum + wallet.balance);

  print("Kategori: ${category.name} - Cüzdanlar:");
  for (var wallet in filtered) {
    print("- ${wallet.balance} ₺");
  }
  print("Toplam bakiye: $total");
}

void addCategory(String name, int id, List<Category> categories, User user) {
  final exists =
      categories.any((category) => category.id == id || category.name == name);

  if (exists) {
    print("Kategori mevcut");
  } else {
    final newCategory = Category(name, id);
    categories.add(newCategory);

    final newWallet = Wallet(balance: 0.0, category: newCategory);
    user.wallets.add(newWallet);

    print("Kategori eklendi: $name");
    final count = getWalletCount(user.wallets);
    print("Toplam cüzdan sayısı: $count");
  }
}

int getWalletCount(List<Wallet> wallets) => wallets.length;

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
  final wallets = [wallet1, wallet2, wallet3, wallet4];
  CategoryBalances(wallets);
  HighestWallet(wallets);
  WalletByCategorySorted(wallets, cash);

  //addCategory("Tatil", 4, categories);

  addCategory("Tatil", 5, categories, user);
  print("\nEklenen kategoriler:");
  for (var category in categories) {
    print("ID: ${category.id}, Name: ${category.name}");
  }

  print("Toplam Cüzdan Sayısı: ${user.getWalletCount()}");
}

final List<Category> categories = [];
