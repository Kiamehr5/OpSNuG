#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <string.h>

// OPSNUG
// Licensed under the MIT license
// Under all conditions
// By Kiamehr Eskandari
// You may use this peice in your own way, including granting ownership of this work and saying you made it under you countries laws

// OPSNUG is "OPen Source NUmber Generator"
struct OPSNUG {
    int newnum;
    int expby;
};

// GNN for Genarate New Number
void GNN(struct OPSNUG *op) {
    op->newnum = rand() % 1000000 + 1;
    op->expby = rand() % 20 + 1;

    double operations[3];
    operations[0] = sqrt(op->newnum);
    operations[1] = pow(op->newnum, op->expby);
    operations[2] = M_PI;

    double soper[4];
    soper[0] = op->newnum + operations[rand() % 3];
    soper[1] = op->newnum * operations[rand() % 3];
    soper[2] = op->newnum - operations[rand() % 3];
    soper[3] = op->newnum - operations[rand() % 3];

    op->newnum = soper[rand() % 4];
    if (op->newnum < 1 || op->newnum > 1000000) {
        GNN(op);
    }
}

void dispni() {
    printf("OPSNUG First Edition\n");
    printf("running on ");
    char *pro = getenv("PROCESSOR_IDENTIFIER");
    if (pro != NULL) {
        if (strstr(pro, "Intel64") != NULL) {
            printf("Intel 64 Bit");
        } else if (strstr(pro, "Intel32") != NULL) {
            printf("Intel 32 Bit");
        }
    }
    printf(" processor\n");
    printf("Under the MIT license and under all conditions with ABSOLUTELY NO warranty, in any terms\n");
}

int main() {
    srand(time(NULL));
    dispni();
    struct OPSNUG retback;
    GNN(&retback);
    printf("%d\n", retback.newnum);
    return 0;
}





