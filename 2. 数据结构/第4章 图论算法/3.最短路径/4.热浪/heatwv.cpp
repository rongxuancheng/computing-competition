#include <cstdio>
#include <cstdlib>
#include <vector>
#include <cstring>
#include <queue>
using namespace std;
const int MAXN=2501;
typedef vector<int> Vec;
Vec Map[MAXN],Val[MAXN];
int N,M,S,T;
 
void init()
{
	scanf("%d %d %d %d\n",&N,&M,&S,&T);
 
	int a,b,v;
	for(int i=1;i<=M;i++)
	{
		scanf("%d %d %d\n",&a,&b,&v);
		Map[a].push_back(b);
		Val[a].push_back(v);
		Map[b].push_back(a);
		Val[b].push_back(v);
	}
}
 
int dist[MAXN];
int flag[MAXN];
const int INF=1000000000;
queue<int>Q;
void SPFA()
{
	for(int i=1;i<=N;i++)
		dist[i]=INF,flag[i]=0;
	dist[S]=0,flag[S]=1;
	Q.push(S);
	int t,tmp;
	while(!Q.empty())
	{
		t=Q.front();
		Q.pop();
		flag[t]=0;
		for(unsigned int i=0;i<Map[t].size();i++)
		{
			tmp=dist[t]+Val[t][i];
			if(tmp<dist[Map[t][i]])
			{
				dist[Map[t][i]]=tmp;
				if(!flag[Map[t][i]])
				{
					Q.push(Map[t][i]);
					flag[Map[t][i]]=1;
				}
			}
		}
	}
	printf("%d\n",dist[T]);
	return;
}
 
int main()
{
	freopen("heatwv.in","r",stdin);
	freopen("heatwv.out","w",stdout);
	init();
	SPFA();
	return 0;
}