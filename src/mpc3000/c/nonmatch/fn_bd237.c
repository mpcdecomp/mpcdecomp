/* differs: 308 at +5, 1194 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
extern int far far_b1aac(void);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern long far far_caade(long);
extern long far far_cace7(int, int, int);
extern long far far_cad00(int);
extern int far far_cad6d(char far *, int, int);
extern long far far_d938a(int, int, int, int, int);
extern long far far_fa0c8(int, int, int);
extern int far fn_bd5b2(long, int);

int far fn_bd237(int arg_0, long arg_2, int arg_6, int arg_8, int arg_10, int arg_12, int arg_14, int arg_16, int arg_18, unsigned int arg_20, int arg_22)
{
    char loc_12;
    char loc_11;
    int loc_10;
    int loc_e;
    long loc_c;
    int loc_a;
    unsigned int loc_8;
    int loc_6;
    unsigned long loc_4;
    int loc_2;
    int ax;
    int ax10;
    int ax11;
    int ax12;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    int bx;
    int cx;
    int cx2;
    unsigned int dx;
    unsigned int dx10;
    int dx2;
    unsigned int dx3;
    unsigned int dx4;
    int dx5;
    int dx6;
    int dx7;
    int dx8;
    unsigned int dx9;
    int flags;
    int flags2;
    int flags3;
    int flags4;
    int flags5;
    long t1;
    int t10;
    int t11;
    long t12;
    int t13;
    long t14;
    long t15;
    long t16;
    long t17;
    long t18;
    long t19;
    long t2;
    long t20;
    int t21;
    long t22;
    long t23;
    int t24;
    long t25;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    int t9;

    far_b1aac();
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x3cba));
    far_b1b05(MK_FP(SEG_DATA, 0x3cd9));
    ax3 = (int)far_b90dd();
    if (arg_6 == 2) {
        t2 = far_caade(*(long *)((char *)&arg_0 + 0));
        if ((int)t2 < 0) {
            return (int)t2;
        }
        t3 = far_cace7((int)t2, arg_8, arg_10);
        if ((int)t3 != 0) {
            return (int)t3;
        }
        ax4 = (int)far_d938a((int)t2, arg_12, arg_14, arg_16, arg_18);
        if (ax4 < 0) {
            return ax4;
        }
        goto L1;
    }
    if (arg_6 != 5) {
        goto L1;
    }
    dx = arg_8;
    dx2 = dx << 1;
    t4 = (((long)(arg_10 << 1 | dx >> 15 & 1) << 16 | (unsigned)dx2) - 0x1800L) / 3L;
    loc_2 = (int)(t4 >> 16);
    *(int *)((char *)&loc_4 + 0) = (int)t4;
    dx3 = *(int *)((char *)&loc_4 + 0);
    dx4 = dx3 + arg_16;
    loc_6 = loc_2 + arg_18 + (dx4 < dx3);
    loc_8 = dx4;
    ax5 = loc_2;
    flags = ax5 - arg_22;
    if (CC(">", flags) || !CC("<", flags) && (unsigned int)*(int *)((char *)&loc_4 + 0) >= arg_20) {
        goto L2;
    }
    ax6 = loc_6;
    flags2 = ax6 - arg_22;
    if (CC(">", flags2) || !CC("<", flags2) && loc_8 >= arg_20) {
        goto L2;
    }
    t5 = far_caade(*(long *)((char *)&arg_0 + 0));
    if ((int)t5 < 0) {
        return (int)t5;
    }
    t6 = far_cace7((int)t5, arg_8, arg_10);
    if ((int)t6 != 0) {
        return (int)t6;
    }
    t7 = far_d938a((int)t5, arg_12, arg_14, arg_16, arg_18);
    if ((int)t7 < 0) {
        return (int)t7;
    }
L2:
    ax7 = loc_2;
    flags3 = ax7 - arg_22;
    if (!CC(">=", flags3)) {
        goto L3;
    }
    if (!CC(">", flags3) && (unsigned int)*(int *)((char *)&loc_4 + 0) <= arg_20) {
        goto L3;
    }
    t8 = far_cad00(0);
    for (;;) {
        t9 = fn_bd5b2(*(long *)((char *)&arg_0 + 0), 2);
        if (t9 != 120) {
            break;
        }
        t10 = far_b1ad0(7, 0);
        t11 = far_b1b05(MK_FP(SEG_DATA, 0x3d9b));
        t12 = far_caade(*(long *)((char *)&arg_0 + 0));
        if ((int)t12 >= 0) {
            goto L4;
        }
        if ((int)t12 == -0x300) {
            continue;
        }
        goto L5;
    }
    return t9;
L4:
    t13 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_12), (int)t12, 2);
    if (t13 != 0) {
        return t13;
    }
    if (loc_12 != 6 || loc_11 > 1) {
        return -33;
    }
    t14 = far_fa0c8(3, arg_20, arg_22);
    t15 = t14 / 2L;
    cx = arg_8;
    cx2 = cx - (int)t15;
    bx = (int)(((long)arg_10 << 16 | (unsigned)cx) - t15 >> 16);
    arg_10 = bx;
    arg_8 = cx2;
    t16 = far_cace7((int)t12, cx2, bx);
    if ((int)t16 != 0) {
        return (int)t16;
    }
    t17 = far_d938a((int)t12, arg_12, arg_14, arg_16, arg_18);
    if ((int)t17 < 0) {
        return (int)t17;
    }
L3:
    ax8 = loc_2;
    flags4 = ax8 - arg_22;
    if (!CC("<=", flags4)) {
        goto L1;
    }
    if (!CC("<", flags4) && (unsigned int)*(int *)((char *)&loc_4 + 0) >= arg_20) {
        goto L1;
    }
    ax9 = loc_6;
    flags5 = ax9 - arg_22;
    if (!CC(">=", flags5)) {
        goto L1;
    }
    if (!CC(">", flags5) && loc_8 <= arg_20) {
        goto L1;
    }
    t18 = far_caade(*(long *)((char *)&arg_0 + 0));
    if ((int)t18 < 0) {
        return (int)t18;
    }
    t19 = far_cace7((int)t18, arg_8, arg_10);
    if ((int)t19 != 0) {
        return (int)t19;
    }
    dx5 = arg_20;
    dx6 = dx5 - *(int *)((char *)&loc_4 + 0);
    ax10 = (int)(((long)arg_22 << 16 | (unsigned)dx5) - loc_4 >> 16);
    loc_a = ax10;
    *(int *)((char *)&loc_c + 0) = dx6;
    t20 = far_d938a((int)t18, arg_12, arg_14, dx6, ax10);
    if ((int)t20 < 0) {
        return (int)t20;
    }
    for (;;) {
        t21 = fn_bd5b2(*(long *)((char *)&arg_0 + 0), 2);
        if (t21 != 120) {
            break;
        }
        t22 = far_cad00(0);
        t23 = far_caade(*(long *)((char *)&arg_0 + 0));
        if ((int)t23 >= 0) {
            goto L6;
        }
        if ((int)t23 == -0x300) {
            continue;
        }
        goto L7;
    }
    return t21;
L5:
    return (int)t12;
    goto L1;
    goto L1;
L6:
    t24 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_12), (int)t23, 2);
    if (t24 != 0) {
        return t24;
    }
    if (loc_12 != 6 || loc_11 > 1) {
        return -33;
    }
    t25 = far_cace7((int)t23, 0xc00, 0);
    if ((int)t25 != 0) {
        return (int)t25;
    }
    dx7 = arg_16;
    dx8 = dx7 - *(int *)((char *)&loc_c + 0);
    ax11 = (int)(((long)arg_18 << 16 | (unsigned)dx7) - loc_c >> 16);
    loc_e = ax11;
    loc_10 = dx8;
    dx9 = arg_12;
    dx10 = dx9 + *(int *)((char *)&loc_c + 0);
    ax12 = (int)far_d938a((int)t23, dx10, arg_14 + loc_a + (dx10 < dx9), dx8, ax11);
    if (ax12 < 0) {
        return ax12;
    }
L1:
    return 0;
L7:
    return (int)t23;
}
int far fn_bd5b2(long p0, int p1) { return 0; }
