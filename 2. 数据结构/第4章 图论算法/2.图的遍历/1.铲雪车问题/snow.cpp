#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <iomanip>
#include <iostream>
using namespace std;
long double solve(int,int,int,int);
int mround(long double);
int startx,starty,endx,endy;
unsigned int h,m;
long double tot = 0;
int main()
{
	cin>>startx>>starty;
	while (cin>>startx>>starty>>endx>>endy)
		tot += solve(startx,starty,endx,endy);
	h = floor(tot) - 1;
	m = mround(60 * (tot - h));
	if (m >= 60)
	{
		m -= 60;
		h++;
	}
	cout<<h<<":";
	if (m < 10) cout<<"0";
	cout<<m<<endl;
	return 0;
}
long double solve(int a,int b,int c,int d)
{
	long double x,y;
	x = abs(a - c);
	y = abs(b - d);
	return sqrt(x * x + y * y) / 10000;
}
int mround(long double inp)
{
	if (inp - floor(inp) >= 0.5)
		return floor(inp) + 1;
	else
		return floor(inp);
}

