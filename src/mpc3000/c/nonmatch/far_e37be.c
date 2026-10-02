/* differs: 308 absent; 311 at +5, 480 bytes; 312 at +5, 480 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8800;
extern char B_8A9A;
extern char B_8A9C;
extern unsigned char B_8C41[];
extern unsigned char B_901B[];
extern char TBL_8C83[];
extern char TBL_905D[];
extern long far far_e1982(long, int);

long far far_e37be(long arg_0, int arg_2)
{
    char loc_66[100];
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int cx;
    int cx2;
    int cx3;
    int cx4;
    int dx;
    int es;
    int es2;
    int p110;
    int p112;
    int p114;
    int si;
    int si2;
    long t1;

    p110 = SEG_STACK;
    es = p110;
    __stos2((char far *)MK_FP(es, (unsigned int)(unsigned)loc_66), 0, 100);
    if (B_8800 == 0) {
        ax = SEG_DATA;
        if (arg_2 == ax) {
            if (*(int *)((char *)&arg_0 + 0) == (unsigned int)(unsigned)B_901B) {
                cx = 0;
                si = *(int *)((char *)&arg_0 + 0) + 66;
                while (cx <= 99) {
                    es = arg_2;
                    if (*(char far *)MK_FP(es, si) != -1) {
                        dx = (int)(unsigned)loc_66;
                        ax = *(char far *)MK_FP(es, si) + dx;
                        bx = ax;
                        *(char far *)MK_FP(SEG_STACK, bx) = (char)1;
                    }
                    si = si + 1;
                    cx = cx + 1;
                }
                loc_2 = 0;
                while (loc_2 <= 99) {
                    ax = (int)(unsigned)loc_66;
                    bx = loc_2 + ax;
                    if (*(char far *)MK_FP(SEG_STACK, bx) == 0) {
                        p110 = loc_2;
                        p112 = arg_2;
                        p114 = *(int *)((char *)&arg_0 + 0);
                        t1 = far_e1982(((long)p112 << 16 | (unsigned)p114), p110);
                        bx = UNDEF;
                        cx = UNDEF;
                        es = UNDEF;
                        ax = (int)t1;
                        dx = (int)(t1 >> 16);
                    }
                    loc_2 = loc_2 + 1;
                }
                loc_2 = 0;
                cx2 = 0;
                si2 = *(int *)((char *)&arg_0 + 0) + 66;
                while (cx2 <= 99) {
                    if (*(char far *)MK_FP(arg_2, si2) == -1) {
                        for (;;) {
                            bx = (int)(unsigned)(loc_66 + loc_2);
                            if (*(char far *)MK_FP(SEG_STACK, bx) == 0) {
                                break;
                            }
                            loc_2 = loc_2 + 1;
                        }
                        ax = ((char)((unsigned int)(unsigned)loc_66 >> 8) << 8 | (unsigned char)*(char *)((char *)&loc_2 + 0));
                        *(char far *)MK_FP(arg_2, si2) = (char)ax;
                        loc_2 = loc_2 + 1;
                    }
                    si2 = si2 + 1;
                    cx2 = cx2 + 1;
                }
            }
        }
    }
    if (arg_2 == SEG_DATA && *(int *)((char *)&arg_0 + 0) == (unsigned int)(unsigned)B_901B) {
        es2 = (int)(arg_0 >> 16);
        bx2 = (int)*(long far *)MK_FP(es2, (int)arg_0 + 2);
        ax2 = ((char)(SEG_DATA >> 8) << 8 | (unsigned char)*(char far *)MK_FP((int)(*(long far *)MK_FP(es2, bx2 + 2) >> 16), bx2 + 0x14e));
        B_8A9A = (char)ax2;
        B_8A9C = TBL_905D[(char)ax2];
    }
    ax3 = SEG_DATA;
    if (arg_2 == ax3 && *(int *)((char *)&arg_0 + 0) == (unsigned int)(unsigned)B_8C41) {
        ax3 = -1;
        __stos2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_66), ax3, 100);
        cx3 = 0;
        while (cx3 <= 99) {
            bx4 = cx3;
            if (TBL_8C83[bx4] != -1) {
                dx = (int)(unsigned)loc_66;
                ax3 = TBL_8C83[bx4] + dx;
                *(char far *)MK_FP(SEG_STACK, ax3) = (char)cx3;
            }
            cx3 = cx3 + 1;
        }
        loc_2 = 0;
        cx4 = 0;
        for (;;) {
L1:
            if (cx4 > 99) {
                break;
            }
            ax3 = (int)(unsigned)loc_66;
            if (*(char far *)MK_FP(SEG_STACK, cx4 + ax3) == -1) {
                while (loc_2 <= 99) {
                    bx3 = loc_2;
                    if (TBL_8C83[bx3] == -1) {
                        goto L2;
                    }
                    loc_2 = loc_2 + 1;
                }
            }
            goto L3;
        }
    }
    return ((long)dx << 16 | (unsigned)ax3);
L2:
    TBL_8C83[bx3] = (char)cx4;
    loc_2 = loc_2 + 1;
L3:
    cx4 = cx4 + 1;
    goto L1;
}
