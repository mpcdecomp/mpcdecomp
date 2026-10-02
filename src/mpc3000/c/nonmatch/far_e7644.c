/* differs: 308 at +5, 130 bytes; 311 at +5, 130 bytes; 312 at +5, 130 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8A9F;
extern unsigned char B_901B[];
extern int W_947A;
extern int W_947E;
extern int far far_e0031();
extern long far far_e51be();
extern long far far_e5a99();
extern long far far_eb007();

long far far_e7644(void)
{
    long loc_8;
    char loc_c[4];
    int ax;
    int dx;
    int dx2;
    int t1;
    long t2;
    long t3;
    long t4;
    long t5;

    t1 = far_e0031(B_901B);
    t2 = far_e51be((unsigned char far *)B_901B, B_8A9F);
    t3 = far_e5a99(B_901B);
    t4 = far_eb007((unsigned char far *)B_901B, *(long *)((char *)&W_947A + 0), loc_c);
    t5 = far_eb007((unsigned char far *)B_901B, *(long *)((char *)&W_947E + 0), &loc_8);
    dx = *(int *)((char *)&loc_c + 0);
    dx2 = dx - *(int *)((char *)&loc_8 + 0);
    *(int *)((char *)&loc_8 + 6) = (int)(((long)*(int *)((char *)&loc_c + 2) << 16 | (unsigned)dx) - loc_8 >> 16);
    *(int *)((char *)&loc_8 + 4) = dx2;
    far_e0031(B_901B);
    return *(long *)((char *)&loc_8 + 4);
}
