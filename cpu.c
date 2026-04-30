#include <stdio.h>
#include <unistd.h>

long double get_cpu_usage() {
    FILE *f;
    long double a[4], b[4];

    f = fopen("/proc/stat", "r");
    fscanf(f, "%*s %Lf %Lf %Lf %Lf", &a[0], &a[1], &a[2], &a[3]);
    fclose(f);

    sleep(1);

    f = fopen("/proc/stat", "r");
    fscanf(f, "%*s %Lf %Lf %Lf %Lf", &b[0], &b[1], &b[2], &b[3]);
    fclose(f);

    return ((b[0]+b[1]+b[2]) - (a[0]+a[1]+a[2])) /
           ((b[0]+b[1]+b[2]+b[3]) - (a[0]+a[1]+a[2]+a[3]));
}

int main() {
    FILE *f = fopen("cpu_usage.txt", "w");

    for (int i = 0; i < 10; i++) {
        long double w = get_cpu_usage();
        fprintf(f, "%.2Lf%%\n", w * 100);
        printf("%.2Lf%%\n", w * 100);
        sleep(5);
    }

    fclose(f);
    return 0;
}

// gcc cpu.c -o out
// chmod +x out
// ./out