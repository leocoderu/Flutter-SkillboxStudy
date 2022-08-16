class User {                                        // Создаем класс родитель User
  String name;                                      // Свойство Имя
  String email;                                     // Свойство почта

  User(this.name, this.email);                      // Конструктор
}

mixin getMailSystem on User{                        // Миксин, добавление свойства domainName
  String get domainName => email.split('@')[1];     // Берем часть эл.почты после @
}

class AdminUser extends User with getMailSystem {   // Создаем класс потомок от User с приместью
  AdminUser(super.name, super.email);
}

class GeneralUser extends User {                    // Создаем класс потомок от User
  GeneralUser(super.name, super.email);
}

class UserManager<T extends User>{                  // Создаем класс управления User-ами
  List<T> listUser = [];                            // Репозиторий пользователей

  void addUser(T user) => listUser.add(user);       // Метод добавления пользователя в репозиторий
  void removeUser(T user) => listUser.remove(user); // Метод удаления пользователя из репозитория

  void getUserList(){                               // Метод отображения списка пользователей в репозитории
    for (var e in listUser) {                       // Проход по списку пользователей
      if(e.runtimeType == AdminUser) {              // Если тип записи AdminUser
        // ignore: avoid_print
        print('${(e as AdminUser).name}\t - ${e.domainName}'); // Песатем Имя и домен через миксин
      } else {
        // ignore: avoid_print
        print('${e.name}\t - ${e.email}');          // Инфче печатаем Имя и Почту
      }
    }
  }
}

void main() {
  User user1 = User('Anton', 'user@mail.ru');
  User user2 = User('Victory', 'vikky@gmail.com');
  AdminUser admin1 = AdminUser('John', 'john@microsoft.com');
  AdminUser admin2 = AdminUser('Franc', 'frank@yahoo.com');
  AdminUser admin3 = AdminUser('Sofia', 'soffie@google.com');
  GeneralUser general1 = GeneralUser('Lili', 'lili@rambler.ru');
  GeneralUser general2 = GeneralUser('Peter', 'peter@mail.ru');
  GeneralUser general3 = GeneralUser('Rob', 'rob@yandex.ru');

  UserManager userManager = UserManager();

  userManager.addUser(user1);
  userManager.addUser(user2);
  userManager.addUser(admin1);
  userManager.addUser(admin2);
  userManager.addUser(admin3);
  userManager.addUser(general1);
  userManager.addUser(general2);
  userManager.addUser(general3);

  userManager.getUserList();
  // ignore: avoid_print
  print('\n');

  userManager.removeUser(admin2);
  userManager.removeUser(general3);

  userManager.getUserList();
}