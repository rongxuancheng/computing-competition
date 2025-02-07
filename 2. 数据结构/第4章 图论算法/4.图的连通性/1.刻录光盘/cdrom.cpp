#include<cstdio>
#include<iostream>
#include<cstdlib>
#include<cmath>
#include<cstring>
using namespace std;
long fa[201],c[1001];
bool b[201][201];
int main()
{
	long n,i,j,k,x,r1,r2,s=0;
	cin>>n;
	memset(b,false,sizeof(b));
	for (i=1; i<=n; i++) fa[i]=i;
    for (i=1; i<=n; i++){
		cin>>x;
		while (x!=0) {
			b[i][x]=true;
			cin>>x;  }
    }
	for (k=1; k<=n; k++)
	  for (i=1; i<=n; i++)
	    for (j=1; j<=n; j++){ 
			b[i][j]=b[i][j]||(b[i][k]&&b[k][j]);
        }	
    for (i=1; i<=n; i++)
      for (j=1; j<=n; j++)
        if (b[i][j]==true) fa[j]=fa[i];
	for (i=1; i<=n; i++)  if (fa[i]==i) s++;
	cout<<s;
}
