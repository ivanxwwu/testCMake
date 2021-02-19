#include "mysqrt.h"
#include "TutorialConfig.h"
#include <iostream>
using namespace std;

int add3(int a, int b) {
   return a+b;
}

double mysqrt(double inputValue) {
#if defined(HAVE_LOG)
	cout << "have log" << endl;
#else
	cout << "not have log" << endl;
#endif

#if defined(HAVE_LOG) && defined(HAVE_EXP)
    double result = exp(log(inputValue) * 0.5);
#else
    double result = inputValue;
#endif
 
	return result;
}
