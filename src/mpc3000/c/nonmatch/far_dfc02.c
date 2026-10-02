/* differs: 308 at +5, 282 bytes; 311 at +5, 283 bytes; 312 at +5, 282 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8A9F;
extern unsigned char B_8C41[];
extern char B_901B;
extern int W_8C47;
extern int W_8C49;
extern int W_8C4B;
extern int W_8C4D;
extern int W_8C53;
extern int W_8C55;
extern long far far_daa07(int, int, int, int);
extern int far far_deee8(unsigned char far *, int);
extern int far far_e0031();
extern long far far_e51be();

long far far_dfc02(int arg_0, int arg_2, int arg_4)
{
    int loc_2;
    unsigned int loc_4;
    int loc_6;
    int loc_8;
    int loc_a;
    long loc_c;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    unsigned int cx;
    int dx;
    unsigned int dx2;
    int flags;
    int si;
    long t1;
    long t2;
    long t3;
    long t4;

    si = arg_0;
    if (B_8A9F == si && B_901B == 0) {
        ax = far_e0031((char far *)&B_901B);
    }
    far_e0031((unsigned char far *)B_8C41);
    if ((int)far_e51be((unsigned char far *)B_8C41, si, 1) != 0) {
        return 0L;
    }
    far_deee8((unsigned char far *)B_8C41, arg_2);
    dx = W_8C53;
    loc_2 = W_8C55;
    loc_4 = dx;
    far_deee8((unsigned char far *)B_8C41, arg_4);
    ax5 = W_8C55;
    dx2 = W_8C53;
    loc_6 = ax5;
    loc_8 = dx2;
    flags = ax5 - loc_2;
    if (!CC(">u", flags) && (CC("<u", flags) || dx2 < loc_4)) {
        t1 = far_daa07(W_8C47, W_8C49, loc_4, loc_2);
        t2 = far_daa07(loc_8, loc_6, W_8C4B, W_8C4D);
        cx = (int)t1 + (int)t2;
        loc_a = (int)(t1 >> 16) + (int)(t2 >> 16) + (cx < (unsigned int)(int)t1);
        *(int *)((char *)&loc_c + 0) = cx;
    } else {
        t3 = far_daa07(loc_8, loc_6, loc_4, loc_2);
        loc_a = (int)(t3 >> 16);
        *(int *)((char *)&loc_c + 0) = (int)t3;
    }
    if (B_8A9F == si) {
        t4 = far_e51be((char far *)&B_901B);
    }
    far_e0031();
    return loc_c;
}
