# Demo App with Riverpod

## Fixing issue

### Проблема:
    При нажатии на экран кружок, не отображается сразу, т.к. UI не обновляется.

### Решение: 
    void addVertex(Offset value) => state.add(value);          << Так работать не будет, UID не обновляется
    void addVertex(Offset value) => state = [...state, value]; << Нужно пересоздавать список с новым элементом

1. В Riverpod хранится список координат точек, и этот список пополняется и очищается.
2. При нажатии на экран GestureDetector отлавливает его и передает координаты для добавления точки
3. В child-e GestureDetector-а CustomPaint, painter которого получает из state-а список точек и 
   рисует их на канве.