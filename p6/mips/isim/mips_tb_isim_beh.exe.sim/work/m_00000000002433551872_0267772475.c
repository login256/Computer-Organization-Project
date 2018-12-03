/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/lyt/Documents/project/co/p6/mips/cpu/controller/component/CTreg.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {1U, 0U};



static void Always_42_0(char *t0)
{
    char t13[8];
    char t14[8];
    char t15[8];
    char t40[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;

LAB0:    t1 = (t0 + 4608U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 4928);
    *((int *)t2) = 1;
    t3 = (t0 + 4640);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(43, ng0);

LAB5:    xsi_set_current_line(44, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(60, ng0);

LAB10:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 5, 0LL);
    xsi_set_current_line(62, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    t2 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 5, 0LL);
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 5, 0LL);
    xsi_set_current_line(64, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t15, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t16 = (t9 ^ t10);
    t17 = (t8 | t16);
    t18 = *((unsigned int *)t4);
    t19 = *((unsigned int *)t5);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB14;

LAB11:    if (t20 != 0)
        goto LAB13;

LAB12:    *((unsigned int *)t15) = 1;

LAB14:    memset(t14, 0, 8);
    t12 = (t15 + 4);
    t23 = *((unsigned int *)t12);
    t24 = (~(t23));
    t25 = *((unsigned int *)t15);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t12) != 0)
        goto LAB17;

LAB18:    t29 = (t14 + 4);
    t30 = *((unsigned int *)t14);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB19;

LAB20:    t34 = *((unsigned int *)t14);
    t35 = (~(t34));
    t36 = *((unsigned int *)t29);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t29) > 0)
        goto LAB23;

LAB24:    if (*((unsigned int *)t14) > 0)
        goto LAB25;

LAB26:    memcpy(t13, t40, 8);

LAB27:    t41 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t41, t13, 0, 0, 2, 0LL);
    xsi_set_current_line(65, ng0);
    t2 = (t0 + 2248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 5, 0LL);
    xsi_set_current_line(66, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 5, 0LL);
    xsi_set_current_line(67, ng0);
    t2 = (t0 + 2568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 5, 0LL);
    xsi_set_current_line(68, ng0);
    t2 = (t0 + 2728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t15, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t16 = (t9 ^ t10);
    t17 = (t8 | t16);
    t18 = *((unsigned int *)t11);
    t19 = *((unsigned int *)t12);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB31;

LAB28:    if (t20 != 0)
        goto LAB30;

LAB29:    *((unsigned int *)t15) = 1;

LAB31:    memset(t14, 0, 8);
    t29 = (t15 + 4);
    t23 = *((unsigned int *)t29);
    t24 = (~(t23));
    t25 = *((unsigned int *)t15);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB32;

LAB33:    if (*((unsigned int *)t29) != 0)
        goto LAB34;

LAB35:    t38 = (t14 + 4);
    t30 = *((unsigned int *)t14);
    t31 = *((unsigned int *)t38);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB36;

LAB37:    t34 = *((unsigned int *)t14);
    t35 = (~(t34));
    t36 = *((unsigned int *)t38);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB38;

LAB39:    if (*((unsigned int *)t38) > 0)
        goto LAB40;

LAB41:    if (*((unsigned int *)t14) > 0)
        goto LAB42;

LAB43:    memcpy(t13, t40, 8);

LAB44:    t45 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t45, t13, 0, 0, 2, 0LL);
    xsi_set_current_line(71, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3528);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 5, 0LL);
    xsi_set_current_line(72, ng0);
    t2 = (t0 + 3368);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t15, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t16 = (t9 ^ t10);
    t17 = (t8 | t16);
    t18 = *((unsigned int *)t11);
    t19 = *((unsigned int *)t12);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB48;

LAB45:    if (t20 != 0)
        goto LAB47;

LAB46:    *((unsigned int *)t15) = 1;

LAB48:    memset(t14, 0, 8);
    t29 = (t15 + 4);
    t23 = *((unsigned int *)t29);
    t24 = (~(t23));
    t25 = *((unsigned int *)t15);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB49;

LAB50:    if (*((unsigned int *)t29) != 0)
        goto LAB51;

LAB52:    t38 = (t14 + 4);
    t30 = *((unsigned int *)t14);
    t31 = *((unsigned int *)t38);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB53;

LAB54:    t34 = *((unsigned int *)t14);
    t35 = (~(t34));
    t36 = *((unsigned int *)t38);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB55;

LAB56:    if (*((unsigned int *)t38) > 0)
        goto LAB57;

LAB58:    if (*((unsigned int *)t14) > 0)
        goto LAB59;

LAB60:    memcpy(t13, t40, 8);

LAB61:    t45 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t45, t13, 0, 0, 2, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(45, ng0);

LAB9:    xsi_set_current_line(46, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 5, 0LL);
    xsi_set_current_line(47, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 5, 0LL);
    xsi_set_current_line(48, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 5, 0LL);
    xsi_set_current_line(49, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(50, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 5, 0LL);
    xsi_set_current_line(51, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 5, 0LL);
    xsi_set_current_line(52, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 5, 0LL);
    xsi_set_current_line(53, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(56, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3528);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 5, 0LL);
    xsi_set_current_line(57, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    goto LAB8;

LAB13:    t11 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB14;

LAB15:    *((unsigned int *)t14) = 1;
    goto LAB18;

LAB17:    t28 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB18;

LAB19:    t33 = ((char*)((ng2)));
    goto LAB20;

LAB21:    t38 = (t0 + 1848U);
    t39 = *((char **)t38);
    t38 = ((char*)((ng3)));
    memset(t40, 0, 8);
    xsi_vlog_unsigned_minus(t40, 2, t39, 2, t38, 2);
    goto LAB22;

LAB23:    xsi_vlog_unsigned_bit_combine(t13, 2, t33, 2, t40, 2);
    goto LAB27;

LAB25:    memcpy(t13, t33, 8);
    goto LAB27;

LAB30:    t28 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB31;

LAB32:    *((unsigned int *)t14) = 1;
    goto LAB35;

LAB34:    t33 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t33) = 1;
    goto LAB35;

LAB36:    t39 = ((char*)((ng2)));
    goto LAB37;

LAB38:    t41 = (t0 + 2728);
    t42 = (t41 + 56U);
    t43 = *((char **)t42);
    t44 = ((char*)((ng3)));
    memset(t40, 0, 8);
    xsi_vlog_unsigned_minus(t40, 2, t43, 2, t44, 2);
    goto LAB39;

LAB40:    xsi_vlog_unsigned_bit_combine(t13, 2, t39, 2, t40, 2);
    goto LAB44;

LAB42:    memcpy(t13, t39, 8);
    goto LAB44;

LAB47:    t28 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB48;

LAB49:    *((unsigned int *)t14) = 1;
    goto LAB52;

LAB51:    t33 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t33) = 1;
    goto LAB52;

LAB53:    t39 = ((char*)((ng2)));
    goto LAB54;

LAB55:    t41 = (t0 + 3368);
    t42 = (t41 + 56U);
    t43 = *((char **)t42);
    t44 = ((char*)((ng3)));
    memset(t40, 0, 8);
    xsi_vlog_unsigned_minus(t40, 2, t43, 2, t44, 2);
    goto LAB56;

LAB57:    xsi_vlog_unsigned_bit_combine(t13, 2, t39, 2, t40, 2);
    goto LAB61;

LAB59:    memcpy(t13, t39, 8);
    goto LAB61;

}


extern void work_m_00000000002433551872_0267772475_init()
{
	static char *pe[] = {(void *)Always_42_0};
	xsi_register_didat("work_m_00000000002433551872_0267772475", "isim/mips_tb_isim_beh.exe.sim/work/m_00000000002433551872_0267772475.didat");
	xsi_register_executes(pe);
}
