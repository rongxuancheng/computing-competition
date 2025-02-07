#include<iostream>
#include<cstdio>
#include<cmath>
#include<cstdlib>
#include<cstring>
using namespace std;
long b[1600],dis[1600],w[1600][1600],tm[1605],a[1600][1600];
bool ex[1600]={false};
int main ()
{
	long long n,p,c,i,j,x,y,ma,head,tail,s=0,u;
	cin>>n>>p>>c; 
	for (i=1; i<=n; i++)
	  cin>>b[i];
	for(i=1; i<=c; i++)
	{
		cin>>x>>y; cin>>w[x][y];
		a[x][0]++;
		a [x][a[x][0]]=y;
		a[y][0]++;
		a[y][a[y][0]]=x;
		w[y][x]=w[x][y];
	}
	ma=1000001;
	for (i=1; i<=p; i++)
	{
	{
		for(j=1; j<=c; j++)dis[j]=1000001;
	    for (j=1; j<=p; j++)ex[j]=false; 
	    dis[i]=0; tm[1]=i; head=0; tail=1; ex[i]=true; s=0;
		do
		{
			head=head%1061+1;
			u=tm[head];  ex[u]=false;
			for (j=1; j<=a[u][0];  j++)
			if (dis[a[u][j]]>dis[u]+w[u][a[u][j]])
			{
			dis[a[u][j]]=dis[u]+w[u][a[u][j]];
			if (ex[a[u][j]]==false)
			{
				tail=tail%1061+1;
				tm[tail]=a[u][j];
				ex[a[u][j]]=true;
			}
			}
		}while (head!=tail);
	}
	for (j=1; j<=n; j++)
	{
	s=s+dis[b[j]];
	}
	if (s<ma) ma=s;}
	cout<<ma;
}
