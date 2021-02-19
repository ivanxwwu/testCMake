#include <iostream>
#include "TutorialConfig.h"
#include <math.h>
using namespace std;
#ifdef USE_MYMATH
#  include "mysqrt.h"
#endif

int main(int argc, char* argv[]) {
	if (argc < 2) {
		std::cout << argv[0] << " Version " << Tutorial_VERSION_MAJOR << "."
              << Tutorial_VERSION_MINOR << std::endl;
		std::cout << "Usage: " << argv[0] << " number" << std::endl;
		return 1;
	}
	const double inputValue = std::stod(argv[1]);
#ifdef USE_MYMATH
	double result = mysqrt(inputValue);
    std::cout << "Computing sqrt of " << inputValue << " to be " << result
            << " using log and exp" << std::endl;
#else
	double result = sqrt(inputValue);
	cout << inputValue << " is " << result << endl;



#endif
    	return 0;
}
