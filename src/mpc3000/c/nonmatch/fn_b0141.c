/* differs: 308 at +5, 607 bytes; 311 at +5, 604 bytes; 312 at +5, 602 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_956A;
extern unsigned char TBL_9419[];
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b1f96(int);
extern long far far_b3b9f(int);
extern long far far_be357(char far *, char);
extern long far far_be846(char far *, int);
extern long far far_c6547(int);
extern long far far_cac0f(char far *, char far *);
extern long far far_cac7b(char far *, char far *);
extern long far far_cad00(int);
extern void far far_cb18f(void);
extern int far far_d7b9c(char far *);
extern long far far_deabe(void);
extern int far far_fb98c(char far *);

void far fn_b0141(int arg_0, int arg_2)
{
    char loc_17[23];
    char loc_1e[7];
    char loc_22[4];
    char loc_32[16];
    int ax;
    int ax2;
    int ax3;
    unsigned int cx;
    int cx2;
    int cx3;
    int di;
    int ds;
    int dx;
    int dx2;
    long t1;
    long t2;
    long t3;
    int t4;
    int t5;
    long t6;
    int t7;
    long t8;
    long t9;

    far_b1ad0(7, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x1222));
    t1 = far_b1f96(40);
    t2 = far_cad00(0);
    if (arg_0 != 0) {
        __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_32), MK_FP(SEG_DATA, 0x1234), 16);
        loc_22[0] = *(char *)(0x1244);
    } else {
        __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_32), MK_FP(SEG_DATA, 0x1245), 16);
        loc_22[0] = *(char *)(0x1255);
    }
    B_956A = (char)(B_956A + 1);
    if (arg_0 == 0) {
        __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_22), MK_FP(SEG_DATA, 0x1256), 4);
        if ((int)far_cac0f((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_32), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1e)) == 0) {
            t3 = far_fb98c((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_17));
        }
    }
    if ((arg_2 & 1) == 0) {
        __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_22), MK_FP(SEG_DATA, 0x125a), 4);
        if ((int)far_cac0f((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_32), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1e)) == 0) {
            if ((int)far_be846((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_17), 1) != 0) {
                far_cb18f();
            } else {
                arg_2 = arg_2 | 1;
            }
        } else if (arg_0 == 0) {
            __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_22), MK_FP(SEG_DATA, 0x125e), 4);
            ax3 = (int)far_cac0f((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_32), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1e));
            dx = ax3;
            *(int *)((char *)&loc_17 + 21) = 1;
            while (dx == 0 && *(int *)((char *)&loc_17 + 21) <= 24) {
                if ((int)far_be357((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_17), loc_17[21]) != 0) {
                    goto L1;
                }
                ax3 = (int)far_cac7b((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_32), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1e));
                dx = ax3;
                *(int *)((char *)&loc_17 + 21) = *(int *)((char *)&loc_17 + 21) + 1;
            }
            goto L2;
        }
    }
    goto L3;
L1:
    *(int *)((char *)&loc_17 + 21) = 0;
L2:
    if (*(int *)((char *)&loc_17 + 21) == 0) {
        far_cb18f();
    } else if (*(int *)((char *)&loc_17 + 21) > 1) {
        arg_2 = arg_2 | 1;
    }
    t6 = far_c6547(0);
L3:
    if ((arg_2 & 2) != 0) {
        ds = SEG_DATA;
    } else {
        __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_22), MK_FP(SEG_DATA, 0x1262), 4);
        if ((int)far_cac0f((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_32), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1e)) == 0) {
            t7 = far_d7b9c((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_17));
            if (t7 != 0) {
                t8 = far_b3b9f(t7);
                t9 = far_deabe();
                ds = SEG_DATA;
            } else {
                cx = ~__repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_17), 0, -1);
                dx2 = 16 - cx;
                if (cx > 16) {
                    cx = cx + dx2;
                    dx2 = 0;
                }
                cx2 = cx >> 1;
                __movs2((unsigned char far *)TBL_9419, (unsigned char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)TBL_9419), cx2 * 2);
                di = (int)(unsigned)(TBL_9419 + cx2 * 2);
                cx3 = cx & 1;
                __movs1(MK_FP(SEG_DATA, di), (unsigned char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)(TBL_9419 + cx2 * 2)), cx3);
                __stos1(MK_FP(SEG_DATA, di + cx3), 0, dx2);
                ds = SEG_DATA;
                arg_2 = arg_2 | 2;
            }
        } else {
            ds = SEG_DATA;
        }
    }
    *(char far *)MK_FP(ds, (unsigned)&B_956A) = (char)(*(char far *)MK_FP(ds, (unsigned)&B_956A) - 1);
    return;
}
