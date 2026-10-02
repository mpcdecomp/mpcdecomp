/* differs: 308 at +0, 344 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
#define UNDEF 0
extern char B_943C;
extern char B_943D;
extern char B_943E;
extern char B_9457;
extern char B_9782;
extern char TBL_943B;
extern long far far_cb772(void far *);
extern long far far_d97ca(int, void far *, int);

long far far_de41c(void)
{
    int ax;
    int dx;
    int es;
    int p4;
    long t1;
    long t2;

    if (B_9457 == 0) {
        for (;;) {
            t1 = far_d97ca(8, MK_FP(SEG_STACK, UNDEF), 10);
            dx = (int)(t1 >> 16);
            if ((int)t1 == 0) {
                break;
            }
            t2 = far_cb772(MK_FP(SEG_STACK, UNDEF));
        }
        ax = 0x96e6 /* SEG_A8EC */;
        es = ax;
        p4 = __flags((int)t1);
        _disable();
        if (*(int far *)MK_FP(es, 0x1330) != 0) {
            B_9782 = (char)(B_9782 | 1);
            TBL_943B = (char)(TBL_943B | 2);
            ax = ((char)(ax >> 8) << 8 | (unsigned char)TBL_943B);
            dx = 198;
            outp(dx, (char)ax);
        }
        if (*(int far *)MK_FP(es, 0x1932) != 0) {
            B_9782 = (char)(B_9782 | 2);
            B_943C = (char)(B_943C | 2);
            ax = ((char)(ax >> 8) << 8 | (unsigned char)B_943C);
            dx = 206;
            outp(dx, (char)ax);
        }
        if (*(int far *)MK_FP(es, 0x1f34) != 0) {
            B_9782 = (char)(B_9782 | 4);
            B_943D = (char)(B_943D | 2);
            ax = ((char)(ax >> 8) << 8 | (unsigned char)B_943D);
            dx = 214;
            outp(dx, (char)ax);
        }
        if (*(int far *)MK_FP(es, 0x2536) != 0) {
            B_9782 = (char)(B_9782 | 8);
            B_943E = (char)(B_943E | 2);
            ax = ((char)(ax >> 8) << 8 | (unsigned char)B_943E);
            dx = 222;
            outp(dx, (char)ax);
        }
        __insn("popf", p4);
    }
    return ((long)dx << 16 | (unsigned)ax);
}
