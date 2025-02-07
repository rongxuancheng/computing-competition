#include<iostream>
#include<cstdio>
#include<cstring>
#include<algorithm>
using namespace std;

struct Point{
    int x,y,value;
    bool operator<(const Point &aa)const{
	return value<aa.value;
    }
}point[20000];
    
int f[3000],sum=0;

int Find_f(int x){ 
    if (f[x]!=x) f[x]=Find_f(f[x]);
    return f[x];
}

int check(int x,int y){ 
    return Find_f(x)!=Find_f(y);
}

int main(){
    freopen("liaison.in","r",stdin);
    freopen("liaison.out","w",stdout);
    int n,m,ans=0;
    scanf("%d%d",&n,&m);
    for (int i=1; i<=n; ++i) f[i]=i;
    for (int i=0; i<m; ++i){
	int p,x,y,val;
	scanf("%d%d%d%d",&p,&x,&y,&val);
	if (p==1){
	    ans+=val;  f[Find_f(x)]=Find_f(y);
	}
	else {point[sum].x=x; point[sum].y=y; point[sum++].value=val;}
    } 
    sort(point,point+sum);
    for (int i=0; i<sum; ++i)
	if (check(point[i].x,point[i].y)){
	    f[Find_f(point[i].x)]=Find_f(point[i].y);
	    ans+=point[i].value;
	}
    cout<<ans;
    fclose(stdin);   fclose(stdout);
}
