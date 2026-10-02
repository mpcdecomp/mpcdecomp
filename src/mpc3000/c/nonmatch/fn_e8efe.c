/* differs: 308 absent; 311 at +64, 4 bytes; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
extern int far far_b1aac(void);
extern int far far_b1ad0(int, int);
extern int far far_b1af9(void);
extern int far far_b1aff(void);
extern int far far_b1b05(void far *);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern long far far_cab34(int);
extern long far far_ebda4(int);

long far fn_e8efe(void)
{
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    long t1;
    long t2;
    long t3;

    t1 = far_cab34(0);
    far_b1af9();
    far_b1aac();
    t2 = far_b6cd3(MK_FP(SEG_DATA, 0x73e4));
    far_b1b05(MK_FP(SEG_DATA, 0x73ef));
    t3 = far_b90dd();
    far_b1ad0(7, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x7476));
    loc_2 = (int)far_ebda4(1);
    far_b1aff();
    return ((long)UNDEF << 16 | (unsigned)loc_2);
}
