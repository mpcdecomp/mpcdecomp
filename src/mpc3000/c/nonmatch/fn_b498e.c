/* differs: 308 at +3, 57 bytes; 311 at +3, 57 bytes; 312 at +3, 57 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8802;
extern char B_8804;
extern unsigned char B_901B[];
extern char B_9052;
extern char B_A5CE;
extern char W_9051;
extern int W_9053;
extern int far far_deee8(unsigned char far *, int);
extern int far far_e5796(char);

int far fn_b498e(void)
{
    int ax;
    int t1;

    t1 = far_e5796((char)(B_A5CE - 1));
    ax = ((char)(t1 >> 8) << 8 | (unsigned char)B_8802);
    if ((char)ax == B_8804) {
        return far_deee8((unsigned char far *)B_901B, t1);
    }
    W_9053 = t1;
    B_9052 = (char)1;
    W_9051 = (char)0;
    return ax;
}
