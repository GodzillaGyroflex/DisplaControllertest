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
    work_m_00000000000346976995_4041553896_init();
    work_m_00000000001046158026_2487809540_init();
    work_m_00000000000895262701_3818977158_init();
    work_m_00000000003857228399_3845763652_init();
    work_m_00000000000723596334_0718956276_init();
    work_m_00000000000283333693_3683860065_init();
    work_m_00000000001831180546_0617297638_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001831180546_0617297638");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
