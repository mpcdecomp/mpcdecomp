/* differs: 308 at +5, 510 bytes; 311 at +5, 510 bytes; 312 at +5, 510 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern long far far_cb6a2(void);
extern long far far_cb6bd(void);

int far far_cb566(int arg_0, int arg_2, long arg_4, int arg_6, long arg_8, int arg_10, int arg_12)
{
    int loc_2;
    long loc_4;
    int loc_6;
    int loc_8;
    int loc_a;
    int loc_c;
    char loc_e[2];
    unsigned int ax2;
    unsigned int ax3;
    unsigned int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    unsigned int ax9;
    int bx;
    int cx;
    int dx;
    unsigned int dx2;
    int dx3;
    unsigned int p34;
    int t1;
    long t2;
    char t3;
    long t4;

    if (arg_12 == 0) {
        loc_c = 79;
        loc_e[0] = (char)73;
    } else {
        loc_c = 111;
        loc_e[0] = (char)69;
    }
    ax2 = arg_2;
    dx = 0;
    cx = 4;
    do {
        ax2 = ax2 << 1;
        dx = dx << 1 | ax2 >> 15 & 1;
        cx = cx - 1;
    } while (cx != 0);
    ax3 = ax2 + arg_0;
    *(int *)((char *)&loc_4 + 0) = ax3;
    loc_2 = dx + (ax3 < ax2);
    do {
        t2 = far_cb6a2();
        t3 = inp(-0x3ff5);
        outpw(96, 0);
        ax4 = *(int *)((char *)&arg_4 + 0);
        dx2 = arg_6 & 0x1ff;
        ax5 = ax4 >> 4 | ax4 << 12;
        loc_a = ax5 & -0x1000;
        ax6 = ax5 & 0xfff;
        ax7 = (((char)(ax6 >> 8) | (char)((dx2 >> 4 | dx2 << 12) >> 8)) << 8 | (unsigned char)(char)ax6);
        loc_8 = ax7;
        loc_6 = (char)ax7;
        outpw(102, loc_6 | 0x100);
        outpw(100, loc_8);
        outpw(98, loc_a);
        outpw(96, 0x100);
        outpw(102, 15);
        outpw(100, -1);
        outpw(98, 0x1000);
        outpw(96, 2);
        outpw(102, 0x100);
        outp(-0x3fff, (char)3);
        outpw(-0x3ffc, *(int *)((char *)&loc_4 + 0));
        outp(-0x3ffa, (char)(*(char *)((char *)&loc_2 + 0) | 48));
        ax8 = 0;
        if (arg_10 == ax8) {
            ax8 = *(int *)((char *)&arg_8 + 0);
        }
        outpw(-0x3ffe, ax8 - 1);
        p34 = ax8 - 1;
        outp(-0x3ff6, loc_e[0]);
        t4 = far_cb6bd();
        outpw(104, loc_c);
        ax9 = p34 + 1;
        dx3 = ax9 < p34;
        *(int *)((char *)&arg_4 + 0) = *(int *)((char *)&arg_4 + 0) + ax9;
        arg_6 = (int)(arg_4 + ((long)dx3 << 16 | (unsigned)ax9) >> 16);
        *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + ax9;
        loc_2 = (int)(loc_4 + ((long)dx3 << 16 | (unsigned)ax9) >> 16);
        *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + ax9;
        loc_2 = (int)(loc_4 + ((long)dx3 << 16 | (unsigned)ax9) >> 16);
        *(int *)((char *)&arg_8 + 0) = *(int *)((char *)&arg_8 + 0) - ax9;
        arg_10 = (int)(arg_8 - ((long)dx3 << 16 | (unsigned)ax9) >> 16);
        do {
            ax9 = ((char)(ax9 >> 8) << 8 | (unsigned char)inp(-0x3ff5));
        } while (((char)ax9 & 8) == 0);
        if (arg_12 == 0) {
            bx = *(int *)((char *)&arg_4 + 0) << 12;
            do {
                outpw(96, 0);
                t1 = inpw(98);
            } while ((t1 & -0x1000) != bx);
        }
    } while ((*(int *)((char *)&arg_8 + 0) | arg_10) != 0);
    outpw(104, 128);
    return arg_12;
}
long far far_cb6a2(void) { return 0; }
long far far_cb6bd(void) { return 0; }
