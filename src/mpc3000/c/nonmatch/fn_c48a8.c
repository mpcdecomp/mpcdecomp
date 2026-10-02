/* differs: 308 at +41, 150 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8A9F;
extern unsigned char B_901B[];
extern char B_D4C2;
extern char B_D5DD;
extern unsigned char TBL_c4954[];
extern int far far_b08f7(int);
extern void far far_b20fd(void);
extern int far far_b2121(void);
extern int far far_b2134(void);
extern int far far_b2190(void);
extern long far far_b21f5(void);
extern long far far_b362e(void far *, char far *, void far *, int);
extern long far far_b6cd3(void far *);
extern long far far_b9102(void);
extern void far far_ba2a4(void);
extern int far far_e0031(unsigned char far *);
extern long far far_e51be(unsigned char far *, int, int);

long far fn_c48a8(void)
{
    char loc_1;
    int ax;
    unsigned int ax2;
    int dx;
    long t1;
    int t10;
    long t2;
    long t3;
    int t4;
    long t5;
    int t6;
    int t7;
    int t8;
    int t9;

    loc_1 = (char)0;
    B_D5DD = (char)1;
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x5344));
    t2 = far_b362e(MK_FP(SEG_DATA, 0x5363), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1), MK_FP(SEG_DATA, 0x50e8), 28);
    t3 = far_b9102();
    do {
        ax = far_b08f7(1);
        dx = ((char)(UNDEF >> 8) << 8 | (unsigned char)(char)ax);
    } while ((char)ax == 0);
    if ((char)dx == 120) {
        t4 = far_e0031((unsigned char far *)B_901B);
        ax2 = loc_1;
        if (ax2 <= 4) {
            switch ((unsigned int)(unsigned)(TBL_c4954 + (ax2 << 1))) {
            case 0:
                far_b20fd();
                break;
            case 1:
                t8 = far_b2121();
                break;
            case 2:
                t7 = far_b2134();
                break;
            case 3:
                t6 = far_b2190();
                break;
            case 4:
                t5 = far_b21f5();
                break;
            }
        }
        far_ba2a4();
        dx = ((char)((int)(far_e51be((unsigned char far *)B_901B, B_8A9F, 1) >> 16) >> 8) << 8 | (unsigned char)B_D4C2);
    }
    return ((long)dx << 16 | (unsigned)(char)dx);
}
