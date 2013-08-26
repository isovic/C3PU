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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ivan/Dropbox/S3/C3PU/comparator.vhd";
extern char *IEEE_P_2592010699;



static void work_a_2683404259_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(17, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 4763);
    t4 = 1;
    if (3U == 3U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 4766);
    t4 = 1;
    if (3U == 3U)
        goto LAB22;

LAB23:    t4 = 0;

LAB24:    if (t4 != 0)
        goto LAB20;

LAB21:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 4769);
    t4 = 1;
    if (3U == 3U)
        goto LAB39;

LAB40:    t4 = 0;

LAB41:    if (t4 != 0)
        goto LAB37;

LAB38:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 4772);
    t4 = 1;
    if (3U == 3U)
        goto LAB50;

LAB51:    t4 = 0;

LAB52:    if (t4 != 0)
        goto LAB48;

LAB49:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 4775);
    t4 = 1;
    if (3U == 3U)
        goto LAB61;

LAB62:    t4 = 0;

LAB63:    if (t4 != 0)
        goto LAB59;

LAB60:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 4778);
    t4 = 1;
    if (3U == 3U)
        goto LAB72;

LAB73:    t4 = 0;

LAB74:    if (t4 != 0)
        goto LAB70;

LAB71:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 3064);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB3:    t1 = (t0 + 2984);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(18, ng0);
    t8 = (t0 + 1032U);
    t9 = *((char **)t8);
    t8 = (t0 + 1192U);
    t10 = *((char **)t8);
    t11 = 1;
    if (16U == 16U)
        goto LAB14;

LAB15:    t11 = 0;

LAB16:    if (t11 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(21, ng0);
    t1 = (t0 + 3064);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB12:    goto LAB3;

LAB5:    t5 = 0;

LAB8:    if (t5 < 3U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB6;

LAB10:    t5 = (t5 + 1);
    goto LAB8;

LAB11:    xsi_set_current_line(19, ng0);
    t14 = (t0 + 3064);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t14);
    goto LAB12;

LAB14:    t12 = 0;

LAB17:    if (t12 < 16U)
        goto LAB18;
    else
        goto LAB16;

LAB18:    t8 = (t9 + t12);
    t13 = (t10 + t12);
    if (*((unsigned char *)t8) != *((unsigned char *)t13))
        goto LAB15;

LAB19:    t12 = (t12 + 1);
    goto LAB17;

LAB20:    xsi_set_current_line(25, ng0);
    t8 = (t0 + 1032U);
    t9 = *((char **)t8);
    t8 = (t0 + 1192U);
    t10 = *((char **)t8);
    t11 = 1;
    if (16U == 16U)
        goto LAB31;

LAB32:    t11 = 0;

LAB33:    if ((!(t11)) != 0)
        goto LAB28;

LAB30:    xsi_set_current_line(28, ng0);
    t1 = (t0 + 3064);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB29:    goto LAB3;

LAB22:    t5 = 0;

LAB25:    if (t5 < 3U)
        goto LAB26;
    else
        goto LAB24;

LAB26:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB23;

LAB27:    t5 = (t5 + 1);
    goto LAB25;

LAB28:    xsi_set_current_line(26, ng0);
    t14 = (t0 + 3064);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t14);
    goto LAB29;

LAB31:    t12 = 0;

LAB34:    if (t12 < 16U)
        goto LAB35;
    else
        goto LAB33;

LAB35:    t8 = (t9 + t12);
    t13 = (t10 + t12);
    if (*((unsigned char *)t8) != *((unsigned char *)t13))
        goto LAB32;

LAB36:    t12 = (t12 + 1);
    goto LAB34;

LAB37:    xsi_set_current_line(32, ng0);
    t8 = (t0 + 1032U);
    t9 = *((char **)t8);
    t8 = (t0 + 1192U);
    t10 = *((char **)t8);
    t8 = ((IEEE_P_2592010699) + 4000);
    t11 = xsi_vhdl_greater(t8, t9, 16U, t10, 16U);
    if (t11 != 0)
        goto LAB45;

LAB47:    xsi_set_current_line(35, ng0);
    t1 = (t0 + 3064);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB46:    goto LAB3;

LAB39:    t5 = 0;

LAB42:    if (t5 < 3U)
        goto LAB43;
    else
        goto LAB41;

LAB43:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB40;

LAB44:    t5 = (t5 + 1);
    goto LAB42;

LAB45:    xsi_set_current_line(33, ng0);
    t13 = (t0 + 3064);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t13);
    goto LAB46;

LAB48:    xsi_set_current_line(39, ng0);
    t8 = (t0 + 1032U);
    t9 = *((char **)t8);
    t8 = (t0 + 1192U);
    t10 = *((char **)t8);
    t8 = ((IEEE_P_2592010699) + 4000);
    t11 = xsi_vhdl_greaterEqual(t8, t9, 16U, t10, 16U);
    if (t11 != 0)
        goto LAB56;

LAB58:    xsi_set_current_line(42, ng0);
    t1 = (t0 + 3064);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB57:    goto LAB3;

LAB50:    t5 = 0;

LAB53:    if (t5 < 3U)
        goto LAB54;
    else
        goto LAB52;

LAB54:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB51;

LAB55:    t5 = (t5 + 1);
    goto LAB53;

LAB56:    xsi_set_current_line(40, ng0);
    t13 = (t0 + 3064);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t13);
    goto LAB57;

LAB59:    xsi_set_current_line(46, ng0);
    t8 = (t0 + 1032U);
    t9 = *((char **)t8);
    t8 = (t0 + 1192U);
    t10 = *((char **)t8);
    t8 = ((IEEE_P_2592010699) + 4000);
    t11 = xsi_vhdl_lessthan(t8, t9, 16U, t10, 16U);
    if (t11 != 0)
        goto LAB67;

LAB69:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 3064);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB68:    goto LAB3;

LAB61:    t5 = 0;

LAB64:    if (t5 < 3U)
        goto LAB65;
    else
        goto LAB63;

LAB65:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB62;

LAB66:    t5 = (t5 + 1);
    goto LAB64;

LAB67:    xsi_set_current_line(47, ng0);
    t13 = (t0 + 3064);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t13);
    goto LAB68;

LAB70:    xsi_set_current_line(53, ng0);
    t8 = (t0 + 1032U);
    t9 = *((char **)t8);
    t8 = (t0 + 1192U);
    t10 = *((char **)t8);
    t8 = ((IEEE_P_2592010699) + 4000);
    t11 = xsi_vhdl_lessthanEqual(t8, t9, 16U, t10, 16U);
    if (t11 != 0)
        goto LAB78;

LAB80:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 3064);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB79:    goto LAB3;

LAB72:    t5 = 0;

LAB75:    if (t5 < 3U)
        goto LAB76;
    else
        goto LAB74;

LAB76:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB73;

LAB77:    t5 = (t5 + 1);
    goto LAB75;

LAB78:    xsi_set_current_line(54, ng0);
    t13 = (t0 + 3064);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t13);
    goto LAB79;

}


extern void work_a_2683404259_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2683404259_3212880686_p_0};
	xsi_register_didat("work_a_2683404259_3212880686", "isim/testbench_isim_beh.exe.sim/work/a_2683404259_3212880686.didat");
	xsi_register_executes(pe);
}
