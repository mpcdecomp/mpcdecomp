/* differs: 308 at +0, 131 bytes; 311 at +0, 131 bytes; 312 at +0, 131 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8802;
extern char B_8803;
extern char B_8804;
extern char B_D5DE;
extern unsigned char TBL_A5CF[];
extern unsigned char TBL_A787[];
extern unsigned char TBL_A79B[];
extern unsigned char TBL_A7AF[];
extern int far far_b08f7(void);
extern int far far_b1ad0(int);
extern int far far_b1b05(int);
extern long far far_b6cd3(int);
extern long far far_b9102(void);
extern int far far_e66a4(void);

long far fn_b4de1(void)
{
    int ax;
    int ax2;
    int dx;
    long t1;
    long t2;
    int t3;
    int t4;

    t1 = far_b6cd3(0x20ba);
    far_b1ad0(1);
    far_b1b05(0x20cb);
    t2 = far_b9102();
    do {
        t3 = far_b08f7();
        dx = t3;
    } while (t3 == 0);
    if (t3 == 120) {
        __stos2((unsigned char far *)TBL_A7AF, 0, 0x2710);
        __stos2((unsigned char far *)TBL_A79B, 0, 20);
        __stos2((unsigned char far *)TBL_A787, 0x101, 20);
        t4 = far_e66a4();
        __stos2((unsigned char far *)TBL_A5CF, 0, 100);
        B_8803 = (char)0;
        B_8802 = (char)0;
        B_8804 = (char)1;
        dx = B_D5DE;
    }
    return ((long)dx << 16 | (unsigned)dx);
}
