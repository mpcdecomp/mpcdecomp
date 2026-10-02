/* differs: 308 at +3, 133 bytes; 311 at +3, 133 bytes; 312 at +3, 133 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_955D;
extern char B_A5C7;
extern char B_A5C8;
extern char B_D5DE;
extern char TBL_905D[];
extern long far far_dcf84(int, int, int, int);
extern long far far_ddfd9(long, int);
extern int far far_dea54(long, int);

long far far_dd133(int arg_0, int arg_2, int arg_4)
{
    int ax;
    int dx;
    long t1;
    int t2;
    long t3;

    if (B_A5C7 == 0 && B_A5C8 == 0 && B_D5DE != 116) {
        t1 = far_ddfd9(*(long *)((char *)&arg_0 + 0), arg_4);
        t2 = far_dea54(*(long *)((char *)&arg_0 + 0), ((char)-(B_955D < 0) << 8 | (unsigned char)TBL_905D[B_955D]));
        t3 = far_dcf84(arg_0, arg_2, arg_4, 2);
        ax = (int)t3;
        dx = (int)(t3 >> 16);
    }
    return ((long)dx << 16 | (unsigned)ax);
}
