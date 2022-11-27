#include <stdio.h>
#include <math.h>

double calculatePi(double precision) {
    double original_pi = 3.1415926535;
    double calculated_pi = 0;
    double dz = 0;
    int n = 1;
    while (original_pi - calculated_pi > precision) {
        dz += 1.0 / (n * n);
        calculated_pi = sqrt(6 * dz);
        ++n;
    }
    return calculated_pi;
}

int main() {
    double precision;
    printf("Input precision (not less than 0.0001): ");
    scanf("%lf", &precision);
    printf("Calculated pi = %lf\n", calculatePi(precision));
}
