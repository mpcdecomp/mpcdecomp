/* differs: 308 at +0, 671 bytes; 311 at +0, 671 bytes; 312 at +0, 671 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
long interrupt far isr_f8143(void)
{
    int ax;
    int ax2;
    int ax3;
    unsigned int ax4;
    unsigned int ax5;
    int ax6;
    char near *bx;
    unsigned int bx2;
    int bx3;
    int bx4;
    int cx;
    unsigned int cx2;
    int cx3;
    int cx4;
    int di;
    unsigned int di2;
    int ds;
    int ds2;
    int dx;
    int dx2;
    int dx3;
    int es;
    int es2;
    int es3;
    int p16;
    int p18;
    int si;
    int si2;
    long t1;
    int t2;
    int t3;

    _enable();
    bx = (char near *)dx;
    *(int far *)MK_FP(64, 0x6408) = 0;
    *(int far *)MK_FP(64, 0x640a) = es;
    *(int far *)MK_FP(64, 0x640e) = 0x6412;
    ax = 64;
    *(int far *)MK_FP(64, 0x6410) = ax;
    cx = 20;
    di = 0x6412;
    do {
        ax = ((char)(ax >> 8) << 8 | (unsigned char)*bx);
        if ((char)ax == 0) {
            break;
        }
        *(char far *)MK_FP(64, di) = (char)ax;
        bx = bx + 1;
        di = di + 1;
        cx = cx - 1;
    } while (cx != 0);
    *(char far *)MK_FP(64, di) = (char)0;
    ax2 = __insn("int 0x41", 2, bx, cx, *(int far *)MK_FP(64, 0x640e), si, di, SEG_DATA, 64);
    if ((char)(ax2 >> 8) != 0) {
        goto L1;
    }
    *(int far *)MK_FP(64, 0x640c) = ax2;
    if ((char)(__insn("int 0x41", 4, ax2, 28, 0x63ec, si, di, UNDEF, 64) >> 8) != 0) {
        goto L1;
    }
    if (UNDEF != 28) {
        goto L1;
    }
    if (*(int far *)MK_FP(64, 0x63ec) != 0x5a4d) {
        goto L1;
    }
    ax3 = *(int far *)MK_FP(64, 0x63f4) << 4;
    es2 = UNDEF;
    if ((char)(__insn("int 0x41", 4, *(int far *)MK_FP(64, 0x640c), ax3 - 28, (int)*(long far *)MK_FP(64, 0x6408), si, di, UNDEF, (int)(*(long far *)MK_FP(64, 0x6408) >> 16)) >> 8) != 0) {
        goto L1;
    }
    if (UNDEF != ax3 - 28) {
        goto L1;
    }
    ax4 = *(int far *)MK_FP(64, 0x63f0);
    if (*(int far *)MK_FP(64, 0x63ee) != 0) {
        ax4 = ax4 - 1;
    }
    t1 = (unsigned long)(unsigned int)ax4 * 0x200L;
    ax5 = (int)t1 + *(int far *)MK_FP(64, 0x63ee);
    bx2 = *(int far *)MK_FP(64, 0x63f4) << 4;
    si2 = (int)(((long)((int)(t1 >> 16) + (ax5 < (unsigned int)(int)t1)) << 16 | (unsigned)ax5) - (unsigned long)(unsigned int)bx2 >> 16);
    di2 = ax5 - bx2;
    bx3 = *(int far *)MK_FP(64, 0x640c);
    dx2 = (int)*(long far *)MK_FP(64, 0x6408);
    ds = (int)(*(long far *)MK_FP(64, 0x6408) >> 16);
    do {
        cx2 = 0x4000;
        if (si2 == 0 && di2 <= cx2) {
            cx2 = di2;
        }
        p18 = cx2;
        t2 = __insn("int 0x41", 4, bx3, cx2, dx2, si2, di2, es2, ds);
        bx3 = UNDEF;
        dx2 = UNDEF;
        es2 = UNDEF;
        if ((char)(t2 >> 8) != 0) {
            goto L2;
        }
        if (p18 != UNDEF) {
            goto L3;
        }
        ds = ds + 0x400;
        di2 = di2 - UNDEF;
        si2 = (int)(((long)si2 << 16 | (unsigned)di2) - (unsigned long)(unsigned int)UNDEF >> 16);
    } while ((si2 | di2) != 0);
    ds2 = 64;
    if ((char)(__insn("int 0x41", 3, *(int far *)MK_FP(ds2, 0x640c), UNDEF, dx2, si2, di2, es2, ds2) >> 8) != 0) {
        goto L1;
    }
    cx3 = *(int far *)MK_FP(ds2, 0x63f2);
    if (cx3 == 0) {
        goto L4;
    }
    t3 = __insn("int 0x41", 2, UNDEF, cx3, (int)*(long far *)MK_FP(ds2, 0x640e), si2, di2, UNDEF, (int)(*(long far *)MK_FP(ds2, 0x640e) >> 16));
    ds2 = ds2;
    if ((char)(t3 >> 8) != 0) {
        goto L1;
    }
    *(int far *)MK_FP(ds2, 0x640c) = t3;
    es3 = UNDEF;
    if ((char)(__insn("int 0x41", 4, *(int far *)MK_FP(ds2, 0x640c), *(int far *)MK_FP(ds2, 0x6404), 0x642b, si2, di2, UNDEF, ds2) >> 8) != 0) {
        goto L1;
    }
    cx4 = *(int far *)MK_FP(ds2, 0x63f2);
    for (;;) {
        p16 = cx4;
        if ((char)(__insn("int 0x41", 4, *(int far *)MK_FP(ds2, 0x640c), 4, 0x642b, si2, di2, es3, ds2) >> 8) != 0) {
            break;
        }
        bx4 = *(int far *)MK_FP(ds2, 0x642b);
        ax6 = *(int far *)MK_FP(ds2, 0x640a);
        dx3 = *(int far *)MK_FP(ds2, 0x642d) + ax6;
        es3 = dx3;
        *(int far *)MK_FP(es3, bx4) = *(int far *)MK_FP(es3, bx4) + ax6;
        cx4 = p16 - 1;
        if (cx4 != 0) {
            continue;
        }
        goto L5;
    }
    goto L1;
L3:
    goto L1;
L2:
    goto L1;
    goto L4;
L5:
    if ((char)(__insn("int 0x41", 3, *(int far *)MK_FP(ds2, 0x640c), cx4, dx3, si2, di2, es3, ds2) >> 8) == 0) {
L4:
        return 0L;
    }
L1:
    return 0L;
}
