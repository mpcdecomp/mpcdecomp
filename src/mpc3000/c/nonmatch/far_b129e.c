/* differs: 308 at +0, 132 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
extern char B_7B8D;
extern char B_D4B7;
extern char B_D5DD;
extern char B_D5DE;
extern int far far_b1aac(void);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern int far far_b1d48(void far *, int, int, int);
extern int far far_d4dcd(char, char, int);
extern long far far_ec03b(void far *);

long far far_b129e(void)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int t1;

    far_b1aac();
    ax2 = (int)far_ec03b(MK_FP(SEG_DATA, 0x12b4));
    if (B_D4B7 != 0) {
        t1 = far_b1d48(MK_FP(SEG_DATA, 0x12b9), B_D5DE, B_D5DD, B_7B8D);
        ax2 = far_b1ad0(1, 0);
    }
    ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)B_7B8D);
    far_d4dcd(B_D5DE, B_D5DD, ax3);
    return ((long)UNDEF << 16 | (unsigned)far_b1b05(MK_FP(SEG_DATA, -0x3128)));
}
