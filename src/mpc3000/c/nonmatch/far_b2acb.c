/* differs: 308 at +6, 84 bytes; 311 at +6, 84 bytes; 312 at +6, 84 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern char B_D4B4;
extern long FP_7B55;
extern unsigned char TBL_7B5E[];
extern int W_9563;
extern long far far_b2739(unsigned char far *);
extern void far far_b2b15(long, unsigned char far *);

long far far_b2acb(int arg_0, int arg_2)
{
    int loc_4;
    int loc_2;
    int ax2;
    int bx;
    int dx2;
    int es;
    int t1;
    long t2;

    loc_2 = arg_2;
    loc_4 = arg_0;
    far_b2b15(((long)arg_2 << 16 | (unsigned)arg_0), (unsigned char far *)TBL_7B5E);
    t2 = far_b2739((unsigned char far *)TBL_7B5E);
    loc_2 = loc_2 - W_9563;
    bx = (int)FP_7B55;
    es = (int)(FP_7B55 >> 16);
    ax2 = loc_2;
    dx2 = loc_4;
    *(int far *)MK_FP(es, bx + 2) = ax2;
    *(int far *)MK_FP(es, bx) = dx2;
    B_D4B4 = (char)1;
    return ((long)dx2 << 16 | (unsigned)ax2);
}
void far far_b2b15(long p0, unsigned char far *p1) { }
