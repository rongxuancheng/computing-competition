#include<cstdio>
#include<cstring>
#define MAXN 2000001
int f[6];
int father[MAXN+1];
char table[MAXN+1][8];
char hash[MAXN+1];
int fhash(char * p)
{
	int h=p[0]-'A';
	for (int i=1;i<6;i++)
	{
		h+=f[i]*(p[i]-'A');
		if (h>=MAXN) h%=MAXN;
	}
	while (hash[h]&&strcmp(p,table[h])!=0) {
		h++;
		if (h>=MAXN) h%=MAXN;
	}
	hash[h]=1;
	strcpy(table[h],p);
	return h;
}

void print(int x)
{
	if (father[x]==-1) printf("%s\n",table[x]);
	else print(father[x]);
}

int main(void)
{
	memset(father,255,sizeof(father));
	f[0]=1;
	for (int i=1;i<6;i++)
		f[i]=f[i-1]*26;
	char s[10];
	int fatmp;
	while (1)
	{
		gets(s);
		if (s[0]=='$') break;
		if (s[0]=='#') fatmp=fhash(s+1);
		if (s[0]=='+') father[fhash(s+1)]=fatmp;
		if (s[0]=='?') 
		{
			printf("%s ",s+1);
			print(fhash(s+1));
		}
	}
	return 0;
}
