/* differs: 308 at +C, 57 bytes; 311 at +1B, 49 bytes; 312 at +1B, 49 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_b1aac(void);
extern int far far_b1af9(void);
extern int far far_b1aff(void);
extern int far far_b1d48();
extern int far far_d79ee(void);
extern void far far_eacb4(void);
extern void far far_eacbe(void);
extern void far far_eacc8(void);
extern void far far_eacd2(void);
extern void far far_eacdc(void);
extern void far far_eace6(void);
extern void far far_eacf0(void);
extern void far far_eacfa(void);
extern void far far_ead04(void);
extern void far far_ead0e(void);

long far fn_b50ea(void)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    int t1;
    int t10;
    int t2;
    int t3;
    int t4;
    int t5;
    int t6;
    int t7;
    int t8;
    int t9;

    far_b1af9();
    far_b1aac();
    far_b1d48(MK_FP(SEG_DATA, 0x21c3));
    far_eace6();
    far_eacb4();
    far_b1d48(MK_FP(SEG_DATA, 0x21d5), UNDEF);
    far_eacf0();
    far_eacbe();
    far_b1d48(MK_FP(SEG_DATA, 0x21f6), UNDEF);
    far_eacfa();
    far_eacc8();
    far_b1d48(MK_FP(SEG_DATA, 0x2217), UNDEF);
    far_ead04();
    far_eacd2();
    far_b1d48(MK_FP(SEG_DATA, 0x2238), UNDEF);
    far_ead0e();
    far_eacdc();
    far_b1d48(MK_FP(SEG_DATA, 0x2259), UNDEF);
    far_d79ee();
    return ((long)UNDEF << 16 | (unsigned)far_b1aff());
}
