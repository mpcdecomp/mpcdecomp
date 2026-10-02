/* differs: 308 absent; 311 at +3A, 42 bytes; 312 at +3A, 42 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
extern char B_D5DD;
extern int far far_b1b05(void far *);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern long far far_ebcce(char far *, int, int);
extern long far fn_b85a6(void);
extern long far fn_b88e1(void);
extern long far fn_b8bed(void);

long far fn_b8300(void)
{
    char loc_1;
    int ax;
    int ax2;
    int dx;
    long t1;
    long t2;

    B_D5DD = (char)9;
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x313c));
    far_b1b05(MK_FP(SEG_DATA, 0x314b));
    t2 = far_b90dd();
    dx = (int)far_ebcce((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1), 3, 0);
    if (dx == 0) {
        B_D5DD = (char)(loc_1 + 90);
        ax2 = loc_1;
        if (ax2 == 1) {
            dx = (int)fn_b85a6();
        } else if (ax2 == 2) {
            dx = (int)fn_b88e1();
        } else if (ax2 == 3) {
            dx = (int)fn_b8bed();
        }
    }
    return ((long)dx << 16 | (unsigned)dx);
}
long far far_b90dd(void) { return 0; }
long far fn_b85a6(void) { return 0; }
long far fn_b88e1(void) { return 0; }
long far fn_b8bed(void) { return 0; }
