#include<cstdio>

int main()
{
	int v;
	scanf("%d",&v);
	FILE *fin=fopen("code.txt","r");
	FILE *fout=fopen("code.coe","w");
	fprintf(fout,"memory_initialization_radix=16;\nmemory_initialization_vector=\n");
	bool begin=0;
	unsigned int cur=0;
	while(fscanf(fin,"%x",&cur)!=EOF)
	{
		if(begin)
		{
			fprintf(fout,",\n");
		}
		else
		{
			begin=1;
		}
		fprintf(fout,"%08x",cur);
	}
	fprintf(fout,";");
}