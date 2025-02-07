#include <iostream>
using namespace std;
#include <cstdio>
#include <cstring>

int next[1000001],back[1000001],last[1001];
bool ena[1001],vis[1001];
int tot,wxd;
int n;

void add_edge(int a,int b)
{
	tot++;
	next[tot]=b;
	back[tot]=last[a];
	last[a]=tot;
}

void dfs(int x)
{
	vis[x]=true;
	int i=last[x];
	while (i!=0)
	{
		int v=next[i];
		if (not ena[v]&&not vis[v])
		{
			wxd++;
			dfs(v);
		}
		i=back[i];
	} 
}

bool check(int x)
{
	memset(vis,false,sizeof(vis));
	bool mark=true;
	
	for (int i=1; i<=x; i++) ena[i]=true;
	
	for (int i=1; i<=n; i++)
	  if (not vis[i]&&not ena[i])
	  {
	  	wxd=1;
	  	dfs(i);
	  	if (wxd>n/2)
	  	{
	  		mark=false;
	  		break;
		}
	  }
	
	for (int i=1; i<=x; i++) ena[i]=false;
	
	return mark;
	
}

int main()
{
	cin>>n;
	for (int i=1; i<=n; i++)
	{
		int k; cin>>k;
		int x;
		for (int j=1; j<=k; j++) 
		{
			cin>>x;
			add_edge(i,x);
		}
	} 
	int l=1,r=n,mid=0;
	do
	{
		mid=(l+r)/2;
		if (check(mid)) r=mid;
		else l=mid+1;
	}
	while (l+1<=r);
	if (check(l)) cout<<l;
	else cout<<r; 
}

