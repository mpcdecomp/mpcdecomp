/* differs: 308 at +5, 224 bytes; 311 at +5, 227 bytes; 312 at +5, 226 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern char B_D4BB;
extern char TBL_79A5[];
extern long far far_b129e(void);
extern int far far_b1ab2(int);
extern int far far_b1af9(void);
extern int far far_b1aff(void);
extern int far far_b1b05(void far *);
extern int far far_b1f96(int);
extern int far far_ba0a7(int);
extern long far far_ebde1(int, int);

long far far_ebcce(char far *arg_0, int arg_4, int arg_6)
{
    int loc_2;
    int ax;
    int ax2;
    int dx;
    int p12;
    int p14;
    int si;
    int t1;
    int t2;
    int t3;
    long t4;
    long t5;
    int t6;

    far_b1f96(12);
    p12 = 0x6d72;
    t1 = far_b1b05(MK_FP(SEG_DATA, p12));
    dx = UNDEF;
    B_7B8D = (char)0;
    B_D4BB = (char)0;
    si = 0;
    for (;;) {
        if (si == 0) {
            t6 = far_b1ab2(3);
            loc_2 = far_ba0a7(0);
            ax2 = far_b1ab2(0);
            dx = UNDEF;
            if (B_D4BB != 0) {
                if (loc_2 != 72) {
                    t2 = far_b1aff();
                    dx = UNDEF;
                    B_D4BB = (char)0;
L1:
                    if ((TBL_79A5[loc_2] & 2) != 0) {
                        loc_2 = loc_2 - 48;
                        if (loc_2 == 0) {
                            loc_2 = 10;
                        }
                        if (loc_2 >= 1 && loc_2 <= arg_4) {
                            goto L2;
                        }
                        continue;
                    }
                    if (loc_2 == 72) {
                        if (B_D4BB == 0) {
                            t3 = far_b1af9();
                            t4 = far_b129e();
                            dx = (int)(t4 >> 16);
                            B_D4BB = (char)1;
                            continue;
                        }
                        continue;
                    }
                    p12 = loc_2;
                    p14 = 0xf32f;
                    t5 = far_ebde1(p12, arg_6);
                    dx = (int)(t5 >> 16);
                    si = (int)t5;
                    continue;
                }
                continue;
            }
            goto L1;
        }
        break;
    }
    return ((long)dx << 16 | (unsigned)si);
L2:
    *arg_0 = *(char *)((char *)&loc_2 + 0);
    return ((long)dx << 16 | (unsigned)0);
}
long far far_ebde1(int p0, int p1) { return 0; }
