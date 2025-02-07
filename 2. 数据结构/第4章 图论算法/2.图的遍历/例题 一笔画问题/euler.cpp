#include<iostream>
#include<cstdio>
#include<cmath>
using namespace std;
int f(long i);
int a[1000][1000],b[1000],c[1000],n,m,s=0,t,i,j,y,z;;
int main ()
{
	cin>>n>>m;
	for (i=1; i<=1000; i++)
	  for (j=1; j<=1000; j++)
	  a[i][j]=0;
	for (i=1; i<=m; i++)
	{
		cin>>y>>z;
		a[y][z]=1;
		a[z][y]=1;
		b[y]++;
		b[z]++;
    }
	t=1;
	for (i=1; i<=n; i++)
	{
			if (b[i]%2==1) t=i; 	}
	f(t);
	for (i=1; i<=s; i++)
		cout<<c[i]<<" ";
}
int f( long i)
{
	int j;
	for (j=1; j<=n; j++)
	if (a[i][j]==1) 
	{
		a[i][j]=0;
		a[j][i]=0;
		f(j);
	}
		s=s+1;
		c[s]=i;
	
}
