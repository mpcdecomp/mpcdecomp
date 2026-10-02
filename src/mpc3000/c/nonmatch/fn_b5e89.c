/* differs: 308 at +6, 160 bytes; 311 at +6, 160 bytes; 312 at +6, 160 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_D5DD;
extern int far far_b08f7();
extern int far far_b1ad0();
extern int far far_b1b05();
extern long far far_b3b9f();
extern long far far_b6beb();
extern long far far_b6cd3();
extern long far far_b90dd();
extern long far far_cab5c();
extern long far far_cad00();

long far fn_b5e89(int arg_0, int arg_2)
{
    char loc_16[22];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int dx;
    int p26;
    long t1;
    long t2;
    long t3;
    int t4;
    int t5;
    int t6;
    long t7;
    long t8;

    t1 = far_b6cd3(0x2773);
    B_D5DD = (char)71;
    far_b1ad0(2);
    far_b1b05(0x2780);
    t2 = far_b6beb(*(long *)((char *)&arg_0 + 0), loc_16);
    far_b1b05(loc_16);
    far_b1b05(0x2791);
    t3 = far_b90dd();
    ax5 = far_b1b05(0x2794);
    do {
        t4 = far_b08f7();
        dx = t4;
    } while (t4 == 0);
    if (dx == 120) {
        t5 = far_b1ad0(7);
        t6 = far_b1b05(0x279f);
        t7 = far_cad00();
        p26 = (int)far_cab5c(arg_0);
        t8 = far_b3b9f();
        dx = 0;
    }
    return ((long)dx << 16 | (unsigned)dx);
}
long far far_b6beb(long p0, char near *p1) { return 0; }
long far far_b6cd3(int p0) { return 0; }
