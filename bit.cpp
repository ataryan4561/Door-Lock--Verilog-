// C++ implementation of the above approach
#include <bits/stdc++.h>
using namespace std;

void GreyCode(int n)
{
	// power of 2
	for (int i = 0; i < (1 << n); i++)
	{
		// Generating the decimal
		// values of gray code then using
		// bitset to convert them to binary form
		int val = (i ^ (i >> 1));
		
		// Using bitset
		bitset<32> r(val);
		
		// Converting to string
		string s = r.to_string();
		cout <<"#10 x=16'b"<< s.substr(32 - n) <<";"<<"\n";
	}
}


// Driver Code
int main()
{
	int n;
	n = 16;

	// Function call
	GreyCode(n);
	
	return 0;
}
