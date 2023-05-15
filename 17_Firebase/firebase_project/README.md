# Store Flutter project with Firebase.

    Flutter Store project with Firebase performance.

## Getting Started

Usability commands:

    Очистка проекта: flutter clean
    Получение пакетов: flutter pub get
    Обновление зависимостей: flutter packages upgrade
    Обновление до последних версий пакетов: flutter pub upgrade --major-versions

    Запуск кодогенерации: flutter packages pub run build_runner build
    Перегенерация файлов локализации: flutter gen-l10n
    Команда для запуска интеграционного теста: flutter drive --target=test_driver/app.dart

    Получение информации о версии Gradle (subDir: android): ./gradlew --version
    Получение ключей SHA1 и SHA256 из Gradle (subDir: android): ./gradlew signingReport
    Активизация Flutterfire CLI: dart pub global activate flutterfire_cli
    Конфигурирование проекта для firebase: flutterfire configure --project=<specific Proj Name>

Dependencies of packages in the Project:

          ------------------- Analyzer ----------------------
          |                   analyzer_sm                   |
          |                       |                         |
          V                       V                         V
    UI Layer          <---    Business layer    <---    Data Layer
    state_management          business_sm               data_sm
          ^                   /controllers                  ^  
          |                   /di/locator                   |
          |                       ^                         |
          |                       |                         |
          -----------------   Model Data  -------------------
                               model_sm

Dependencies:

    Анализатор кода сведен в отдельный пакет "packages/analyzer_sm" и подключен к остальным пакетам.
    fluro: ^2.0.5                   -   Organization of routing with Fluro
    flutter_bloc: ^8.1.2            -   For BLOC state management
    freezed: ^2.3.2                 -   Code generation
    build_runner: ^2.3.3            -   Code generation
    font_awesome_flutter: ^10.4.0
    fluttertoast: ^8.2.1            -   For show some message when you shold Exit  

    Localizations:
    flutter_localizations
    intl: any

    Firebase modules:
    firebase_core: ^2.10.0
    firebase_storage: ^11.1.1 
    cloud_firestore: ^4.5.2
    firebase_auth: ^4.4.2
    google_sign_in: ^6.1.0
    

ADDED TO PROJECT:

    1. FLURO routing
    2. Clear Architecture
    3. BLOC state management
    4. Code Analyze in single package
    5. Localizations
    6. CONNECT with Firebase
    7. Dependency Injection

TODO:
 
    Z. Tests


Цель домашнего задания: 

    Научиться использовать сервисы Firebase в Flutter-проектах.

Что нужно сделать:
    
    Напишите приложение со списком покупок. В списке должно быть наименование покупки и признак, куплено или нет. 
    В него можно добавить необходимую покупку и пометить уже существующую покупку, как купленную.

    Создайте свой проект в Firebase, подключите его к Android, iOS, Web.
    Создайте базу данных со списком покупок и подключите её к приложению. 
    *Используйте Emulator Suit для тестирования.

    Добавьте фоновую картинку из Storage.
    Добавьте аутентификацию пользователя через любого провайдера.
    *Добавьте сортировку покупок и фильтрацию, куплено или не куплено.
    **Используйте в приложении какой-либо подход из State Management, работу с Firebase вынесите на сервисный слой.

    Задания со звёздочками — повышенной сложности.

Советы и рекомендации:

    Не выкладывайте в репозиторий google-services.json, GoogleService-Info.plist и часть Index.html с деталями подключения, это небезопасно.
    Проверьте настройки доступа к данным (вкладка Rules). Для тестового приложения можно включить доступ на всё (allow read, write: if true;), но в реальном приложении такое небезопасно.
    Аутентификацию можно сделать, как в уроке, через Google, но если сделаете через другого провайдера, то задание будет засчитано как задание со звёздочкой.
    Прочитайте описание, как сделать сортировку и фильтрацию.

Что оценивается:

    Качество кода.
    Создание Firebase-проекта с базой данных, хранилищем и аутентификацией (детали проекта можно приложить скриншотами).
    Реализация всех задач, включая задачи со звёздочками.