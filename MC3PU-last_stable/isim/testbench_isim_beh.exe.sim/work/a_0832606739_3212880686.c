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
static const char *ng0 = "/home/ivan/Dropbox/S3/backup-C3PU/ALU.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

char *ieee_p_2592010699_sub_16439767405979520975_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_16439989832805790689_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_16439989833707593767_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_207919886985903570_503743352(char *, char *, char *, char *);
char *ieee_p_3620187407_sub_1496620905533649268_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_1496620905533721142_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_16272557775307340295_3965413181(char *, char *, char *, char *, unsigned char );
char *ieee_p_3620187407_sub_16272557775307412169_3965413181(char *, char *, char *, char *, unsigned char );


static void work_a_0832606739_3212880686_p_0(char *t0)
{
    char t39[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    int t11;
    char *t12;
    char *t13;
    int t14;
    char *t15;
    char *t16;
    int t17;
    char *t18;
    int t20;
    char *t21;
    int t23;
    char *t24;
    int t26;
    char *t27;
    int t29;
    char *t30;
    int t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    unsigned int t40;
    unsigned int t41;
    unsigned char t42;

LAB0:    t1 = (t0 + 2664U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 4732);
    t5 = xsi_mem_cmp(t2, t3, 4U);
    if (t5 == 1)
        goto LAB5;

LAB16:    t6 = (t0 + 4736);
    t8 = xsi_mem_cmp(t6, t3, 4U);
    if (t8 == 1)
        goto LAB6;

LAB17:    t9 = (t0 + 4740);
    t11 = xsi_mem_cmp(t9, t3, 4U);
    if (t11 == 1)
        goto LAB7;

LAB18:    t12 = (t0 + 4744);
    t14 = xsi_mem_cmp(t12, t3, 4U);
    if (t14 == 1)
        goto LAB8;

LAB19:    t15 = (t0 + 4748);
    t17 = xsi_mem_cmp(t15, t3, 4U);
    if (t17 == 1)
        goto LAB9;

LAB20:    t18 = (t0 + 4752);
    t20 = xsi_mem_cmp(t18, t3, 4U);
    if (t20 == 1)
        goto LAB10;

LAB21:    t21 = (t0 + 4756);
    t23 = xsi_mem_cmp(t21, t3, 4U);
    if (t23 == 1)
        goto LAB11;

LAB22:    t24 = (t0 + 4760);
    t26 = xsi_mem_cmp(t24, t3, 4U);
    if (t26 == 1)
        goto LAB12;

LAB23:    t27 = (t0 + 4764);
    t29 = xsi_mem_cmp(t27, t3, 4U);
    if (t29 == 1)
        goto LAB13;

LAB24:    t30 = (t0 + 4768);
    t32 = xsi_mem_cmp(t30, t3, 4U);
    if (t32 == 1)
        goto LAB14;

LAB25:
LAB15:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 4788);
    t4 = (t0 + 3064);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 16U);
    xsi_driver_first_trans_fast_port(t4);

LAB4:    xsi_set_current_line(43, ng0);

LAB45:    t2 = (t0 + 2984);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB46;

LAB1:    return;
LAB5:    xsi_set_current_line(44, ng0);
    t33 = (t0 + 1032U);
    t34 = *((char **)t33);
    t33 = (t0 + 3064);
    t35 = (t33 + 56U);
    t36 = *((char **)t35);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    memcpy(t38, t34, 16U);
    xsi_driver_first_trans_fast_port(t33);
    goto LAB4;

LAB6:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 4624U);
    t4 = (t0 + 1352U);
    t6 = *((char **)t4);
    t4 = (t0 + 4656U);
    t7 = ieee_p_2592010699_sub_16439989832805790689_503743352(IEEE_P_2592010699, t39, t3, t2, t6, t4);
    t9 = (t39 + 12U);
    t40 = *((unsigned int *)t9);
    t41 = (1U * t40);
    t42 = (16U != t41);
    if (t42 == 1)
        goto LAB27;

LAB28:    t10 = (t0 + 3064);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 16U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB4;

LAB7:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 4624U);
    t4 = (t0 + 1352U);
    t6 = *((char **)t4);
    t4 = (t0 + 4656U);
    t7 = ieee_p_2592010699_sub_16439767405979520975_503743352(IEEE_P_2592010699, t39, t3, t2, t6, t4);
    t9 = (t39 + 12U);
    t40 = *((unsigned int *)t9);
    t41 = (1U * t40);
    t42 = (16U != t41);
    if (t42 == 1)
        goto LAB29;

LAB30:    t10 = (t0 + 3064);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 16U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB4;

LAB8:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 4624U);
    t4 = ieee_p_2592010699_sub_207919886985903570_503743352(IEEE_P_2592010699, t39, t3, t2);
    t6 = (t39 + 12U);
    t40 = *((unsigned int *)t6);
    t41 = (1U * t40);
    t42 = (16U != t41);
    if (t42 == 1)
        goto LAB31;

LAB32:    t7 = (t0 + 3064);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 16U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB4;

LAB9:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 4624U);
    t4 = (t0 + 1352U);
    t6 = *((char **)t4);
    t4 = (t0 + 4656U);
    t7 = ieee_p_2592010699_sub_16439989833707593767_503743352(IEEE_P_2592010699, t39, t3, t2, t6, t4);
    t9 = (t39 + 12U);
    t40 = *((unsigned int *)t9);
    t41 = (1U * t40);
    t42 = (16U != t41);
    if (t42 == 1)
        goto LAB33;

LAB34:    t10 = (t0 + 3064);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 16U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB4;

LAB10:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 4624U);
    t4 = (t0 + 1352U);
    t6 = *((char **)t4);
    t4 = (t0 + 4656U);
    t7 = ieee_p_3620187407_sub_1496620905533649268_3965413181(IEEE_P_3620187407, t39, t3, t2, t6, t4);
    t9 = (t39 + 12U);
    t40 = *((unsigned int *)t9);
    t41 = (1U * t40);
    t42 = (16U != t41);
    if (t42 == 1)
        goto LAB35;

LAB36:    t10 = (t0 + 3064);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 16U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB4;

LAB11:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 4624U);
    t4 = (t0 + 1352U);
    t6 = *((char **)t4);
    t4 = (t0 + 4656U);
    t7 = ieee_p_3620187407_sub_1496620905533721142_3965413181(IEEE_P_3620187407, t39, t3, t2, t6, t4);
    t9 = (t39 + 12U);
    t40 = *((unsigned int *)t9);
    t41 = (1U * t40);
    t42 = (16U != t41);
    if (t42 == 1)
        goto LAB37;

LAB38:    t10 = (t0 + 3064);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 16U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB4;

LAB12:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 4624U);
    t4 = ieee_p_3620187407_sub_16272557775307340295_3965413181(IEEE_P_3620187407, t39, t3, t2, (unsigned char)3);
    t6 = (t39 + 12U);
    t40 = *((unsigned int *)t6);
    t41 = (1U * t40);
    t42 = (16U != t41);
    if (t42 == 1)
        goto LAB39;

LAB40:    t7 = (t0 + 3064);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 16U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB4;

LAB13:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 4624U);
    t4 = ieee_p_3620187407_sub_16272557775307412169_3965413181(IEEE_P_3620187407, t39, t3, t2, (unsigned char)3);
    t6 = (t39 + 12U);
    t40 = *((unsigned int *)t6);
    t41 = (1U * t40);
    t42 = (16U != t41);
    if (t42 == 1)
        goto LAB41;

LAB42:    t7 = (t0 + 3064);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 16U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB4;

LAB14:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 4772);
    t4 = (t0 + 3064);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 16U);
    xsi_driver_first_trans_fast_port(t4);
    goto LAB4;

LAB26:;
LAB27:    xsi_size_not_matching(16U, t41, 0);
    goto LAB28;

LAB29:    xsi_size_not_matching(16U, t41, 0);
    goto LAB30;

LAB31:    xsi_size_not_matching(16U, t41, 0);
    goto LAB32;

LAB33:    xsi_size_not_matching(16U, t41, 0);
    goto LAB34;

LAB35:    xsi_size_not_matching(16U, t41, 0);
    goto LAB36;

LAB37:    xsi_size_not_matching(16U, t41, 0);
    goto LAB38;

LAB39:    xsi_size_not_matching(16U, t41, 0);
    goto LAB40;

LAB41:    xsi_size_not_matching(16U, t41, 0);
    goto LAB42;

LAB43:    t3 = (t0 + 2984);
    *((int *)t3) = 0;
    goto LAB2;

LAB44:    goto LAB43;

LAB46:    goto LAB44;

}


extern void work_a_0832606739_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0832606739_3212880686_p_0};
	xsi_register_didat("work_a_0832606739_3212880686", "isim/testbench_isim_beh.exe.sim/work/a_0832606739_3212880686.didat");
	xsi_register_executes(pe);
}
