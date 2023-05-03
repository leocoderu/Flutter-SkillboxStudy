# getit_example

It's Demo Flutter App with DI and Clear Architecture.

## Getting Started

Dependencies of packages in Project:
 
    UI Layer    <---------------    Business layer   <------------------    Data Layer
    main.dart                       business/person_controller.dart         data/person_repo.dart      
    pages/home_pages.dart           business/locator.dart                       ^
      ^                                 ^                                       |
      |                                 |                                       |
      --------------------------    Model Data  ---------------------------------
                                    model/person.dart

Steps witch you should to do:

    1: include GetIt as a dependency    -   business/pubspec.yaml   -   dependencies: get_it: ^7.3.0
    2: Create a get_it locator          -   business/locator.dart   -   final locator = GetIt.instance;
    3: Create a setup method and create -   business/locator.dart   -   void setup(){ 
       our services                                                         locator.reg... ...PersonRepo());
                                                                            locator.reg... ...PersonController());
                                                                        }
    4: Call the setup method to         -   ui/main.dart            -   void main() { 
       initialize the services                                            setup();
                                                                          ...
                                                                        }
    5: Locate the service with GetIt    -   ui/home_page.dart       -   locator.get<PersonController>().getNextPerson(); 
       and call the Method

    6: Call the Repository              -   business/               -   locator.get<PersonRepo>().getPerson();
       and receive an Object                person_controller.dart     

    7: Use setState to update           -   ui/home_page.dart       -   setState(() => visiblePerson = person); 
       UI interface