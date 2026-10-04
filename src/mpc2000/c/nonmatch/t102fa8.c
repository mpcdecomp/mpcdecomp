/* differs: 150 size 470, image 394; +1 image `enter 0xa, 0` CL `enter 0x14, 0`; 172 size 470, image 394; +1 image `enter 0xa, 0` CL `enter 0x14, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    char pad_0[18];
    char f_12;
    char f_13;
    char pad_14[2];
    char f_16;
    char pad_17[3];
    char f_1a;
};
struct g_TBL_0B6E {
    int f_0;
};
extern int TBL_09DA[1];
extern struct g_TBL_0B6E TBL_0B6E;

void __near __pascal audio_mixing_handler(int arg_6, int arg_4, int arg_2, struct s1 far *arg_0)
{
    int loc_a;
    char loc_8[4];
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int es;
    int si;
    int si2;
    int si3;
    long t1;
    long t2;
    long t3;
    long t4;

    si = arg_0->f_1a * *(char far *)MK_FP(arg_6, arg_4 + 1) / 127 + arg_0->f_12;
    if (*(char far *)MK_FP(arg_6, arg_4 + 3) != 3) {
        goto L1;
    }
    si = si + (*(char far *)MK_FP(arg_6, arg_4 + 2) - 50);
L1:
    if (si >= 0) {
        goto L2;
    }
    si = 0;
L2:
    if (si <= 100) {
        goto L3;
    }
    si = 100;
L3:
    ax = arg_0->f_16 + si;
    loc_2 = ax;
    if (ax <= 100) {
        goto L4;
    }
    loc_2 = 100;
L4:
    ax2 = *(int *)((char *)&TBL_0B6E + 0 + si + si);
    *(int far *)MK_FP(arg_6, arg_4 + 38) = 0;
    *(int far *)MK_FP(arg_6, arg_4 + 40) = ax2;
    *(int far *)MK_FP(arg_6, arg_4 + 42) = (*(int *)((char *)&TBL_0B6E + 0 + loc_2 * 2) & 0x3ff8) * 2 + arg_0->f_13;
    *(int far *)MK_FP(arg_6, arg_4 + 46) = (*(int *)((char *)&TBL_0B6E + 0 + si + si) & 0x3ff8) * 2 + arg_0->f_13;
    ax3 = loc_2 - si;
    loc_4 = ax3;
    if (ax3 != 0) {
        goto L5;
    }
    es = arg_6;
    *(int far *)MK_FP(es, arg_4 + 58) = ax3;
    *(int far *)MK_FP(es, arg_4 + 44) = ax3;
    goto L6;
L5:
    t1 = (long)(int)loc_4 * 0x447L;
    t2 = t1 / 2L;
    loc_a = (int)t2;
    *(int *)((char *)&loc_8 + 0) = (int)(t2 >> 16);
    si2 = *(int *)((char *)&arg_0 + 0);
    ax4 = TBL_09DA[*(char far *)MK_FP(arg_2, si2 + 20)];
    *(int far *)MK_FP(arg_6, arg_4 + 58) = ax4;
    if (ax4 != 0) {
        goto L7;
    }
    *(int far *)MK_FP(arg_6, arg_4 + 58) = 1;
L7:
    t3 = *(long *)((char *)&loc_a + 0) / (unsigned long)(unsigned int)*(int far *)MK_FP(arg_6, arg_4 + 58);
    loc_4 = (int)t3;
    if ((int)(t3 >> 16) < 0) {
        goto L8;
    }
    if ((int)(t3 >> 16) > 0) {
        goto L9;
    }
    if ((unsigned int)(int)t3 <= 0x7fff) {
        goto L8;
    }
L9:
    loc_4 = 0x7fff;
L8:
    *(int far *)MK_FP(arg_6, arg_4 + 44) = loc_4;
    ax5 = TBL_09DA[*(char far *)MK_FP(arg_2, si2 + 21)];
    if (ax5 == 0) {
        goto L10;
    }
    si3 = ax5;
    goto L11;
L10:
    si3 = 1;
L11:
    t4 = *(long *)((char *)&loc_a + 0) / (unsigned long)(unsigned int)si3;
    loc_4 = (int)t4;
    if ((int)(t4 >> 16) < 0) {
        goto L12;
    }
    if ((int)(t4 >> 16) > 0) {
        goto L13;
    }
    if ((unsigned int)(int)t4 <= 0x7fff) {
        goto L12;
    }
L13:
    loc_4 = 0x7fff;
L12:
    ax3 = -loc_4;
    es = arg_6;
L6:
    *(int far *)MK_FP(es, arg_4 + 48) = ax3;
    return;
}
