/* differs: 308 at +5, 267 bytes; 311 at +5, 267 bytes; 312 at +5, 266 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_F77A {
    int f_0;
};
extern unsigned char B_8C41[];
extern unsigned char B_901B[];
extern char B_956A;
extern unsigned char TBL_F779;
extern struct g_TBL_F77A TBL_F77A;
extern int W_947E;
extern long far far_d97ca(int, unsigned char far *, int);
extern int far far_daa82(int);
extern int far far_e0031(unsigned char far *);
extern long far far_e3d12(unsigned char far *, long);
extern long far far_e51be(unsigned char far *, int, int);
extern long far far_e7644(void);

long far far_dfd13(int arg_0, int arg_2)
{
    int loc_2;
    long loc_4;
    int loc_6;
    long loc_8;
    int ax;
    int ax2;
    int flags;
    long t1;
    long t2;
    int t3;
    long t4;

    far_e0031((unsigned char far *)B_8C41);
    t1 = far_e7644();
    loc_2 = (int)(t1 >> 16);
    *(int *)((char *)&loc_4 + 0) = (int)t1;
    if ((int)far_e51be((unsigned char far *)B_901B, arg_0, 1) == 0) {
        goto L1;
    }
    return 0L;
L1:
    t2 = far_e3d12((unsigned char far *)B_901B, *(long *)((char *)&W_947E + 0));
    B_956A = (char)(B_956A + 1);
    loc_6 = 0;
    *(int *)((char *)&loc_8 + 0) = 0;
    goto L2;
L3:
    t4 = far_d97ca(1, (unsigned char far *)&TBL_F779, 0x640);
    ax2 = TBL_F779 & 248;
    if (ax2 == 136) {
        goto L4;
    }
    if (ax2 == 168) {
        goto L5;
    }
    if (ax2 == 248) {
        goto L6;
    }
    goto L7;
L4:
    t3 = far_daa82(TBL_F77A.f_0);
    *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) - t3;
    loc_2 = (int)(loc_4 - (long)(int)t3 >> 16);
    goto L5;
L6:
    loc_2 = 0;
    *(int *)((char *)&loc_4 + 0) = 0;
    goto L5;
L7:
    if (arg_2 == 0) {
        goto L5;
    }
    if ((unsigned char)*(char *)((char *)&TBL_F77A + 0) != arg_2) {
        goto L2;
    }
L5:
    *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) + (int)t4;
    loc_6 = (int)(loc_8 + (long)(int)(int)t4 >> 16);
L2:
    flags = loc_2;
    if (CC(">", flags)) {
        goto L3;
    }
    if (CC("!=", flags)) {
        goto L8;
    }
    if (*(int *)((char *)&loc_4 + 0) != 0) {
        goto L3;
    }
L8:
    B_956A = (char)(B_956A - 1);
    return loc_8;
}
