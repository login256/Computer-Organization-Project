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
static const char *ng0 = "C:/Users/lyt/Documents/project/co/p4/mips/cpu/controller/controller.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {33U, 0U};
static unsigned int ng3[] = {4096U, 0U};
static unsigned int ng4[] = {35U, 0U};
static unsigned int ng5[] = {4097U, 0U};
static unsigned int ng6[] = {4102U, 0U};
static unsigned int ng7[] = {8U, 0U};
static unsigned int ng8[] = {262144U, 0U};
static unsigned int ng9[] = {13U, 0U};
static unsigned int ng10[] = {71683U, 0U};
static unsigned int ng11[] = {80128U, 0U};
static unsigned int ng12[] = {43U, 0U};
static unsigned int ng13[] = {3328U, 0U};
static unsigned int ng14[] = {4U, 0U};
static unsigned int ng15[] = {524553U, 0U};
static unsigned int ng16[] = {15U, 0U};
static unsigned int ng17[] = {72195U, 0U};
static unsigned int ng18[] = {3U, 0U};
static unsigned int ng19[] = {446464U, 0U};



static void Cont_40_0(char *t0)
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
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;
    char *t58;
    char *t59;
    char *t60;
    char *t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    unsigned int t65;
    unsigned int t66;
    char *t67;
    unsigned int t68;
    unsigned int t69;
    char *t70;
    char *t71;
    char *t72;
    char *t73;
    char *t74;
    unsigned int t75;
    unsigned int t76;
    char *t77;
    unsigned int t78;
    unsigned int t79;
    char *t80;
    unsigned int t81;
    unsigned int t82;
    char *t83;
    char *t84;
    char *t85;
    char *t86;
    char *t87;
    unsigned int t88;
    unsigned int t89;
    char *t90;
    unsigned int t91;
    unsigned int t92;
    char *t93;
    unsigned int t94;
    unsigned int t95;
    char *t96;
    char *t97;
    char *t98;
    char *t99;
    char *t100;
    unsigned int t101;
    unsigned int t102;
    char *t103;
    unsigned int t104;
    unsigned int t105;
    char *t106;
    unsigned int t107;
    unsigned int t108;
    char *t109;
    char *t110;
    char *t111;
    char *t112;
    char *t113;
    unsigned int t114;
    unsigned int t115;
    char *t116;
    unsigned int t117;
    unsigned int t118;
    char *t119;
    unsigned int t120;
    unsigned int t121;
    char *t122;
    char *t123;
    char *t124;
    char *t125;
    char *t126;
    unsigned int t127;
    unsigned int t128;
    char *t129;
    unsigned int t130;
    unsigned int t131;
    char *t132;
    unsigned int t133;
    unsigned int t134;
    char *t135;
    char *t136;
    char *t137;
    char *t138;
    char *t139;
    unsigned int t140;
    unsigned int t141;
    char *t142;
    unsigned int t143;
    unsigned int t144;
    char *t145;
    unsigned int t146;
    unsigned int t147;
    char *t148;

LAB0:    t1 = (t0 + 4288U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 3368);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5592);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 255U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 7);
    t18 = (t0 + 5528);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memset(t22, 0, 8);
    t23 = 768U;
    t24 = t23;
    t25 = (t4 + 4);
    t26 = *((unsigned int *)t4);
    t23 = (t23 & t26);
    t27 = *((unsigned int *)t25);
    t24 = (t24 & t27);
    t23 = (t23 >> 8);
    t24 = (t24 >> 8);
    t28 = (t22 + 4);
    t29 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t29 | t23);
    t30 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t30 | t24);
    xsi_driver_vfirst_trans(t18, 0, 1);
    t31 = (t0 + 5464);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    t34 = (t33 + 56U);
    t35 = *((char **)t34);
    memset(t35, 0, 8);
    t36 = 1024U;
    t37 = t36;
    t38 = (t4 + 4);
    t39 = *((unsigned int *)t4);
    t36 = (t36 & t39);
    t40 = *((unsigned int *)t38);
    t37 = (t37 & t40);
    t36 = (t36 >> 10);
    t37 = (t37 >> 10);
    t41 = (t35 + 4);
    t42 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t42 | t36);
    t43 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t43 | t37);
    xsi_driver_vfirst_trans(t31, 0, 0);
    t44 = (t0 + 5400);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    t47 = (t46 + 56U);
    t48 = *((char **)t47);
    memset(t48, 0, 8);
    t49 = 2048U;
    t50 = t49;
    t51 = (t4 + 4);
    t52 = *((unsigned int *)t4);
    t49 = (t49 & t52);
    t53 = *((unsigned int *)t51);
    t50 = (t50 & t53);
    t49 = (t49 >> 11);
    t50 = (t50 >> 11);
    t54 = (t48 + 4);
    t55 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t55 | t49);
    t56 = *((unsigned int *)t54);
    *((unsigned int *)t54) = (t56 | t50);
    xsi_driver_vfirst_trans(t44, 0, 0);
    t57 = (t0 + 5336);
    t58 = (t57 + 56U);
    t59 = *((char **)t58);
    t60 = (t59 + 56U);
    t61 = *((char **)t60);
    memset(t61, 0, 8);
    t62 = 4096U;
    t63 = t62;
    t64 = (t4 + 4);
    t65 = *((unsigned int *)t4);
    t62 = (t62 & t65);
    t66 = *((unsigned int *)t64);
    t63 = (t63 & t66);
    t62 = (t62 >> 12);
    t63 = (t63 >> 12);
    t67 = (t61 + 4);
    t68 = *((unsigned int *)t61);
    *((unsigned int *)t61) = (t68 | t62);
    t69 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t69 | t63);
    xsi_driver_vfirst_trans(t57, 0, 0);
    t70 = (t0 + 5272);
    t71 = (t70 + 56U);
    t72 = *((char **)t71);
    t73 = (t72 + 56U);
    t74 = *((char **)t73);
    memset(t74, 0, 8);
    t75 = 24576U;
    t76 = t75;
    t77 = (t4 + 4);
    t78 = *((unsigned int *)t4);
    t75 = (t75 & t78);
    t79 = *((unsigned int *)t77);
    t76 = (t76 & t79);
    t75 = (t75 >> 13);
    t76 = (t76 >> 13);
    t80 = (t74 + 4);
    t81 = *((unsigned int *)t74);
    *((unsigned int *)t74) = (t81 | t75);
    t82 = *((unsigned int *)t80);
    *((unsigned int *)t80) = (t82 | t76);
    xsi_driver_vfirst_trans(t70, 0, 1);
    t83 = (t0 + 5208);
    t84 = (t83 + 56U);
    t85 = *((char **)t84);
    t86 = (t85 + 56U);
    t87 = *((char **)t86);
    memset(t87, 0, 8);
    t88 = 32768U;
    t89 = t88;
    t90 = (t4 + 4);
    t91 = *((unsigned int *)t4);
    t88 = (t88 & t91);
    t92 = *((unsigned int *)t90);
    t89 = (t89 & t92);
    t88 = (t88 >> 15);
    t89 = (t89 >> 15);
    t93 = (t87 + 4);
    t94 = *((unsigned int *)t87);
    *((unsigned int *)t87) = (t94 | t88);
    t95 = *((unsigned int *)t93);
    *((unsigned int *)t93) = (t95 | t89);
    xsi_driver_vfirst_trans(t83, 0, 0);
    t96 = (t0 + 5144);
    t97 = (t96 + 56U);
    t98 = *((char **)t97);
    t99 = (t98 + 56U);
    t100 = *((char **)t99);
    memset(t100, 0, 8);
    t101 = 65536U;
    t102 = t101;
    t103 = (t4 + 4);
    t104 = *((unsigned int *)t4);
    t101 = (t101 & t104);
    t105 = *((unsigned int *)t103);
    t102 = (t102 & t105);
    t101 = (t101 >> 16);
    t102 = (t102 >> 16);
    t106 = (t100 + 4);
    t107 = *((unsigned int *)t100);
    *((unsigned int *)t100) = (t107 | t101);
    t108 = *((unsigned int *)t106);
    *((unsigned int *)t106) = (t108 | t102);
    xsi_driver_vfirst_trans(t96, 0, 0);
    t109 = (t0 + 5080);
    t110 = (t109 + 56U);
    t111 = *((char **)t110);
    t112 = (t111 + 56U);
    t113 = *((char **)t112);
    memset(t113, 0, 8);
    t114 = 131072U;
    t115 = t114;
    t116 = (t4 + 4);
    t117 = *((unsigned int *)t4);
    t114 = (t114 & t117);
    t118 = *((unsigned int *)t116);
    t115 = (t115 & t118);
    t114 = (t114 >> 17);
    t115 = (t115 >> 17);
    t119 = (t113 + 4);
    t120 = *((unsigned int *)t113);
    *((unsigned int *)t113) = (t120 | t114);
    t121 = *((unsigned int *)t119);
    *((unsigned int *)t119) = (t121 | t115);
    xsi_driver_vfirst_trans(t109, 0, 0);
    t122 = (t0 + 5016);
    t123 = (t122 + 56U);
    t124 = *((char **)t123);
    t125 = (t124 + 56U);
    t126 = *((char **)t125);
    memset(t126, 0, 8);
    t127 = 262144U;
    t128 = t127;
    t129 = (t4 + 4);
    t130 = *((unsigned int *)t4);
    t127 = (t127 & t130);
    t131 = *((unsigned int *)t129);
    t128 = (t128 & t131);
    t127 = (t127 >> 18);
    t128 = (t128 >> 18);
    t132 = (t126 + 4);
    t133 = *((unsigned int *)t126);
    *((unsigned int *)t126) = (t133 | t127);
    t134 = *((unsigned int *)t132);
    *((unsigned int *)t132) = (t134 | t128);
    xsi_driver_vfirst_trans(t122, 0, 0);
    t135 = (t0 + 4952);
    t136 = (t135 + 56U);
    t137 = *((char **)t136);
    t138 = (t137 + 56U);
    t139 = *((char **)t138);
    memset(t139, 0, 8);
    t140 = 524288U;
    t141 = t140;
    t142 = (t4 + 4);
    t143 = *((unsigned int *)t4);
    t140 = (t140 & t143);
    t144 = *((unsigned int *)t142);
    t141 = (t141 & t144);
    t140 = (t140 >> 19);
    t141 = (t141 >> 19);
    t145 = (t139 + 4);
    t146 = *((unsigned int *)t139);
    *((unsigned int *)t139) = (t146 | t140);
    t147 = *((unsigned int *)t145);
    *((unsigned int *)t145) = (t147 | t141);
    xsi_driver_vfirst_trans(t135, 0, 0);
    t148 = (t0 + 4856);
    *((int *)t148) = 1;

LAB1:    return;
}

static void Always_42_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    int t9;
    char *t10;
    char *t11;

LAB0:    t1 = (t0 + 4536U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 4872);
    *((int *)t2) = 1;
    t3 = (t0 + 4568);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(43, ng0);

LAB5:    xsi_set_current_line(44, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t4, 6);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng9)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng12)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng14)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng16)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng18)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB19;

LAB20:
LAB22:
LAB21:    xsi_set_current_line(78, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 20, 0LL);

LAB23:    goto LAB2;

LAB7:    xsi_set_current_line(47, ng0);

LAB24:    xsi_set_current_line(48, ng0);
    t7 = (t0 + 1208U);
    t8 = *((char **)t7);

LAB25:    t7 = ((char*)((ng2)));
    t9 = xsi_vlog_unsigned_case_compare(t8, 6, t7, 6);
    if (t9 == 1)
        goto LAB26;

LAB27:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB28;

LAB29:    t2 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB30;

LAB31:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 6, t2, 6);
    if (t6 == 1)
        goto LAB32;

LAB33:
LAB35:
LAB34:    xsi_set_current_line(60, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 20, 0LL);

LAB36:    goto LAB23;

LAB9:    xsi_set_current_line(65, ng0);
    t3 = ((char*)((ng10)));
    t4 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 20, 0LL);
    goto LAB23;

LAB11:    xsi_set_current_line(67, ng0);
    t3 = ((char*)((ng11)));
    t4 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 20, 0LL);
    goto LAB23;

LAB13:    xsi_set_current_line(69, ng0);
    t3 = ((char*)((ng13)));
    t4 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 20, 0LL);
    goto LAB23;

LAB15:    xsi_set_current_line(71, ng0);
    t3 = ((char*)((ng15)));
    t4 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 20, 0LL);
    goto LAB23;

LAB17:    xsi_set_current_line(73, ng0);
    t3 = ((char*)((ng17)));
    t4 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 20, 0LL);
    goto LAB23;

LAB19:    xsi_set_current_line(75, ng0);
    t3 = ((char*)((ng19)));
    t4 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 20, 0LL);
    goto LAB23;

LAB26:    xsi_set_current_line(51, ng0);
    t10 = ((char*)((ng3)));
    t11 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t11, t10, 0, 0, 20, 0LL);
    goto LAB36;

LAB28:    xsi_set_current_line(53, ng0);
    t3 = ((char*)((ng5)));
    t4 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 20, 0LL);
    goto LAB36;

LAB30:    xsi_set_current_line(55, ng0);
    t3 = ((char*)((ng6)));
    t4 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 20, 0LL);
    goto LAB36;

LAB32:    xsi_set_current_line(57, ng0);
    t3 = ((char*)((ng8)));
    t4 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 20, 0LL);
    goto LAB36;

}


extern void work_m_00000000000214889489_3092946469_init()
{
	static char *pe[] = {(void *)Cont_40_0,(void *)Always_42_1};
	xsi_register_didat("work_m_00000000000214889489_3092946469", "isim/CPU_tb_isim_beh.exe.sim/work/m_00000000000214889489_3092946469.didat");
	xsi_register_executes(pe);
}
