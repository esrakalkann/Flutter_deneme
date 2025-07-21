void main(){

var user = User("Esra");

  user.addTask(StandartTask("Study Flutter", Priority.high));
  user.addTask(ShoppingTask("Market List", Priority.medium, ["Eggs", "Milk"]));

  print("\n--- Task List ---");
  user.listTasks();

  print("\n--- Reminders ---");
  user.remindAll();

  // Görevi tamamlama
  user.tasks[0].complete();

  print("\n--- Updated Tasks ---");
  user.listTasks(showCompleted: true);



}

enum Priority{low,medium,high}

abstract class Task {
  final String title;
  final DateTime createdAt;
  bool _isCompleted=false;
  Priority priority;


  Task(this.title,this.priority):createdAt=DateTime.now();

  void complete(){

    _isCompleted=true;

  }
  bool get isCompleted=> _isCompleted;
  //_isCompleted'in değerini döndürüyor değişken gibi görünerek
/*
  @override
  String toString() => formattedInfo;
  }
*/

void remind();
}

class StandartTask extends Task{
  StandartTask(String title, Priority priority): super(title,priority);

  @override
  void remind() {
    print("Reminder: Don’t forget to finish \"$title\".");
  }


}

class ShoppingTask extends Task{
  List<String> items;
  ShoppingTask(String title, Priority priority, this.items): super(title,priority);
  //ana classtaki title ve priority'i bu extended classa gönderiyoruz
  //hem tasktaki özellikleri hem de shoppingtaskın özelliklerini aynı anda başlatıyoruz
  
    @override
  void remind() {
    print("Buy these items for \"$title\": ${items.join(', ')}");
  }

  //task içindeki remindı geçersiz kılar ve Shoppingtaska yeni bir remind atıyoruz

  void addItem(String item){


    items.add(item);
  }




}



class User{

final String name;
List<Task> tasks=[];

User(this.name);

  void addTask(Task task) {
    tasks.add(task);
    print("Task added for $name: ${task.title}");
  }




  void listTasks({bool showCompleted = true}) {
    for (var task in tasks) {
      if (showCompleted || !task.isCompleted) {
        print(task);
      }
    }
  }

  void remindAll() {
    for (var task in tasks) {
      if (!task.isCompleted) task.remind();
    }
  }


}