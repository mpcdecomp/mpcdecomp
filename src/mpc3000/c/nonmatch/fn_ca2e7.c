/* differs: 308 absent; 311 at +F, 141 bytes; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
extern char B_D5FD;
extern char B_D5FE;
extern char B_D600;
extern char B_D601;
extern char B_D602;
extern char TBL_D5FF[];
extern int far far_b1af9(void);
extern int far far_b1aff(void);
extern long far far_b1d48(void far *, int, int, int);
extern long far far_cc62d(void);
extern void far far_d777e(void);
extern void far far_d77b3(void);
extern void far fn_ca39a(void);

long far fn_ca2e7(int arg_0, int arg_2)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int di;
    int si;
    long t1;
    int t2;
    int t3;
    int t4;
    long t5;

    t1 = far_cc62d();
    ax = far_b1af9();
    si = 0;
    di = arg_0 + 1;
    do {
        ax = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(arg_2, di));
        TBL_D5FF[si] = (char)ax;
        di = di + 1;
        si = si + 1;
    } while (si < 4);
    far_d777e();
    B_D5FD = (char)1;
    do {
        ax2 = B_D5FE;
    } while (ax2 == 0);
    ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)inp(208));
    while (B_D5FE != 0) {
        fn_ca39a();
        if (UNDEF != 0) {
            B_D5FD = (char)0;
        }
        t5 = far_b1d48(MK_FP(SEG_DATA, 0x67eb), B_D602, B_D601, B_D600);
    }
    far_d77b3();
    ((char)(UNDEF >> 8) << 8 | (unsigned char)inp(208));
    return ((long)UNDEF << 16 | (unsigned)far_b1aff());
}
void far fn_ca39a(void) { }
