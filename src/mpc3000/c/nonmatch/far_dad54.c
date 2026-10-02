/* differs: 308 at +4, 99 bytes; 311 at +4, 98 bytes; 312 at +4, 98 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
extern int W_8814;
extern long far far_dea12(int, char far *, int, int, int, int);

long far far_dad54(int arg_0)
{
    char loc_6;
    char loc_5[5];
    int ax;
    int ax2;
    int dx;
    int p4;
    int p6;
    int p8;
    long t1;

    if (W_8814 != 0) {
        ax = W_8814 << 1;
        loc_6 = (char)-120;
        *(int *)((char *)&loc_5 + 0) = ((char)(ax >> 8) << 8 | (unsigned char)((unsigned int)(char)ax >> 1));
        W_8814 = 0;
        t1 = far_dea12(arg_0, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6), 3, p8, p6, p4);
        ax2 = (int)t1;
        dx = (int)(t1 >> 16);
    }
    return ((long)dx << 16 | (unsigned)ax2);
}
long far far_dea12(int p0, char far *p1, int p2, int p3, int p4, int p5) { return 0; }
