/* differs: 308 absent; 311 at +5, 170 bytes; 312 at +5, 170 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_D5DD;
extern unsigned char TBL_b70d1[];
extern int far far_b1b05(void far *);
extern long far far_b90dd(void);
extern long far far_c822d(void);
extern long far far_e7069(void);
extern long far far_ebcce(char far *, int, int);
extern long far far_ec03b(void far *);
extern void far fn_b70e3(void);
extern long far fn_b72de(void);
extern long far fn_b7558(void);
extern long far fn_b7743(void);
extern long far fn_b79e8(void);
extern long far fn_b7eff(void);
extern long far fn_b8007(void);
extern long far fn_b8300(void);

long far far_b7024(void)
{
    char loc_1;
    int ax;
    int ax2;
    unsigned int ax3;
    int dx;
    long t1;
    long t2;
    long t3;
    long t4;
    int t5;

    B_D5DD = (char)0;
    t1 = far_ec03b(MK_FP(SEG_DATA, 0x2e42));
    far_b1b05(MK_FP(SEG_DATA, 0x2e50));
    t2 = far_b90dd();
    t3 = far_e7069();
    t4 = far_ebcce((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1), 10, 0);
    dx = (int)t4;
    if (dx == 0) {
        ax2 = ((char)((int)t4 >> 8) << 8 | (unsigned char)loc_1);
        B_D5DD = (char)ax2;
        ax3 = (char)ax2 - 1;
        if (ax3 <= 8) {
            switch ((unsigned int)(unsigned)(TBL_b70d1 + (ax3 << 1))) {
            case 0:
                fn_b70e3();
                dx = UNDEF;
                break;
            case 1:
                dx = (int)far_c822d();
                break;
            case 2:
                dx = (int)fn_b72de();
                break;
            case 3:
                dx = (int)fn_b7558();
                break;
            case 4:
                dx = (int)fn_b7743();
                break;
            case 5:
                dx = (int)fn_b79e8();
                break;
            case 6:
                dx = (int)fn_b7eff();
                break;
            case 7:
                dx = (int)fn_b8007();
                break;
            case 8:
                dx = (int)fn_b8300();
                break;
            }
        }
    }
    return ((long)dx << 16 | (unsigned)dx);
}
long far far_b90dd(void) { return 0; }
void far fn_b70e3(void) { }
long far fn_b72de(void) { return 0; }
long far fn_b7558(void) { return 0; }
long far fn_b7743(void) { return 0; }
long far fn_b79e8(void) { return 0; }
long far fn_b7eff(void) { return 0; }
long far fn_b8007(void) { return 0; }
long far fn_b8300(void) { return 0; }
