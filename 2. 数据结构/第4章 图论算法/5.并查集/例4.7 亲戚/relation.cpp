#include <cstdio>
#include <iostream>
using namespace std;
const int maxn = 20005;
void myunion(int raa,int rbb);
int myfind(int poi);
int father[maxn];
int ra,rb,m,n,i,j,x,y,q;
int main()
{
	scanf("%d%d",&n,&m);
	for (i = 1;i <= n;i++)
		father[i] = i;
	for (i = 1;i <= m;i++)
	{
		scanf("%d%d",&x,&y);
		ra = myfind(x);rb = myfind(y);
		if (ra != rb)
			myunion(ra,rb);
	}
	scanf("%d",&q);
	for (i = 1;i <= q;i++)
	{
		scanf("%d%d",&x,&y);
		if (myfind(x) == myfind(y))
			printf("Yes\n");
		else
			printf("No\n");
	}
}
void myunion(int raa,int rbb)
{
	int x = myfind(raa);
	int y = myfind(rbb);
	father[x] = y;
	return;
}
int myfind(int poi)
{
	if (father[poi] != poi)
		father[poi] = myfind(father[poi]);
	return father[poi];
}

