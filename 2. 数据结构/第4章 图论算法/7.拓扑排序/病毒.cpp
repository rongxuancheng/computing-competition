#include <iostream>
using namespace std;
#include <cstdio>
#include <cstdlib>
#include <cmath>

int qm[27],sd[27],dy[27];
string s[50001];
int next[1000],back[1000],last[1000];
bool yt[27][27];
int tot,cmax;
bool cx[27];

void add_edge(int a,int b)
{
	tot++;
	next[tot]=b;
	back[tot]=last[a];
	last[a]=tot;
}

void dfs(int x,int t)
{
	if (t>sd[x]) sd[x]=t;
	int i=last[x];
	while (i!=0)
	{
		int v=next[i];
		if (sd[v]<=t) dfs(v,t+1); 
		i=back[i];
	}
}

void error()
{
	cout<<"0";
	exit (0);
}

int main()
{
	int k;
	cin>>k;
	for (int i=0; i<=k; i++)
	{
		getline(cin,s[i]);
	}
	
	for (int i=2; i<=k; i++)
	{
		int l1=s[i-1].size(); 
		int l2=s[i].size();
		
		for (int j=0; j<=min(l1,l2)-1; j++)
		{
			int t1=s[i-1][j]-96;
			int t2=s[i][j]-96;
			cmax=max(t1,max(t2,cmax));
			if (t1==t2) continue;
			if (yt[t2][t1]) error();
			qm[t2]++;
			yt[t1][t2]=true;
			add_edge(t1,t2);
			break;
		}
	}

	for (int i=1; i<=cmax; i++)
	{
		if (qm[i]==0) dfs(i,1);
	}
	
	string que,ans="";
	getline(cin,que);
 	for (int i=0; i<=que.size()-1; i++)
	{
		if (cx[sd[que[i]-96]]) error();
		cx[sd[que[i]-96]]=true;
  		if (sd[que[i]-96]==0) error();
		ans=ans+(char (sd[que[i]-96]+96));
	}
	cout<<ans;
}

