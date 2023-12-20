#include <time.h>
#include <stdio.h>

int get_value() {
    srand(time(NULL));
    int r = rand() % 500;
    return r;
}