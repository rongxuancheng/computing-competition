#include <iostream>
using namespace std;
#include <cstdio>
#include <cstdlib>
bool vis[50001];
string name[50001];
int fat[50001]; 
int f[7];
string s;
int tot,jfat;

int thash(int x,string s2)
{
	while ((vis[x])&&(name[x]!=s2))
	{
		x++;
		if (x>50000) x=1;
	}
	return x;
}

int main()
{
	f[0]=1;
	for (int i=1; i<=6; i++)
	 f[i]=f[i-1]*26 % 49999 +1;
	while(getline(cin,s),s[0]!='$')
	{ 
		int a[6],total=0;
		
		for (int i=1; i<=6; i++) 
		{
			a[i]=s[i]-65;
			if (a[i]>26) a[i]-=32; 
			a[i]=(a[i]*f[i])%49999+1;
			total=(total+a[i])%49999+1;
		}
		
		string st=s.substr(1,6);
		int mt=thash(total,st);
		
		if (not vis[mt])
		{
		    vis[mt]=true; 
	    	fat[mt]=mt;
			name[mt]=st;
	    }
	    int wm=mt;
		switch (s[0])
		{				
			case '#':
			{
				jfat=wm;
				break;
			};
			case '+':
			{
				fat[wm]=jfat;
				break;
			};
			case '?':
			{
				int x=wm;
				while (fat[x]!=x)
				{
					x=fat[x];
				}
				cout<<name[wm]<<" "<<name[fat[x]]<<"\n";
				break;
			}
		}
	}
}
