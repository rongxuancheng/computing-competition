#include<cstdio>
#include<cstring>
#define min(a,b) ((a)<(b)?(a):(b))
long long f[80][80];
int main(void)
{
	int n,s;
	memset(f,0x3f,sizeof(f));
	scanf("%d",&n);
	scanf("%d",&s); s--;
	for (int i=0;i<n;i++)
	{
		for (int t=0;t<n;t++)
			if (scanf(" %I64d",&f[i][t])==0)
				getchar();
	}
	/*fprintf(stderr,"%d\n%d\n",n,s+1);
	for (int i=0;i<n;i++)
	{
		for (int t=0;t<n;t++)
			fprintf(stderr,"%8d ",f[i][t]);
		fputs("",stderr);
	}*/
	f[s][s]=0;
	for (int k=0;k<n;k++)
		for (int i=0;i<n;i++)
			for (int j=0;j<n;j++)
				f[i][j]=min(f[i][j],f[i][k]+f[k][j]);
	for (int t=0;t<n;t++)
		if (t!=s)
			printf("(%d -> %d) = %I64d\n",s+1,t+1,f[s][t]);	//printf("(%I64d -> %I64d) = %I64d\n",s+1,t+1,f[s][t]);
	return 0;
}

