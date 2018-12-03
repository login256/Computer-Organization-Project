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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000002804861465_0493383819_init();
    work_m_00000000000399293323_0315911452_init();
    work_m_00000000004189245374_2534161108_init();
    work_m_00000000001595868987_1621107508_init();
    work_m_00000000002915993295_3527808377_init();
    work_m_00000000003628263792_4241813833_init();
    work_m_00000000000237426612_4007036230_init();
    work_m_00000000000469469503_0992325708_init();
    work_m_00000000002915993295_3949996602_init();
    work_m_00000000002305121533_1433407185_init();
    work_m_00000000002745224510_2725559894_init();
    work_m_00000000002913799419_2099502818_init();
    work_m_00000000001043191730_2913210254_init();
    work_m_00000000003712146556_0757543365_init();
    work_m_00000000003659066167_2725311412_init();
    work_m_00000000001436172962_4214256268_init();
    work_m_00000000002408993463_3027548060_init();
    work_m_00000000002273937848_4149334659_init();
    work_m_00000000003281579676_0148084070_init();
    work_m_00000000002433551872_0267772475_init();
    work_m_00000000001697351229_0372028336_init();
    work_m_00000000003566886292_1884589511_init();
    work_m_00000000003814894351_3092946469_init();
    work_m_00000000003093459552_1200043877_init();
    work_m_00000000001297333199_3261551314_init();
    work_m_00000000003546660929_1748821512_init();
    work_m_00000000003109579170_3877310806_init();
    work_m_00000000002047498008_0258635663_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002047498008_0258635663");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
