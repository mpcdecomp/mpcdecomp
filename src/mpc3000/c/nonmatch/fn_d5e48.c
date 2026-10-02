/* differs: 308 at +0, 281 bytes; 311 at +0, 281 bytes; 312 at +0, 281 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
extern unsigned char B_A5BF;
extern unsigned char B_CEBF;
extern unsigned char B_D4BE;
extern unsigned char W_7384;
extern unsigned char W_D4B2;
extern unsigned char W_D627;
extern unsigned char W_D629;
extern void far far_cddaa(void);
extern int far far_fb14d(void);
extern int far far_fb18a(void);
extern void far far_fb57c(void);
extern long near fn_d5e9e(void);

long interrupt far fn_d5e48(void)
{
    int ax;
    int ax2;
    int bx;
    int cx;
    int di;
    int dx;
    int es;
    int si;
    long t1;
    int t2;
    int t3;
    long t4;
    int t5;
    long t6;

    t1 = far_fb14d();
    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D627) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D627) + 0x4e20;
    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D629) = (int)(*(long far *)MK_FP(-0x7ff0, (unsigned)&W_D627) + 0x4e20L >> 16);
    far_cddaa();
    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D4B2) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D4B2) + 1;
    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_7384) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_7384) - 1;
    far_fb57c();
    bx = UNDEF;
    cx = UNDEF;
    es = UNDEF;
    if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_CEBF) != 0) {
        *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D4BE) = (char)80;
    }
    dx = 232;
    ax = inpw(dx) & 0x1800;
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)(char)(ax >> 8));
    if ((char)(ax2 >> 8) != *(char far *)MK_FP(-0x7ff0, (unsigned)&B_A5BF)) {
        t4 = fn_d5e9e();
        bx = UNDEF;
        cx = UNDEF;
        es = UNDEF;
        ax2 = (int)t4;
        dx = (int)(t4 >> 16);
    }
    t5 = __insn("int 0x42", ax2, bx, cx, dx, si, di, es, -0x7ff0);
    _disable();
    outp(-0x3ff0, (char)96);
    t6 = far_fb18a();
    return 0L;
}
long near fn_d5e9e(void) { return 0; }
