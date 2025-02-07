#include <iostream>
using namespace std;
#include <cstdio>

bool print[101];
int fat[101][101];
int main()
{
	int n,m=0;
	cin>>n;
	for (int i=1; i<=n; i++)
	{
		int t;
		while (cin>>t,t!=0)
		{
			fat[t][0]++;
			fat[t][fat[t][0]]=i;
		}
	}
	while (m<n)
	{
		for (int i=1; i<=n; i++)
		{
			if (print[i]) continue;
			bool flag=true;
			for (int j=1; j<=fat[i][0]; j++)
			  if (not print[fat[i][j]]) 
			  {
			  	flag=false;
			  	break;
			  }
			if (flag) 
			{
				m++;
				print[i]=true;
				cout<<i<<" ";
				break;
		    }
		}
	}
}
