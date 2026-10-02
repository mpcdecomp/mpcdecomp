/* differs: 308 at +3, 63 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern unsigned char W_eb138[];
extern unsigned char W_eb13a[];

long far far_eb13c(int arg_0)
{
    int ax;
    unsigned int cx;
    int dx;

    ax = *(int far *)MK_FP(0xf275, (unsigned int)(unsigned)(W_eb138 + -0x130));
    dx = *(int far *)MK_FP(0xf275, (unsigned int)(unsigned)(W_eb13a + -0x130));
    cx = arg_0;
    return ((long)(unsigned)((unsigned long)((long)dx << 16 | (unsigned)ax) / (unsigned long)(unsigned int)cx) << 16 | (unsigned)(unsigned)((unsigned long)((long)(unsigned)((unsigned long)((long)dx << 16 | (unsigned)ax) % (unsigned long)(unsigned int)cx) << 16 | (unsigned)0) / (unsigned long)(unsigned int)cx));
}
