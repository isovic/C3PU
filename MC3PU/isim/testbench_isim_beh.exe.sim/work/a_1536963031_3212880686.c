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
static const char *ng0 = "/home/ivan/Dropbox/S3/C3PU/shf.vhd";
extern char *IEEE_P_2592010699;



static void work_a_1536963031_3212880686_p_0(char *t0)
{
    char t17[16];
    char t18[16];
    char t29[16];
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
    char *t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    int t19;
    unsigned int t20;
    unsigned char t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    int t30;
    char *t31;
    char *t32;
    char *t33;

LAB0:    xsi_set_current_line(15, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 4435);
    t4 = 1;
    if (3U == 3U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 4438);
    t4 = 1;
    if (3U == 3U)
        goto LAB13;

LAB14:    t4 = 0;

LAB15:    if (t4 != 0)
        goto LAB11;

LAB12:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 4441);
    t4 = 1;
    if (3U == 3U)
        goto LAB23;

LAB24:    t4 = 0;

LAB25:    if (t4 != 0)
        goto LAB21;

LAB22:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 4444);
    t4 = 1;
    if (3U == 3U)
        goto LAB33;

LAB34:    t4 = 0;

LAB35:    if (t4 != 0)
        goto LAB31;

LAB32:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 4447);
    t4 = 1;
    if (3U == 3U)
        goto LAB43;

LAB44:    t4 = 0;

LAB45:    if (t4 != 0)
        goto LAB41;

LAB42:    xsi_set_current_line(26, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 2904);
    t3 = (t1 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);

LAB3:    t1 = (t0 + 2824);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(16, ng0);
    t8 = (t0 + 1032U);
    t9 = *((char **)t8);
    t8 = (t0 + 2904);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t9, 16U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB3;

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

LAB11:    xsi_set_current_line(18, ng0);
    t8 = (t0 + 1032U);
    t9 = *((char **)t8);
    t14 = (15 - 14);
    t15 = (t14 * 1U);
    t16 = (0 + t15);
    t8 = (t9 + t16);
    t11 = ((IEEE_P_2592010699) + 4000);
    t12 = (t18 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 14;
    t13 = (t12 + 4U);
    *((int *)t13) = 0;
    t13 = (t12 + 8U);
    *((int *)t13) = -1;
    t19 = (0 - 14);
    t20 = (t19 * -1);
    t20 = (t20 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t20;
    t10 = xsi_base_array_concat(t10, t17, t11, (char)97, t8, t18, (char)99, (unsigned char)2, (char)101);
    t20 = (15U + 1U);
    t21 = (16U != t20);
    if (t21 == 1)
        goto LAB19;

LAB20:    t13 = (t0 + 2904);
    t22 = (t13 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t10, 16U);
    xsi_driver_first_trans_fast_port(t13);
    goto LAB3;

LAB13:    t5 = 0;

LAB16:    if (t5 < 3U)
        goto LAB17;
    else
        goto LAB15;

LAB17:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB14;

LAB18:    t5 = (t5 + 1);
    goto LAB16;

LAB19:    xsi_size_not_matching(16U, t20, 0);
    goto LAB20;

LAB21:    xsi_set_current_line(20, ng0);
    t8 = (t0 + 1032U);
    t9 = *((char **)t8);
    t14 = (15 - 15);
    t15 = (t14 * 1U);
    t16 = (0 + t15);
    t8 = (t9 + t16);
    t11 = ((IEEE_P_2592010699) + 4000);
    t12 = (t18 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 15;
    t13 = (t12 + 4U);
    *((int *)t13) = 1;
    t13 = (t12 + 8U);
    *((int *)t13) = -1;
    t19 = (1 - 15);
    t20 = (t19 * -1);
    t20 = (t20 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t20;
    t10 = xsi_base_array_concat(t10, t17, t11, (char)99, (unsigned char)2, (char)97, t8, t18, (char)101);
    t20 = (1U + 15U);
    t21 = (16U != t20);
    if (t21 == 1)
        goto LAB29;

LAB30:    t13 = (t0 + 2904);
    t22 = (t13 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t10, 16U);
    xsi_driver_first_trans_fast_port(t13);
    goto LAB3;

LAB23:    t5 = 0;

LAB26:    if (t5 < 3U)
        goto LAB27;
    else
        goto LAB25;

LAB27:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB24;

LAB28:    t5 = (t5 + 1);
    goto LAB26;

LAB29:    xsi_size_not_matching(16U, t20, 0);
    goto LAB30;

LAB31:    xsi_set_current_line(22, ng0);
    t8 = (t0 + 1032U);
    t9 = *((char **)t8);
    t14 = (15 - 14);
    t15 = (t14 * 1U);
    t16 = (0 + t15);
    t8 = (t9 + t16);
    t10 = (t0 + 1032U);
    t11 = *((char **)t10);
    t20 = (15 - 15);
    t26 = (t20 * 1U);
    t27 = (0 + t26);
    t10 = (t11 + t27);
    t13 = ((IEEE_P_2592010699) + 4000);
    t22 = (t18 + 0U);
    t23 = (t22 + 0U);
    *((int *)t23) = 14;
    t23 = (t22 + 4U);
    *((int *)t23) = 0;
    t23 = (t22 + 8U);
    *((int *)t23) = -1;
    t19 = (0 - 14);
    t28 = (t19 * -1);
    t28 = (t28 + 1);
    t23 = (t22 + 12U);
    *((unsigned int *)t23) = t28;
    t23 = (t29 + 0U);
    t24 = (t23 + 0U);
    *((int *)t24) = 15;
    t24 = (t23 + 4U);
    *((int *)t24) = 15;
    t24 = (t23 + 8U);
    *((int *)t24) = -1;
    t30 = (15 - 15);
    t28 = (t30 * -1);
    t28 = (t28 + 1);
    t24 = (t23 + 12U);
    *((unsigned int *)t24) = t28;
    t12 = xsi_base_array_concat(t12, t17, t13, (char)97, t8, t18, (char)97, t10, t29, (char)101);
    t28 = (15U + 1U);
    t21 = (16U != t28);
    if (t21 == 1)
        goto LAB39;

LAB40:    t24 = (t0 + 2904);
    t25 = (t24 + 56U);
    t31 = *((char **)t25);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memcpy(t33, t12, 16U);
    xsi_driver_first_trans_fast_port(t24);
    goto LAB3;

LAB33:    t5 = 0;

LAB36:    if (t5 < 3U)
        goto LAB37;
    else
        goto LAB35;

LAB37:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB34;

LAB38:    t5 = (t5 + 1);
    goto LAB36;

LAB39:    xsi_size_not_matching(16U, t28, 0);
    goto LAB40;

LAB41:    xsi_set_current_line(24, ng0);
    t8 = (t0 + 1032U);
    t9 = *((char **)t8);
    t14 = (15 - 0);
    t15 = (t14 * 1U);
    t16 = (0 + t15);
    t8 = (t9 + t16);
    t10 = (t0 + 1032U);
    t11 = *((char **)t10);
    t20 = (15 - 15);
    t26 = (t20 * 1U);
    t27 = (0 + t26);
    t10 = (t11 + t27);
    t13 = ((IEEE_P_2592010699) + 4000);
    t22 = (t18 + 0U);
    t23 = (t22 + 0U);
    *((int *)t23) = 0;
    t23 = (t22 + 4U);
    *((int *)t23) = 0;
    t23 = (t22 + 8U);
    *((int *)t23) = -1;
    t19 = (0 - 0);
    t28 = (t19 * -1);
    t28 = (t28 + 1);
    t23 = (t22 + 12U);
    *((unsigned int *)t23) = t28;
    t23 = (t29 + 0U);
    t24 = (t23 + 0U);
    *((int *)t24) = 15;
    t24 = (t23 + 4U);
    *((int *)t24) = 1;
    t24 = (t23 + 8U);
    *((int *)t24) = -1;
    t30 = (1 - 15);
    t28 = (t30 * -1);
    t28 = (t28 + 1);
    t24 = (t23 + 12U);
    *((unsigned int *)t24) = t28;
    t12 = xsi_base_array_concat(t12, t17, t13, (char)97, t8, t18, (char)97, t10, t29, (char)101);
    t28 = (1U + 15U);
    t21 = (16U != t28);
    if (t21 == 1)
        goto LAB49;

LAB50:    t24 = (t0 + 2904);
    t25 = (t24 + 56U);
    t31 = *((char **)t25);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memcpy(t33, t12, 16U);
    xsi_driver_first_trans_fast_port(t24);
    goto LAB3;

LAB43:    t5 = 0;

LAB46:    if (t5 < 3U)
        goto LAB47;
    else
        goto LAB45;

LAB47:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB44;

LAB48:    t5 = (t5 + 1);
    goto LAB46;

LAB49:    xsi_size_not_matching(16U, t28, 0);
    goto LAB50;

}


extern void work_a_1536963031_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1536963031_3212880686_p_0};
	xsi_register_didat("work_a_1536963031_3212880686", "isim/testbench_isim_beh.exe.sim/work/a_1536963031_3212880686.didat");
	xsi_register_executes(pe);
}
