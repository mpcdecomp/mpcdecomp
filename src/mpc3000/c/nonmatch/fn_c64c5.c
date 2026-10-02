/* differs: 308 at +61, 39 bytes; 311 at +C, 45 bytes; 312 at +C, 45 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_D5DD;
extern int far far_b08f7(int);
extern int far far_b1aac(void);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern int far far_c6547(int);
extern void far far_cb2af(void);

long far fn_c64c5(void)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int dx;
    long t1;
    long t2;
    int t3;
    int t4;

    B_D5DD = (char)44;
    far_b1aac();
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x5755));
    far_b1ad0(1, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x576d));
    far_b1ad0(6, 0);
    t2 = far_b90dd();
    far_b1ad0(7, 0);
    ax6 = far_b1b05(MK_FP(SEG_DATA, 0x56f9));
    do {
        t3 = far_b08f7(1);
        dx = ((char)(UNDEF >> 8) << 8 | (unsigned char)(char)t3);
    } while ((char)t3 == 0);
    if ((char)t3 == 120) {
        far_cb2af();
        ax7 = far_c6547(0);
        dx = ((char)(UNDEF >> 8) << 8 | (unsigned char)76);
    }
    return ((long)dx << 16 | (unsigned)(char)dx);
}
int far far_c6547(int p0) { return 0; }
