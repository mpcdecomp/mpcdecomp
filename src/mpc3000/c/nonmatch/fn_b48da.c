/* differs: 308 at +13, 74 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern char TBL_8A93[];
extern unsigned char TBL_A5CF[];
extern char TBL_E56A[];
extern int W_9045;
extern unsigned char W_D5F3[];
extern long far far_eb6bd(char far *, void far *);
extern long far far_eb86b(long, unsigned char far *);

long far fn_b48da(int arg_0)
{
    int ax;
    char near *di;
    int si;
    long t1;

    si = 0;
    ax = (int)(unsigned)(TBL_A5CF + arg_0 * 5);
    di = (char near *)ax;
    do {
        ax = ((char)(ax >> 8) << 8 | (unsigned char)TBL_E56A[si]);
        *di = (char)ax;
        TBL_8A93[si] = (char)ax;
        di = di + 1;
        si = si + 1;
    } while (si < 5);
    t1 = far_eb6bd((char far *)TBL_8A93, MK_FP(SEG_DATA, 0x7e5f));
    return far_eb86b(*(long *)((char *)&W_9045 + 0), (unsigned char far *)W_D5F3);
}
