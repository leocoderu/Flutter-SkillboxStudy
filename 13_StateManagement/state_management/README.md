# state_management

A Flutter project with State Management and Clear Architecture

## Getting Started


Usability commands:

Очистка проекта: flutter clean
Получение пакетов: flutter pub get
Обновление зависимостей: flutter packages upgrade

Запуск кодогенерации: flutter packages pub run build_runner build
Команда для запуска интеграционного теста: flutter drive --target=test_driver/app.dart

Dependencies of packages in Project: 

                ------------------- Analyzer --------------------------------------------
                |                   analyzer_sm                     |                   |
                |                       |                           |                   |
                V                       V                           V                   V
          Layer UI          <---    Business layer      <---    Data Layer  <---    ?Repository?
          state_management          business_sm                 data_sm             ?repo-sm?
                ^                       ^                           ^                   ^
                |                       |                           |                   |
                -----------------   Model Data  -----------------------------------------
                                    model_sm

dependencies:
    Анализатор кода сведен в отдельный пакет "packages/analyzer_sm" и подключен к остальным пакетам.
    fluro: ^2.0.4       -   Organization of routing with Fluro
    provider: ^6.0.4    -   For Simple state management

TODO:

    1. Simple State Management

    Z. Tests