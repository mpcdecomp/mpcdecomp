/* differs: 308 at +0, 206 bytes; 311 at +0, 206 bytes; 312 at +0, 207 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8A9C;
extern char B_EFA4;
extern char B_EFA5;
extern char B_EFA6;
extern char B_EFA7;
extern char B_EFA8;
extern char B_EFA9;
extern char B_EFAA;
extern char B_EFAB;
extern char B_EFAC;
extern char B_EFAD;
extern char B_EFAE;
extern char B_EFAF;
extern char TBL_9125[];
extern char TBL_9189[];
extern char TBL_91ED[];
extern char TBL_9251[];
extern long far far_e4a1d(int);

long far fn_c007f(void)
{
    int ax;
    int ax2;
    int dx;
    int dx2;
    int dx3;
    long t1;

    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)B_8A9C);
    dx = ((char)(dx2 >> 8) << 8 | (unsigned char)TBL_9125[(char)ax]);
    if ((char)dx != -1) {
        B_EFAE = (char)(((char)dx & 15) + 1);
        B_EFAC = (char)((char)dx >> 4);
    } else {
        B_EFAC = (char)0;
        B_EFAE = (char)0;
    }
    dx3 = ((char)(dx >> 8) << 8 | (unsigned char)TBL_9189[(char)ax]);
    if ((char)dx3 != -1) {
        B_EFAF = (char)(((char)dx3 & 15) + 1);
        B_EFAD = (char)((char)dx3 >> 4);
    } else {
        B_EFAD = (char)0;
        B_EFAF = (char)0;
    }
    B_EFAA = B_EFAE;
    B_EFAB = B_EFAF;
    B_EFA8 = B_EFAC;
    B_EFA9 = B_EFAD;
    B_EFA6 = TBL_9251[(char)ax];
    B_EFA5 = TBL_91ED[(char)ax];
    t1 = far_e4a1d((char)ax);
    B_EFA4 = (char)(int)t1;
    B_EFA7 = (char)(int)t1;
    return t1;
}
