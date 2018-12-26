#include <cstdio>

int main()
{
	int v;
	scanf("%d", &v);
	FILE *fin = fopen("code.txt", "r");
	FILE *fin_handler = fopen("handler.txt", "r");
	FILE *fout = fopen("code.coe", "w");
	fprintf(fout, "memory_initialization_radix=16;\nmemory_initialization_vector=\n");
	bool begin = 0;
	unsigned int cur = 0;
	int line = 0x3000;
	while (fscanf(fin, "%x", &cur) != EOF)
	{
		line+=4;
		if (begin)
		{
			fprintf(fout, ",\n");
		}
		else
		{
			begin = 1;
		}
		fprintf(fout, "%08x", cur);
	}
	if (v)
	{
		for (int i = line; i < 0x4180; i+=4)
		{
			fprintf(fout, ",\n");
			fprintf(fout, "%08x", 0);
		}
		while (fscanf(fin_handler, "%x", &cur) != EOF)
		{
			fprintf(fout, ",\n");
			fprintf(fout, "%08x", cur);
		}
	}
	fprintf(fout, ";");
	return 0;
}