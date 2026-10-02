/* differs: 308 at +0, 112 bytes; 311 at +0, 112 bytes; 312 at +0, 112 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_D604;
extern char B_D605;
extern char B_D606;
extern char B_D607;

void near fn_d6d3b(void)
{
    int ax;
    char t1;
    int t2;
    char t3;
    int t4;
    char t5;
    int t6;
    char t7;
    int t8;

    t1 = inp(80);
    __insn("aad 0xa");
    B_D604 = (char)(t1 & 15);
    t3 = inp(82);
    __insn("aad 0xa");
    B_D605 = (char)(t3 & 15);
    t5 = inp(84);
    __insn("aad 0xa");
    B_D606 = (char)(t5 & 15);
    t7 = inp(86);
    ax = (t7 << 8 | (unsigned char)t7) & 0x700f;
    __insn("aad 0xa");
    B_D607 = (char)ax;
    return;
}
