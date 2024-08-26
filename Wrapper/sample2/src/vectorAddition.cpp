#include "vectorAddition.h"

vectorAddition::vectorAddition() {
    this->multiplier = 5.f;
}

float vectorAddition::multiply(float input) {
    return input * this->multiplier;
}