/* differs: 308 at +5, 194 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
extern void far far_cb363(char far *);
extern void far far_cb3de(char far *);
extern long far fn_cbc38(int, char far *, char far *, char far *, char far *, int);
long far fn_cbc38(int p0, char far *p1, char far *p2, char far *p3, char far *p4, int p5) { return 0; }

long far far_cc583(int arg_0)
{
    char loc_24[24];
    int loc_c;
    char loc_a;
    char loc_9;
    char loc_8;
    char loc_7;
    char loc_6[2];
    char loc_4[4];
    int ax;
    int bx;
    unsigned int dx;
    int flags;
    long t1;
    int t2;
    int t3;
    long t4;

    t1 = (long)(int)arg_0 * 36L;
    loc_c = (int)t1;
    ax = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t1 + 0x4816);
    dx = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t1 + 0x4814);
    bx = loc_c;
    flags = ax - *(int far *)MK_FP(0xa853 /* SEG_A28F */, bx + 0x481a);
    if (CC("<", flags) || !CC("!=", flags) && dx < (unsigned int)*(int far *)MK_FP(0xa853 /* SEG_A28F */, bx + 0x4818)) {
        loc_a = (char)-112;
        loc_9 = (char)0;
        loc_8 = (char)0;
        loc_7 = (char)127;
        loc_6[0] = (char)64;
        far_cb363((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_24));
        loc_24[0] = *(char *)((char *)&arg_0 + 0);
        far_cb3de((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4));
        t4 = fn_cbc38(98, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_a), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_24), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4), 0);
        ax = (int)t4;
        dx = (int)(t4 >> 16);
    }
    return ((long)dx << 16 | (unsigned)ax);
}
