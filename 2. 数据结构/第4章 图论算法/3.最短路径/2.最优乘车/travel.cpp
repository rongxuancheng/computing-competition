#include<algorithm>
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
#include<vector>
#include<cstdio>
#include<cmath>
#include<ctime>
#include<set>
using namespace std;
int n,m,i,j,k,a[5000]={0},g[5000][5000],s;
char as;
int main()
{
	cin>>m>>n;
	for (i=1; i<=m; i++)
	{
	    s=0; as=1;
		while(as!=10) 
		{
			s++; 
			cin>>a[s];
			as=getchar();
		}
		for(j=1; j<=s-1; j++)
		for(k=j+1; k<=s; k++)
		g[a[j]][a[k]]=1;
		}
	for(i=1; i<=n; i++)	
	for(j=1; j<=n; j++)
	{
		if(g[i][j]==0)  g[i][j]=100000;	
		}
	for(k=1; k<=n; k++)
	for(i=1; i<=n; i++)
	for(j=1; j<=n; j++)
	g[i][j]=min(g[i][j],g[i][k]+g[k][j]);
	if (g[1][n]>=100000) cout<<"NO";
	else cout<<g[1][n]-1;
}
