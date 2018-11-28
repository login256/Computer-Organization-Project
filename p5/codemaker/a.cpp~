#include<cstdio>

char new1[4][1000]={"","lui $30, 0x1234","addu $30, $28, $29","lw $30,0($0)"};
char new2[4][1000]={"","jal j_%d","subu $31, $29, $28","lw $31,0($0)"};
char new3[4][1000]={"","lui $31, 0x1234","addu $30, $28, $29","lw $31,0($0)"};
char use[3][1000]={"beq $30, $31, next_%d","addu $1, $30, $31","sw $31, 4($0)"};

int main()
{
	freopen("sample2.asm","w",stdout);
	puts("ori $28, $0, 0x1234");
	puts("ori $29, $0, 0x5678");
	puts("sw $29, 0($0)");
	int cnt=0;
	for(int i=1;i<=3;i++)
	{
		for(int j=1;j<=3;j++)
		{
			for(int k=1;k<=3;k++)
			{
				for(int l=0;l<=2;l++)
				{
					cnt++;
					puts(new1[i]);
					if(j==1)
					{
						printf(new2[j],cnt);
						putchar(10);
					}
					else
						puts(new2[j]);
					puts(new3[k]);
					printf("j_%d:\n",cnt);
					if(l==0)
					{
						printf(use[l],cnt);
						putchar(10);
					}
					else
						puts(use[l]);
					puts("nop");
					printf("next_%d:\n",cnt);
					puts("nop");
					puts("nop");
					puts("nop");
					puts("nop");;
					puts("nop");
				}
			}
		}
	}
}
