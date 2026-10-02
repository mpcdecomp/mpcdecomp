/* differs: 308 at +5, 281 bytes; 311 at +5, 281 bytes; 312 at +5, 284 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_956A;
extern int far far_b1ad0(int, int);
extern int far far_b1d48(void far *, char far *);
extern int far far_b1f96(int);
extern long far far_b6beb(long, char far *);
extern long far far_caade(long);
extern long far far_cab20(int);
extern int far far_cad6d(char far *, int, int);
extern int far far_d7903(void);
extern void far far_da3fa(int);
extern long far fn_d8f33(int, int, int);
extern long far fn_d91df(int, int, int, char);

long far far_d8b9c(int arg_0, int arg_2)
{
    char loc_2[2];
    char loc_18[22];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int di;
    long t1;
    long t2;
    int t3;
    int t4;
    int t5;

    far_b1ad0(7, 0);
    t1 = far_b6beb(*(long *)((char *)&arg_0 + 0), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_18));
    far_b1d48(MK_FP(SEG_DATA, 0x6a0e), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_18));
    far_b1f96(40);
    t2 = far_caade(*(long *)((char *)&arg_0 + 0));
    if ((int)t2 < 0) {
        return t2;
    }
    t3 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2), (int)t2, 2);
    if (t3 != 0) {
        return (long)MK_FP((int)(far_cab20((int)t2) >> 16), t3);
    }
    if (loc_2[0] != 1) {
        return (long)MK_FP((int)(far_cab20((int)t2) >> 16), -33);
    }
    B_956A = (char)(B_956A + 1);
    far_da3fa(1);
    if ((unsigned char)loc_2[1] < 2) {
        di = (int)fn_d91df(arg_0, arg_2, (int)t2, loc_2[1]);
        goto L1;
    }
    if (loc_2[1] == 2) {
        di = (int)fn_d8f33(arg_0, arg_2, (int)t2);
L1:
        far_da3fa(0);
        far_d7903();
        B_956A = (char)(B_956A - 1);
        return (long)MK_FP((int)(far_cab20((int)t2) >> 16), di);
    }
    return ((long)UNDEF << 16 | (unsigned)-32);
}
long far fn_d8f33(int p0, int p1, int p2) { return 0; }
long far fn_d91df(int p0, int p1, int p2, char p3) { return 0; }
