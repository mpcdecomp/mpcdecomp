/* differs: 308 at +5, 39 bytes; 311 at +5, 39 bytes; 312 at +5, 39 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char TBL_F779[];
extern int W_93F5;
extern long far far_dbe67(unsigned char far *, int, int);
extern int far far_dc03b(unsigned char far *);
extern long far far_dc2bf(unsigned char far *, int, int);
extern long far far_dc861(int);
extern long far fn_c8980(int);

long far fn_c891b(int arg_0)
{
    int ax;
    int dx;
    long t1;
    long t2;
    long t3;

    if (W_93F5 != 0) {
        t1 = far_dbe67((unsigned char far *)TBL_F779, W_93F5, 0);
    }
    t2 = far_dc861(arg_0);
    W_93F5 = (int)far_dc2bf((unsigned char far *)TBL_F779, 0x640, 0);
    t3 = fn_c8980(arg_0);
    dx = (int)(t3 >> 16);
    if (W_93F5 != 0) {
        ax = far_dc03b((unsigned char far *)TBL_F779);
        dx = UNDEF;
    }
    return ((long)dx << 16 | (unsigned)(int)t3);
}
long far fn_c8980(int p0) { return 0; }
