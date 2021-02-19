#include <iostream>
#include "TutorialConfig.h"
#include <math.h>
using namespace std;
#ifdef USE_MYMATH
#  include "mysqrt.h"
#endif

int main() {
#ifdef USE_MYMATH
	int c = add3(4,5);
#else
	int c = max(3,4);
#endif
	cout << c << endl;

    cout << "Helloworld!" << endl;
	cout << Tutorial_VERSION_MAJOR << endl;
	cout << Tutorial_VERSION_MINOR << endl;
}
