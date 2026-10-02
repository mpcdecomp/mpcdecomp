/* differs: 308 absent; 311 at +5, 159 bytes; 312 at +5, 159 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
extern unsigned char B_D4B7[];
extern char B_D5DD;
extern char B_D5DE;
extern int far far_b08f7(void);
extern int far far_b1ad0(int);
extern int far far_b1b05(int);
extern long far far_b362e(void far *, unsigned char far *, void far *);
extern long far far_b6cd3(int);
extern long far fn_b50ea(void);

long far far_b4fc0(void)
{
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int dx;
    long t1;
    long t2;
    int t3;
    long t4;

    t1 = far_b6cd3(0x2190);
    B_D5DD = (char)4;
    far_b1ad0(2);
    far_b1b05(0x21a0);
    far_b1b05(0x67c);
    far_b1ad0(4);
    t2 = far_b362e(MK_FP(SEG_DATA, 0x21b7), (unsigned char far *)B_D4B7, MK_FP(SEG_DATA, 48));
    loc_2 = 0;
    do {
        t3 = far_b08f7();
        dx = ((char)(UNDEF >> 8) << 8 | (unsigned char)(char)t3);
    } while ((char)t3 == 0);
    ax5 = (char)t3;
    if (ax5 == 120) {
        t4 = fn_b50ea();
        ax5 = (int)t4;
        dx = ((char)((int)(t4 >> 16) >> 8) << 8 | (unsigned char)B_D5DE);
    }
    return ((long)dx << 16 | (unsigned)((char)(ax5 >> 8) << 8 | (unsigned char)(char)dx));
}
long far fn_b50ea(void) { return 0; }
