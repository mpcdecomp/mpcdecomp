/* differs: 308 at +0, 513 bytes; 311 at +0, 513 bytes; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern unsigned char B_943C;
extern unsigned char B_943D;
extern unsigned char B_943E;
extern unsigned char TBL_943B;
extern int far far_fb14d(void);
extern int far far_fb18a(void);
extern int far far_fb4a2(void);
extern long near fn_d6af2(void);
extern int far fn_d7b4e(void);

long interrupt far far_d69ca(void)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int di;
    int dx;
    long t1;
    long t2;

    dx = (int)(far_fb14d() >> 16);
    di = 0;
    if ((*(char far *)MK_FP(-0x7ff0, (unsigned)&TBL_943B) & 2) == 0) {
        goto L1;
    }
    di = di | 16;
    if ((inp(194) & 1) == 0) {
        goto L1;
    }
    ax = (int)fn_d6af2();
L1:
    if ((*(char far *)MK_FP(-0x7ff0, (unsigned)&B_943C) & 2) == 0) {
        goto L2;
    }
    di = di | 32;
    if ((inp(202) & 1) == 0) {
        goto L2;
    }
    ax2 = (int)fn_d6af2();
L2:
    if ((*(char far *)MK_FP(-0x7ff0, (unsigned)&B_943D) & 2) == 0) {
        goto L3;
    }
    di = di | 64;
    if ((inp(210) & 1) == 0) {
        goto L3;
    }
    ax3 = (int)fn_d6af2();
L3:
    if ((*(char far *)MK_FP(-0x7ff0, (unsigned)&B_943E) & 2) == 0) {
        goto L4;
    }
    di = di | 128;
    if ((inp(218) & 1) == 0) {
        goto L4;
    }
    t1 = fn_d6af2();
L4:
    if (fn_d7b4e() != 0) {
        goto L5;
    }
    ax4 = far_fb4a2();
L5:
    _disable();
    *(char far *)MK_FP(-0x7ff0, (unsigned)&TBL_943B) = (char)(*(char far *)MK_FP(-0x7ff0, (unsigned)&TBL_943B) & -3);
    outp(198, *(char far *)MK_FP(-0x7ff0, (unsigned)&TBL_943B));
    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_943C) = (char)(*(char far *)MK_FP(-0x7ff0, (unsigned)&B_943C) & -3);
    outp(206, *(char far *)MK_FP(-0x7ff0, (unsigned)&B_943C));
    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_943D) = (char)(*(char far *)MK_FP(-0x7ff0, (unsigned)&B_943D) & -3);
    outp(214, *(char far *)MK_FP(-0x7ff0, (unsigned)&B_943D));
    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_943E) = (char)(*(char far *)MK_FP(-0x7ff0, (unsigned)&B_943E) & -3);
    outp(222, *(char far *)MK_FP(-0x7ff0, (unsigned)&B_943E));
    outp(-0x3ff0, (char)100);
    outp(-0x3ff0, (char)-60);
    if ((di & 0x100) == 0) {
        goto L6;
    }
    *(char far *)MK_FP(-0x7ff0, (unsigned)&TBL_943B) = (char)(*(char far *)MK_FP(-0x7ff0, (unsigned)&TBL_943B) | 2);
    outp(198, *(char far *)MK_FP(-0x7ff0, (unsigned)&TBL_943B));
L6:
    if ((di & 0x200) == 0) {
        goto L7;
    }
    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_943C) = (char)(*(char far *)MK_FP(-0x7ff0, (unsigned)&B_943C) | 2);
    outp(206, *(char far *)MK_FP(-0x7ff0, (unsigned)&B_943C));
L7:
    if ((di & 0x400) == 0) {
        goto L8;
    }
    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_943D) = (char)(*(char far *)MK_FP(-0x7ff0, (unsigned)&B_943D) | 2);
    outp(214, *(char far *)MK_FP(-0x7ff0, (unsigned)&B_943D));
L8:
    if ((di & 0x800) == 0) {
        goto L9;
    }
    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_943E) = (char)(*(char far *)MK_FP(-0x7ff0, (unsigned)&B_943E) | 2);
    outp(222, *(char far *)MK_FP(-0x7ff0, (unsigned)&B_943E));
L9:
    t2 = far_fb18a();
    return 0L;
}
long near fn_d6af2(void) { return 0; }
int far fn_d7b4e(void) { return 0; }
