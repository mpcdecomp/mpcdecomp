/* differs: 308 at +3, 88 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
extern int far far_b1aac(void);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern int far far_d4dcd(char, char, int);
extern long far far_ec03b(void far *);

long far far_b3cdb(int arg_0, int arg_2, char arg_4)
{
    int ax;
    int ax2;
    int ax3;
    long t1;

    far_b1aac();
    t1 = far_ec03b(MK_FP(SEG_DATA, 0x1d6e));
    ax2 = ((char)(far_b1ad0(1, 0) >> 8) << 8 | (unsigned char)arg_4);
    far_d4dcd(*(char *)((char *)&arg_0 + 0), *(char *)((char *)&arg_2 + 0), ax2);
    return ((long)UNDEF << 16 | (unsigned)far_b1b05(MK_FP(SEG_DATA, -0x3128)));
}
