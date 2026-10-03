/* differs: 150 size 362, image 202; +1 image `enter 2, 0` CL `enter 0x10, 0`; 172 size 362, image 202; +1 image `enter 2, 0` CL `enter 0x10, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define UNDEF 0
extern char TBL_NAME_CHARSET[1];
extern long __far __fastcall x_fstrncpy();

long __far __pascal bcd_arithmetic_1(int arg_6, long arg_4, int arg_2, int arg_0)
{
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int bx;
    int bx2;
    int bx3;
    unsigned int cx;
    int cx2;
    int di;
    int di2;
    int di3;
    int es;
    int es2;
    int es3;
    int es4;
    int es5;
    int es6;
    int si;
    int si2;

    di = *(int *)((char *)&arg_4 + 0);
    ax = (int)x_fstrncpy(ax2, ((long)arg_6 << 16 | (unsigned)di), *(long *)((char *)&arg_0 + 0), 16);
    es = arg_6;
    *(char far *)MK_FP(es, di + 16) = (char)0;
    loc_2 = 0;
    if (*(char far *)MK_FP(es, di) == 0) {
        goto L1;
    }
    si = loc_2;
L2:
    bx = di;
    es2 = arg_6;
    *(char far *)MK_FP(es2, bx + si) = (char)(*(char far *)MK_FP(es2, bx + si) & 127);
    if (*(char far *)MK_FP(es2, bx + si) >= 32) {
        goto L3;
    }
    *(char far *)MK_FP(arg_6, bx + si) = (char)42;
    goto L4;
L1:
    si = loc_2;
    goto L5;
L3:
    es3 = arg_6;
    ax3 = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es3, bx + si));
    ax = ((char)-((char)ax3 < 0) << 8 | (unsigned char)TBL_NAME_CHARSET[(char)ax3]);
    bx = di;
    *(char far *)MK_FP(es3, bx + si) = (char)ax;
L4:
    si = si + 1;
    if (*(char far *)MK_FP(arg_6, bx + si) != 0) {
        goto L2;
    }
L5:
    if (si >= 16) {
        goto L6;
    }
    es4 = (int)(arg_4 >> 16);
    cx = 16 - si;
    di2 = (int)arg_4 + si;
    cx2 = cx >> 1;
    __stos2(MK_FP(es4, di2), 0x2020, cx2 * 2);
    if (!(cx & 1)) {
        goto L6;
    }
    *(char far *)MK_FP(es4, di2 + cx2 * 2) = (char)32;
L6:
    si2 = 15;
    bx2 = (int)arg_4;
    es5 = (int)(arg_4 >> 16);
    if (*(char far *)MK_FP(es5, bx2 + 15) == 32) {
        goto L7;
    }
    di3 = bx2;
    goto L8;
L7:
    di3 = bx2;
L9:
    si2 = si2 - 1;
    if (*(char far *)MK_FP(es5, di3 + si2) == 32) {
        goto L9;
    }
L8:
    if (si2 < 0) {
        goto L10;
    }
L11:
    bx3 = di3;
    es6 = arg_6;
    if (*(char far *)MK_FP(es6, bx3 + si2) == 42) {
        goto L12;
    }
    if (*(char far *)MK_FP(es6, bx3 + si2) != 32) {
        goto L13;
    }
L12:
    *(char far *)MK_FP(es6, bx3 + si2) = (char)95;
L13:
    si2 = si2 - 1;
    if (si2 >= 0) {
        goto L11;
    }
L10:
    return ((long)arg_6 << 16 | (unsigned)di3);
}
