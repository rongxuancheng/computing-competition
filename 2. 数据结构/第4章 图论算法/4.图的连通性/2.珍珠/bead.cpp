#include<cstdio>
#include<iostream>
#include<cmath>
using namespace std;
int a[100][100]={0},b[100][100]={0},e[1000]={0},d[1000]={0};
int main ()
{
	int i,j,n,m,s=0,y,z,k;
	cin>>n>>m;
	for (i=1; i<=m; i++)
	{
	  cin>>y>>z;
	  a[y][z]=1;
	  b[z][y]=1;
	}
	  for (i=1; i<=n; i++)
	    for (j=1; j<=n; j++)
		  for (k=1; k<=n; k++)
	    {
		if ((a[i][j]==1)&&(a[j][k]==1)&&(i!=k)) { a[i][k]=1; b[k][i]=1;}
		if ((b[i][j]==1)&&(b[j][k]==1)&&(i!=k)) { b[i][k]=1; a[k][i]=1;}
		}
	for (i=1; i<=n; i++)
	for (j=1; j<=n; j++)
	{
	if (a[i][j]==1)d[i]++;
	if (b[i][j]==1)e[i]++;
	}
	for (i=1; i<=n; i++)
	if ((d[i]>=(n+1)/2)||(e[i]>=(n+1)/2)) s=s+1;
	cout<<s;
}
