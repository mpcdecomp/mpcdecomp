/* differs: 308 at +0, 585 bytes; 311 at +0, 585 bytes; 312 at +0, 585 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int near fn_f8fb4(void);
extern long near fn_f8fe3(void);
extern int near fn_f94b4(void);
extern int near fn_f950a(void);

int near fn_f8ee3(void)
{
    unsigned int ax;
    int bx;
    char near *bx2;
    int bx3;
    int cx;
    int cx2;
    int cx3;
    int cx4;
    int di;
    int dx;
    int dx2;
    int dx3;
    int es;
    int es2;
    int flags;
    int si;
    char near *si2;
    int si3;
    int t1;
    long t2;
    long t3;
    int t4;

    cx = ((char)(ax >> 8) << 8 | (unsigned char)(char)cx2);
    if ((char)(cx >> 8) != *(char *)0x16) {
        goto L1;
    }
    goto L2;
L1:
    if (*(char *)0x16 == -1) {
        goto L3;
    }
    *(char *)0x16 = (char)-1;
    bx = UNDEF;
    cx = UNDEF;
    es = UNDEF;
    ax = fn_f950a();
    dx = UNDEF;
    if (CC(">=u", UNDEF)) {
        goto L3;
    }
    goto L4;
L3:
    *(char *)0x18 = (char)(cx >> 8);
    t1 = __insn("int 0x40", (unsigned char)(char)ax, bx, cx, ((char)(dx >> 8) << 8 | (unsigned char)(char)cx), si, di, es, SEG_DATA);
    t2 = fn_f8fe3();
    es2 = UNDEF;
    ax = (int)t2;
    dx2 = (int)(t2 >> 16);
    flags = UNDEF;
    if (CC(">=u", flags)) {
        goto L5;
    }
    if ((char)(ax >> 8) == -128) {
        goto L4;
    }
    *(char *)0x15 = (char)3;
L6:
    *(char *)0x15 = (char)(*(char *)0x15 - 1);
    t3 = fn_f8fe3();
    es2 = UNDEF;
    ax = (int)t3;
    dx2 = (int)(t3 >> 16);
    flags = UNDEF;
    if (CC(">=u", flags)) {
        goto L5;
    }
    if (*(char *)0x15 == 0) {
        goto L4;
    }
    goto L6;
L5:
    bx2 = 0;
    cx3 = 21;
    si2 = (char near *)55;
L7:
    ax = ((char)(ax >> 8) << 8 | (unsigned char)*si2);
    *bx2 = (char)ax;
    si2 = si2 + 1;
    bx2 = bx2 + 1;
    flags = (int)(unsigned)bx2;
    cx3 = cx3 - 1;
    if (cx3 != 0) {
        goto L7;
    }
    if ((unsigned int)*(int *)0xf > 32) {
        goto L8;
    }
    if (*(int *)0xf == 0) {
        goto L8;
    }
    ax = *(int *)0xd;
    if (ax == 0) {
        goto L8;
    }
    if (ax > 20) {
        goto L8;
    }
    si3 = 0x31f;
    cx4 = 3;
    dx3 = ((char)(dx2 >> 8) << 8 | (unsigned char)0);
    goto L9;
L8:
    ax = (4 << 8 | (unsigned char)(char)ax);
L4:
    goto L2;
L9:
    bx3 = *(int far *)MK_FP(0xf800, si3);
    if (ax == *(int far *)MK_FP(0xf800, bx3 + 13)) {
        goto L10;
    }
    si3 = si3 + 2;
    dx3 = ((char)(dx3 >> 8) << 8 | (unsigned char)((char)dx3 + 1));
    cx4 = cx4 - 1;
    if (cx4 != 0) {
        goto L9;
    }
    goto L11;
L10:
    if (*(char *)0x15 == (char)dx3) {
        goto L11;
    }
    ax = __insn("int 0x40", (7 << 8 | (unsigned char)(char)dx3), bx3, cx4, dx3, si3, di, es2, SEG_DATA);
    dx3 = UNDEF;
    if (CC("<u", UNDEF)) {
        goto L2;
    }
L11:
    *(char *)0x15 = (char)dx3;
    t4 = fn_f8fb4();
    ax = fn_f94b4();
    if (CC("<u", UNDEF)) {
        goto L2;
    }
    *(char *)0x17 = (char)1;
    *(char *)0x16 = *(char *)0x18;
L2:
    return ax;
}
int near fn_f8fb4(void) { return 0; }
long near fn_f8fe3(void) { return 0; }
int near fn_f94b4(void) { return 0; }
int near fn_f950a(void) { return 0; }
