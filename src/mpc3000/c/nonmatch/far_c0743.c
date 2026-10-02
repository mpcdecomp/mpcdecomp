/* differs: 308 at +5, 304 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
extern char B_955C;
extern char B_D4C2;
extern char B_D5DD;
extern unsigned char TBL_c07f6[];
extern long far L_c9dad(void);
extern long far L_c9f26(void);
extern long far L_ca0ec(void);
extern long far far_b059a(void);
extern int far far_b1ad0(int);
extern int far far_b1b05(int);
extern int far far_b1f96(void);
extern long far far_b6cd3(int);
extern long far far_b90dd(void);
extern long far far_e6fef(void);
extern long far far_ebcce(char far *, int);

long far far_c0743(void)
{
    char loc_1;
    int ax;
    int ax2;
    unsigned int ax3;
    int dx;
    long t1;
    long t10;
    long t2;
    long t3;
    int t4;
    int t5;
    int t6;
    long t7;
    long t8;
    long t9;

    t1 = far_b6cd3(0x4732);
    far_b1b05(0x4737);
    t2 = far_b90dd();
    t3 = far_ebcce((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1), 4);
    dx = ((char)((int)(t3 >> 16) >> 8) << 8 | (unsigned char)(char)(int)t3);
    if ((char)dx == 0) {
        ax2 = ((char)((int)t3 >> 8) << 8 | (unsigned char)loc_1);
        B_D5DD = (char)ax2;
        ax3 = (char)ax2 - 1;
        if (ax3 <= 3) {
            switch ((unsigned int)(unsigned)(TBL_c07f6 + (ax3 << 1))) {
            case 0:
                t10 = L_c9dad();
                dx = ((char)((int)(t10 >> 16) >> 8) << 8 | (unsigned char)(char)(int)t10);
                break;
            case 1:
                t9 = L_c9f26();
                dx = ((char)((int)(t9 >> 16) >> 8) << 8 | (unsigned char)(char)(int)t9);
                break;
            case 2:
                t8 = L_ca0ec();
                dx = ((char)((int)(t8 >> 16) >> 8) << 8 | (unsigned char)(char)(int)t8);
                break;
            case 3:
                t4 = far_b1ad0(7);
                t5 = far_b1b05(0x47a6);
                t6 = far_b1f96();
                t7 = far_e6fef();
                B_955C = (char)(B_955C | 16);
                dx = ((char)((int)(far_b059a() >> 16) >> 8) << 8 | (unsigned char)B_D4C2);
                break;
            }
        }
    }
    return ((long)dx << 16 | (unsigned)(char)dx);
}
long far L_c9dad(void) { return 0; }
long far L_c9f26(void) { return 0; }
long far L_ca0ec(void) { return 0; }
