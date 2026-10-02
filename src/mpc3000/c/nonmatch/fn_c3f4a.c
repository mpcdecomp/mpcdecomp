/* differs: 308 at +1, 83 bytes; 311 at +1, 83 bytes; 312 at +1, 83 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_537A;
extern char B_537C;
extern char B_83B9;
extern char B_83BA;
extern char B_83BB;
extern char B_D4BE;
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_c41b2(void);
extern int far far_d79ee(void);
extern int far far_d7b2c(void);
extern long far fn_c3c9b(void);
extern long far fn_c4643(int, int, int);
long far fn_c3c9b(void) { return 0; }

long far fn_c3f4a(void)
{
    int ax;
    int p2;
    long t1;
    int t2;
    long t3;
    int t4;

    while (B_537C != 3) {
        if (B_D4BE == 80) {
            p2 = 0xcc36;
            t1 = far_c41b2();
            B_D4BE = (char)0;
        }
        if (far_d7b2c() != 0) {
            t2 = far_d79ee();
            if (t2 == 117) {
                goto L1;
            }
            continue;
        }
    }
    return fn_c3c9b();
L1:
    B_537A = B_83B9;
    t3 = fn_c4643(B_83B9, B_83BA, B_83BB);
    B_537C = (char)0;
    far_b1ad0(7, 0);
    t4 = far_b1b05(MK_FP(SEG_DATA, 0x4deb));
    return ((long)UNDEF << 16 | (unsigned)0);
}
long far far_c41b2(void) { return 0; }
long far fn_c4643(int p0, int p1, int p2) { return 0; }
