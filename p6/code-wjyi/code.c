#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define SCALE 40
#define REG_NUM 3 
#define REG_BEGIN 8

int main(){
	char cal_r[11][10]={"addu","subu","and","or","xor","nor","slt","sltu","sllv","srlv","srav"};
	char cal_i[6][10]={"addiu","andi","ori","xori","slti","sltiu"};
	char shift_sa[3][10]={"sll","srl","sra"};
	char s_l_w[2][10]={"sw","lw"};
	char s_l_h[3][10]={"lh","lhu","sh"};
	char s_l_b[3][10]={"lb","lbu","sb"};
	char mu_di[6][10]={"mult","multu","div","divu"};
	char mft[4][10]={"mflo","mfhi","mtlo","mthi"};
	int i,j,select, t;
	FILE* fp;
	fp=fopen("code.txt","w");
	for(t=0;t<20;t++)
    {
        srand( (unsigned)time( NULL ) );
        for(i=REG_BEGIN;i<REG_BEGIN+REG_NUM;i++){
            fprintf(fp,"li $%d,0x%x\n",i, rand()%2073741824);
       /*     for(j=0;j<8;j++){
                select=rand()%2;
                if(select){
                    fprintf(fp,"%c",'a'+rand()%6);
                }
                else{
                    fprintf(fp,"%c",'0'+rand()%10);
                }
            }*/
        }
        srand( (unsigned)time( NULL ) );
        for(i=0;i<SCALE;i++){
            select=rand()%9;
            switch(select){
                case 0: fprintf(fp,"%s $%d,$%d,$%d\n",cal_r[rand()%11],rand()%REG_NUM + REG_BEGIN,rand()%REG_NUM + REG_BEGIN,rand()%REG_NUM + REG_BEGIN);break;
                case 1: fprintf(fp,"%s $%d,$%d,%d\n",cal_i[rand()%6],rand()%REG_NUM + REG_BEGIN,rand()%REG_NUM + REG_BEGIN,rand()%32768);break;
                case 2: fprintf(fp,"lui $%d,%d\n",rand()%REG_NUM + REG_BEGIN,rand()%32768);break;
                case 3: fprintf(fp,"%s $%d,$%d,%d\n",cal_i[rand()%6],rand()%REG_NUM + REG_BEGIN,rand()%REG_NUM + REG_BEGIN,rand()%32768);break;
                    //fprintf(fp,"%s $%d,$%d,%d\n",shift_sa[rand()%3],rand()%REG_NUM + REG_BEGIN,rand()%REG_NUM + REG_BEGIN,rand()%32);break;
                case 4: fprintf(fp,"%s $%d,%d($zero)\n",s_l_w[rand()%2],rand()%REG_NUM + REG_BEGIN,4*(rand()%25)+3000);break;
                case 5: fprintf(fp,"%s $%d,%d($zero)\n",s_l_h[rand()%3],rand()%REG_NUM + REG_BEGIN,2*(rand()%50)+3000);break;
                case 6: fprintf(fp,"%s $%d,%d($zero)\n",s_l_b[rand()%3],rand()%REG_NUM + REG_BEGIN,rand()%100+3000);break;
                case 7: fprintf(fp,"%s $%d,$%d\n",mu_di[rand()%4],rand()%REG_NUM + REG_BEGIN,rand()%REG_NUM + REG_BEGIN);break;
                case 8: fprintf(fp,"%s $%d\n",mft[rand()%4],rand()%REG_NUM + REG_BEGIN);break;
                default: break;
            }
        }
    }

	fclose(fp);
	return 0;
}

