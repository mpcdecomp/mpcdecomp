/* differs: 308 at +3, 196 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
extern unsigned char B_7FCB;
extern unsigned char TBL_eb156[];
extern unsigned char TBL_eb15e[];
extern long far far_d975a(void);

void far far_eb17e(long arg_0, long arg_4)
{
    unsigned int ax;
    unsigned int ax2;
    unsigned int ax3;
    int ax4;
    int bx;
    int bx2;
    unsigned int cx;
    unsigned int cx2;
    int ds;
    unsigned int dx;
    int dx2;
    int si;

    bx = B_7FCB << 1;
    si = (int)arg_4;
    bx2 = (int)arg_0;
    ds = (int)(arg_0 >> 16);
    *(char far *)MK_FP(UNDEF, si + 4) = (char)(int)far_d975a();
    cx = *(int far *)MK_FP(0xf277, (unsigned int)(unsigned)(TBL_eb15e + -32 + bx));
    dx = (unsigned)((unsigned long)((long)UNDEF << 16 | (unsigned)UNDEF) % (unsigned long)(unsigned int)cx);
    *(char far *)MK_FP(UNDEF, si + 3) = (char)(unsigned)((unsigned long)((long)UNDEF << 16 | (unsigned)UNDEF) / (unsigned long)(unsigned int)cx);
    ax = dx << 1;
    ax2 = ax << 1;
    ax3 = ax2 + dx;
    ax4 = ax3 << 1;
    dx2 = ((dx >> 15 & 1) << 1 | ax >> 15 & 1) + (ax3 < ax2) << 1 | ax3 >> 15 & 1;
    cx2 = *(int far *)MK_FP(0xf277, (unsigned int)(unsigned)(TBL_eb156 + -32 + bx));
    *(char far *)MK_FP(UNDEF, si + 2) = (char)(unsigned)((unsigned long)((long)dx2 << 16 | (unsigned)ax4) / (unsigned long)(unsigned int)cx2);
    *(char far *)MK_FP(UNDEF, si + 1) = (char)((unsigned)((unsigned long)((long)dx2 << 16 | (unsigned)ax4) % (unsigned long)(unsigned int)cx2) / 100);
    *(char far *)MK_FP(UNDEF, si) = (char)0;
    return;
}
