/* differs: 308 at +5, 1095 bytes; 311 at +5, 1097 bytes; 312 at +5, 1091 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_D5DD;
extern char B_D5DE;
extern unsigned char B_E410[];
extern char far *FP_E40C;
extern int W_E40E;
extern int far L_bec2b();
extern int far far_b08f7();
extern int far far_b1aac();
extern int far far_b1ad0();
extern int far far_b1b05();
extern int far far_b1d48();
extern int far far_b1f96();
extern long far far_b3b9f();
extern long far far_b6beb();
extern long far far_b6cd3();
extern long far far_b90dd();
extern long far far_c6547();
extern long far far_caade();
extern long far far_cab20();
extern long far far_cad00();
extern int far far_cad6d();
extern long far far_cb23d();
extern void far far_cb2af();
extern long far far_cca70();
extern int far far_cd551();

long far far_be846(int arg_0, int arg_2, char arg_4)
{
    char loc_2[2];
    unsigned char loc_3;
    char loc_e[11];
    char loc_22[20];
    char loc_38[22];
    char loc_8b8[2176];
    char loc_938[128];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int bx;
    int bx2;
    unsigned int cx;
    int cx2;
    int cx3;
    int cx4;
    int di;
    int di2;
    int di3;
    int dx;
    int flags;
    int p2368;
    int p2370;
    int si;
    int si2;
    int si3;
    int si4;
    int t1;
    long t10;
    long t11;
    int t12;
    int t13;
    int t14;
    long t15;
    int t16;
    int t17;
    int t18;
    long t19;
    long t2;
    long t20;
    int t21;
    long t22;
    long t23;
    long t24;
    int t25;
    long t26;
    long t27;
    long t28;
    int t3;
    int t4;
    long t5;
    int t6;
    int t7;
    long t8;
    long t9;

    if (arg_4 == 0) {
        B_D5DD = (char)103;
        t1 = far_b1aac();
        t2 = far_b6cd3(MK_FP(SEG_DATA, 0x47bc));
        t3 = far_b1ad0(1, 0);
        t4 = far_b1b05(MK_FP(SEG_DATA, 0x47d7));
        t5 = far_b90dd();
        t6 = far_b1ad0(7, 0);
        ax = far_b1b05(MK_FP(SEG_DATA, 0x4848));
        do {
            t7 = far_b08f7(1);
        } while (t7 == 0);
        if (t7 != 120) {
            return ((long)t7 << 16 | (unsigned)t7);
        }
L1:
        t8 = far_cb23d();
        t9 = far_cad00(0);
        far_b1ad0(7, 0);
        t10 = far_b6beb(*(long *)((char *)&arg_0 + 0), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_38));
        far_b1d48(MK_FP(SEG_DATA, 0x47ac), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_38));
        far_b1f96(40);
        t11 = far_caade(*(long *)((char *)&arg_0 + 0));
        *(int *)((char *)&loc_e + 8) = (int)t11;
        if ((int)t11 < 0) {
            return (long)MK_FP((int)(far_b3b9f((int)t11) >> 16), B_D5DE);
        }
        t12 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2), *(int *)((char *)&loc_e + 8), 2);
        if (t12 < 0) {
            return (long)MK_FP((int)(far_b3b9f(t12) >> 16), B_D5DE);
        }
        if (loc_2[0] != 10) {
            return (long)MK_FP((int)(far_b3b9f(-33) >> 16), B_D5DE);
        }
        if (loc_2[1] != 0) {
            return (long)MK_FP((int)(far_b3b9f(-32) >> 16), B_D5DE);
        }
        t13 = far_cad6d((unsigned char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_3), *(int *)((char *)&loc_e + 8), 1);
        if (t13 < 0) {
            return (long)MK_FP((int)(far_b3b9f(t13) >> 16), B_D5DE);
        }
        t14 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_e), *(int *)((char *)&loc_e + 8), 4);
        if (t14 != 0) {
            return (long)MK_FP((int)(far_b3b9f(t14) >> 16), B_D5DE);
        }
        t15 = far_cca70();
        flags = (int)(t15 >> 16) - *(int *)((char *)&loc_e + 2);
        if (!CC(">", flags) && (CC("<", flags) || (unsigned int)(int)t15 < (unsigned int)*(int *)((char *)&loc_e + 0))) {
            return (long)MK_FP((int)(far_b3b9f(2) >> 16), B_D5DE);
        }
        if (loc_3 < 24) {
            far_cb2af();
        }
        t17 = far_cad6d((unsigned char far *)B_E410, *(int *)((char *)&loc_e + 8), 0x13c);
        if (t17 != 0) {
            return (long)MK_FP((int)(far_b3b9f(t17) >> 16), B_D5DE);
        }
        *(int *)((char *)&loc_e + 4) = 0;
        ax5 = (int)far_b6beb(*(long *)((char *)&arg_0 + 0), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_22));
        si = 0;
        do {
            bx = (int)(unsigned)(loc_22 + si);
            if (*(char far *)MK_FP(SEG_STACK, bx) == 46 || *(int *)((char *)&loc_e + 4) == 1) {
                *(char far *)MK_FP(SEG_STACK, bx) = (char)32;
                *(int *)((char *)&loc_e + 4) = 1;
            }
            si = si + 1;
        } while (si < 16);
        loc_22[16] = (char)0;
        cx = ~__repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_22), 0, -1);
        dx = 17 - cx;
        if (cx > 17) {
            cx = cx + dx;
            dx = 0;
        }
        cx2 = cx >> 1;
        __movs2((unsigned char far *)B_E410, (unsigned char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)B_E410), cx2 * 2);
        di = (int)(unsigned)(B_E410 + cx2 * 2);
        cx3 = cx & 1;
        __movs1(MK_FP(SEG_DATA, di), (unsigned char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)(B_E410 + cx2 * 2)), cx3);
        __stos1(MK_FP(SEG_DATA, di + cx3), 0, dx);
        si2 = 0;
        while ((int)loc_3 > si2) {
            t28 = far_c6547(si2);
            ax7 = far_cad6d(*(long *)((char *)&FP_E40C + 0), *(int *)((char *)&loc_e + 8), 0x77e);
            if (ax7 != 0) {
                goto L2;
            }
            si2 = si2 + 1;
        }
        t18 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8b8), *(int *)((char *)&loc_e + 8), 0x880);
        if (t18 != 0) {
            return (long)MK_FP((int)(far_b3b9f(t18) >> 16), B_D5DE);
        }
        t19 = far_cab20(*(int *)((char *)&loc_e + 8));
        if ((int)t19 < 0) {
            return (long)MK_FP((int)(far_b3b9f((int)t19) >> 16), B_D5DE);
        }
        __stos2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_938), 0, 128);
        si3 = 0;
        di2 = (int)(unsigned)loc_8b8;
        do {
            if (*(char far *)MK_FP(SEG_STACK, di2) != 0) {
                loc_938[si3] = (char)1;
            }
            di2 = di2 + 17;
            si3 = si3 + 1;
        } while (si3 < 128);
        p2370 = (int)(unsigned)loc_8b8;
        ax6 = L_bec2b(1, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_938), MK_FP(SEG_STACK, p2370));
        di3 = ax6;
        if (ax6 != 0) {
            if (di3 < 0) {
                t20 = far_cb23d();
                far_cb2af();
                t22 = far_c6547(0);
                return (long)MK_FP((int)(far_b3b9f(di3) >> 16), 0);
            }
            return ((long)UNDEF << 16 | (unsigned)di3);
        }
        *(int *)((char *)&loc_e + 6) = 0;
        while (*(int *)((char *)&loc_e + 6) < 24) {
            p2368 = *(int *)((char *)&loc_e + 6);
            t27 = far_c6547(p2368);
            cx4 = UNDEF;
            si4 = 0;
            while (si4 < 64) {
                t23 = (long)(int)si4 * 24L;
                bx2 = (int)*(long *)((char *)&FP_E40C + 0) + (int)t23;
                di3 = bx2;
                if (*(char far *)MK_FP((int)(*(long *)((char *)&FP_E40C + 0) >> 16), bx2 + 62) != -1) {
                    t24 = (long)(int)(unsigned char)*(char far *)MK_FP(W_E40E, di3 + 62) * 17L;
                    p2370 = (int)(unsigned)(loc_8b8 + (int)t24);
                    t25 = far_cd551(MK_FP(SEG_STACK, p2370));
                    cx4 = UNDEF;
                    p2368 = t25;
                    t26 = (long)(int)si4 * 24L;
                    *(char far *)((char far *)*(long *)((char *)&FP_E40C + 0) + 62 + (int)t26) = (char)p2368;
                }
                si4 = si4 + 1;
            }
            *(int *)((char *)&loc_e + 6) = *(int *)((char *)&loc_e + 6) + 1;
        }
        return (long)MK_FP((int)(far_c6547(0) >> 16), 0);
    }
    goto L1;
L2:
    return (long)MK_FP((int)(far_b3b9f(ax7) >> 16), B_D5DE);
}
int far L_bec2b(int p0, char far *p1, void far *p2) { return 0; }
