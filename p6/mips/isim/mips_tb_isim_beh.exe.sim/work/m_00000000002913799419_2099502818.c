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
static const char *ng0 = "C:/Users/lyt/Documents/project/co/p6/mips/cpu/datapath/component/multiplier.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {0U, 0U};
static int ng3[] = {5, 0};
static unsigned int ng4[] = {1U, 0U};
static unsigned int ng5[] = {2U, 0U};
static int ng6[] = {10, 0};
static unsigned int ng7[] = {3U, 0U};
static unsigned int ng8[] = {4U, 0U};
static int ng9[] = {32, 0};



static void Cont_36_0(char *t0)
{
    char t3[8];
    char t7[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    char *t47;
    unsigned int t48;
    unsigned int t49;
    char *t50;
    unsigned int t51;
    unsigned int t52;
    char *t53;

LAB0:    t1 = (t0 + 4448U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 2728);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = ((char*)((ng1)));
    memset(t7, 0, 8);
    t8 = (t5 + 4);
    t9 = (t6 + 4);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t8);
    t14 = *((unsigned int *)t9);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t8);
    t18 = *((unsigned int *)t9);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB7;

LAB4:    if (t19 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t7) = 1;

LAB7:    memset(t3, 0, 8);
    t23 = (t7 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t7);
    t27 = (t26 & t25);
    t28 = (t27 & 1U);
    if (t28 != 0)
        goto LAB11;

LAB9:    if (*((unsigned int *)t23) == 0)
        goto LAB8;

LAB10:    t29 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t29) = 1;

LAB11:    t30 = (t3 + 4);
    t31 = (t7 + 4);
    t32 = *((unsigned int *)t7);
    t33 = (~(t32));
    *((unsigned int *)t3) = t33;
    *((unsigned int *)t30) = 0;
    if (*((unsigned int *)t31) != 0)
        goto LAB13;

LAB12:    t38 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t38 & 1U);
    t39 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t39 & 1U);
    t40 = (t0 + 5640);
    t41 = (t40 + 56U);
    t42 = *((char **)t41);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    memset(t44, 0, 8);
    t45 = 1U;
    t46 = t45;
    t47 = (t3 + 4);
    t48 = *((unsigned int *)t3);
    t45 = (t45 & t48);
    t49 = *((unsigned int *)t47);
    t46 = (t46 & t49);
    t50 = (t44 + 4);
    t51 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t51 | t45);
    t52 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t52 | t46);
    xsi_driver_vfirst_trans(t40, 0, 0);
    t53 = (t0 + 5512);
    *((int *)t53) = 1;

LAB1:    return;
LAB6:    t22 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t3) = 1;
    goto LAB11;

LAB13:    t34 = *((unsigned int *)t3);
    t35 = *((unsigned int *)t31);
    *((unsigned int *)t3) = (t34 | t35);
    t36 = *((unsigned int *)t30);
    t37 = *((unsigned int *)t31);
    *((unsigned int *)t30) = (t36 | t37);
    goto LAB12;

}

static void Cont_42_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 4696U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 3368);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5704);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t4, 8);
    xsi_driver_vfirst_trans(t5, 0, 31);
    t10 = (t0 + 5528);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Cont_43_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 4944U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 3528);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5768);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t4, 8);
    xsi_driver_vfirst_trans(t5, 0, 31);
    t10 = (t0 + 5544);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Always_46_3(char *t0)
{
    char t14[8];
    char t36[16];
    char t40[8];
    char t45[8];
    char t55[16];
    char t59[8];
    char t64[8];
    char t73[16];
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
    int t13;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t37;
    char *t38;
    char *t39;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t46;
    char *t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    char *t56;
    char *t57;
    char *t58;
    char *t60;
    char *t61;
    char *t62;
    char *t63;
    char *t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    char *t74;
    char *t75;

LAB0:    t1 = (t0 + 5192U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 5560);
    *((int *)t2) = 1;
    t3 = (t0 + 5224);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(47, ng0);

LAB5:    xsi_set_current_line(48, ng0);
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

LAB7:    xsi_set_current_line(58, ng0);

LAB10:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB11;

LAB12:    xsi_set_current_line(88, ng0);

LAB31:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 2728);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t11 = ((char*)((ng4)));
    memset(t14, 0, 8);
    t12 = (t5 + 4);
    t15 = (t11 + 4);
    t6 = *((unsigned int *)t5);
    t7 = *((unsigned int *)t11);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t12);
    t10 = *((unsigned int *)t15);
    t16 = (t9 ^ t10);
    t17 = (t8 | t16);
    t18 = *((unsigned int *)t12);
    t19 = *((unsigned int *)t15);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB35;

LAB32:    if (t20 != 0)
        goto LAB34;

LAB33:    *((unsigned int *)t14) = 1;

LAB35:    t24 = (t14 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t14);
    t28 = (t27 & t26);
    t29 = (t28 != 0);
    if (t29 > 0)
        goto LAB36;

LAB37:
LAB38:    xsi_set_current_line(108, ng0);
    t2 = (t0 + 2728);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t11 = ((char*)((ng1)));
    memset(t14, 0, 8);
    t12 = (t5 + 4);
    t15 = (t11 + 4);
    t6 = *((unsigned int *)t5);
    t7 = *((unsigned int *)t11);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t12);
    t10 = *((unsigned int *)t15);
    t16 = (t9 ^ t10);
    t17 = (t8 | t16);
    t18 = *((unsigned int *)t12);
    t19 = *((unsigned int *)t15);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB53;

LAB52:    if (t20 != 0)
        goto LAB54;

LAB55:    t24 = (t14 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t14);
    t28 = (t27 & t26);
    t29 = (t28 != 0);
    if (t29 > 0)
        goto LAB56;

LAB57:
LAB58:
LAB13:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(49, ng0);

LAB9:    xsi_set_current_line(50, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 32, 0LL);
    xsi_set_current_line(51, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3528);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(52, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(53, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(54, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    goto LAB8;

LAB11:    xsi_set_current_line(60, ng0);

LAB14:    xsi_set_current_line(61, ng0);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);
    t4 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 32, 0LL);
    xsi_set_current_line(62, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    t2 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 3, 0LL);
    xsi_set_current_line(64, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);

LAB15:    t2 = ((char*)((ng2)));
    t13 = xsi_vlog_unsigned_case_compare(t3, 3, t2, 3);
    if (t13 == 1)
        goto LAB16;

LAB17:    t2 = ((char*)((ng4)));
    t13 = xsi_vlog_unsigned_case_compare(t3, 3, t2, 3);
    if (t13 == 1)
        goto LAB18;

LAB19:    t2 = ((char*)((ng5)));
    t13 = xsi_vlog_unsigned_case_compare(t3, 3, t2, 3);
    if (t13 == 1)
        goto LAB20;

LAB21:    t2 = ((char*)((ng7)));
    t13 = xsi_vlog_unsigned_case_compare(t3, 3, t2, 3);
    if (t13 == 1)
        goto LAB22;

LAB23:    t2 = ((char*)((ng8)));
    t13 = xsi_vlog_unsigned_case_compare(t3, 3, t2, 3);
    if (t13 == 1)
        goto LAB24;

LAB25:    t2 = ((char*)((ng8)));
    t13 = xsi_vlog_unsigned_case_compare(t3, 3, t2, 3);
    if (t13 == 1)
        goto LAB26;

LAB27:
LAB28:    goto LAB13;

LAB16:    xsi_set_current_line(67, ng0);
    t4 = ((char*)((ng3)));
    t5 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 4, 0LL);
    goto LAB28;

LAB18:    xsi_set_current_line(69, ng0);
    t4 = ((char*)((ng3)));
    t5 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 4, 0LL);
    goto LAB28;

LAB20:    xsi_set_current_line(71, ng0);
    t4 = ((char*)((ng6)));
    t5 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 4, 0LL);
    goto LAB28;

LAB22:    xsi_set_current_line(73, ng0);
    t4 = ((char*)((ng6)));
    t5 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 4, 0LL);
    goto LAB28;

LAB24:    xsi_set_current_line(75, ng0);

LAB29:    xsi_set_current_line(76, ng0);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);
    t4 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 32, 0LL);
    xsi_set_current_line(77, ng0);
    t2 = ((char*)((ng1)));
    t4 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t4, t2, 0, 0, 4, 0LL);
    goto LAB28;

LAB26:    xsi_set_current_line(80, ng0);

LAB30:    xsi_set_current_line(81, ng0);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);
    t4 = (t0 + 3528);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 32, 0LL);
    xsi_set_current_line(82, ng0);
    t2 = ((char*)((ng1)));
    t4 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t4, t2, 0, 0, 4, 0LL);
    goto LAB28;

LAB34:    t23 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB35;

LAB36:    xsi_set_current_line(90, ng0);

LAB39:    xsi_set_current_line(91, ng0);
    t30 = (t0 + 3208);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);

LAB40:    t33 = ((char*)((ng2)));
    t13 = xsi_vlog_unsigned_case_compare(t32, 3, t33, 3);
    if (t13 == 1)
        goto LAB41;

LAB42:    t2 = ((char*)((ng4)));
    t13 = xsi_vlog_unsigned_case_compare(t32, 3, t2, 3);
    if (t13 == 1)
        goto LAB43;

LAB44:    t2 = ((char*)((ng5)));
    t13 = xsi_vlog_unsigned_case_compare(t32, 3, t2, 3);
    if (t13 == 1)
        goto LAB45;

LAB46:    t2 = ((char*)((ng7)));
    t13 = xsi_vlog_unsigned_case_compare(t32, 3, t2, 3);
    if (t13 == 1)
        goto LAB47;

LAB48:
LAB49:    goto LAB38;

LAB41:    xsi_set_current_line(93, ng0);
    t37 = (t0 + 2888);
    t38 = (t37 + 56U);
    t39 = *((char **)t38);
    t41 = ((char*)((ng9)));
    t42 = (t0 + 2888);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    memset(t45, 0, 8);
    t46 = (t45 + 4);
    t47 = (t44 + 4);
    t48 = *((unsigned int *)t44);
    t49 = (t48 >> 31);
    t50 = (t49 & 1);
    *((unsigned int *)t45) = t50;
    t51 = *((unsigned int *)t47);
    t52 = (t51 >> 31);
    t53 = (t52 & 1);
    *((unsigned int *)t46) = t53;
    xsi_vlog_mul_concat(t40, 32, 1, t41, 1U, t45, 1);
    xsi_vlogtype_concat(t36, 64, 64, 2U, t40, 32, t39, 32);
    t56 = (t0 + 3048);
    t57 = (t56 + 56U);
    t58 = *((char **)t57);
    t60 = ((char*)((ng9)));
    t61 = (t0 + 3048);
    t62 = (t61 + 56U);
    t63 = *((char **)t62);
    memset(t64, 0, 8);
    t65 = (t64 + 4);
    t66 = (t63 + 4);
    t67 = *((unsigned int *)t63);
    t68 = (t67 >> 31);
    t69 = (t68 & 1);
    *((unsigned int *)t64) = t69;
    t70 = *((unsigned int *)t66);
    t71 = (t70 >> 31);
    t72 = (t71 & 1);
    *((unsigned int *)t65) = t72;
    xsi_vlog_mul_concat(t59, 32, 1, t60, 1U, t64, 1);
    xsi_vlogtype_concat(t55, 64, 64, 2U, t59, 32, t58, 32);
    xsi_vlog_signed_multiply(t73, 64, t36, 64, t55, 64);
    t74 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t74, t73, 0, 0, 32, 0LL);
    t75 = (t0 + 3528);
    xsi_vlogvar_wait_assign_value(t75, t73, 32, 0, 32, 0LL);
    goto LAB49;

LAB43:    xsi_set_current_line(95, ng0);
    t4 = (t0 + 2888);
    t5 = (t4 + 56U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng2)));
    xsi_vlogtype_concat(t36, 64, 64, 2U, t12, 32, t11, 32);
    t15 = (t0 + 3048);
    t23 = (t15 + 56U);
    t24 = *((char **)t23);
    t30 = ((char*)((ng2)));
    xsi_vlogtype_concat(t55, 64, 64, 2U, t30, 32, t24, 32);
    xsi_vlog_unsigned_multiply(t73, 64, t36, 64, t55, 64);
    t31 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t31, t73, 0, 0, 32, 0LL);
    t33 = (t0 + 3528);
    xsi_vlogvar_wait_assign_value(t33, t73, 32, 0, 32, 0LL);
    goto LAB49;

LAB45:    xsi_set_current_line(97, ng0);

LAB50:    xsi_set_current_line(98, ng0);
    t4 = (t0 + 2888);
    t5 = (t4 + 56U);
    t11 = *((char **)t5);
    t12 = (t0 + 3048);
    t15 = (t12 + 56U);
    t23 = *((char **)t15);
    memset(t59, 0, 8);
    xsi_vlog_signed_divide(t59, 32, t11, 32, t23, 32);
    t24 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t24, t59, 0, 0, 32, 0LL);
    xsi_set_current_line(99, ng0);
    t2 = (t0 + 2888);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t11 = (t0 + 3048);
    t12 = (t11 + 56U);
    t15 = *((char **)t12);
    memset(t59, 0, 8);
    xsi_vlog_signed_mod(t59, 32, t5, 32, t15, 32);
    t23 = (t0 + 3528);
    xsi_vlogvar_wait_assign_value(t23, t59, 0, 0, 32, 0LL);
    goto LAB49;

LAB47:    xsi_set_current_line(102, ng0);

LAB51:    xsi_set_current_line(103, ng0);
    t4 = (t0 + 2888);
    t5 = (t4 + 56U);
    t11 = *((char **)t5);
    t12 = (t0 + 3048);
    t15 = (t12 + 56U);
    t23 = *((char **)t15);
    memset(t59, 0, 8);
    xsi_vlog_unsigned_divide(t59, 32, t11, 32, t23, 32);
    t24 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t24, t59, 0, 0, 32, 0LL);
    xsi_set_current_line(104, ng0);
    t2 = (t0 + 2888);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t11 = (t0 + 3048);
    t12 = (t11 + 56U);
    t15 = *((char **)t12);
    memset(t59, 0, 8);
    xsi_vlog_unsigned_mod(t59, 32, t5, 32, t15, 32);
    t23 = (t0 + 3528);
    xsi_vlogvar_wait_assign_value(t23, t59, 0, 0, 32, 0LL);
    goto LAB49;

LAB53:    *((unsigned int *)t14) = 1;
    goto LAB55;

LAB54:    t23 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB55;

LAB56:    xsi_set_current_line(109, ng0);

LAB59:    xsi_set_current_line(110, ng0);
    t30 = (t0 + 2728);
    t31 = (t30 + 56U);
    t33 = *((char **)t31);
    t37 = ((char*)((ng4)));
    memset(t40, 0, 8);
    xsi_vlog_unsigned_minus(t40, 4, t33, 4, t37, 4);
    t38 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t38, t40, 0, 0, 4, 0LL);
    goto LAB58;

}


extern void work_m_00000000002913799419_2099502818_init()
{
	static char *pe[] = {(void *)Cont_36_0,(void *)Cont_42_1,(void *)Cont_43_2,(void *)Always_46_3};
	xsi_register_didat("work_m_00000000002913799419_2099502818", "isim/mips_tb_isim_beh.exe.sim/work/m_00000000002913799419_2099502818.didat");
	xsi_register_executes(pe);
}
