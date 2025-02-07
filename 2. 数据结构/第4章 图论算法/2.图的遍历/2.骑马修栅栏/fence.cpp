#include<iostream>
#include<cstdio>
#include<cmath>
using namespace std;
int g[2000][2000],du[2000],c[2000];
int i,j,n,x,y,ma=-1000001,mi=1000001,s,k;
int find (int x);
int main ()
{
	cin>>n;
	for (i=1; i<=n; i++)
	{
		cin>>x>>y;
		g[x][y]++;
		g[y][x]++;
		du[x]++;
		du[y]++;
		if (x<mi) mi=x;
		if (y>ma) ma=y;
	}
	for (i=mi; i<=ma; i++)
	  {
	     if (du[i]%2==1) break;
	  }
	if (i==ma) find(mi);
          else find(i);
	  
	for (i=k; i>=1; i--)
	    cout<<c[i]<<endl;
}
int find(int x)
{
	int j;
	j=0;
	for (j=mi; j<=ma; j++)
	  if (g[x][j]>0)
	 {
	     g[x][j]--;
	     g[j][x]--;
             find(j);
	 }
	 k=k+1;
	 c[k]=x;
}