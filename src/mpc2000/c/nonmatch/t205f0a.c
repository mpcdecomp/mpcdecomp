/* differs: 150 size 118, image 240; +1 image `enter 8, 0` CL `enter 0xc, 0`; 172 size 118, image 240; +1 image `enter 8, 0` CL `enter 0xc, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_PGM_TABLE {
    int f_0;
    int f_2;
};
extern unsigned char PGM_NAME[1];
extern struct g_PGM_TABLE PGM_TABLE;
extern unsigned char STR_NO_PROGRAM[1];
extern long __far __pascal cmd_dispatch_1E(int, int, long);
extern void __far __pascal cmd_ratio_setup(int, int, int);
extern void __far __pascal draw_unsigned_value(int, int, long, int);

void __far __pascal sequence_get_info(int arg_4, int arg_2, int arg_0)
{
    char loc_6[4];
    int loc_2;
    int ax;
    int bx;
    int cx;
    int es;
    int si;
    int t1;
    int t2;
    long t3;

    bx = arg_4 << 2;
    si = *(int *)((char *)&PGM_TABLE + 0 + bx);
    *(int *)((char *)&loc_6 + 0) = *(int *)((char *)&PGM_TABLE + 2 + bx);
    ax = arg_4;
    draw_unsigned_value(arg_2, arg_0, (long)(int)(ax + 1), 2);
    cmd_ratio_setup(arg_2 + 12, arg_0, 45);
    es = *(int *)((char *)&loc_6 + 0);
    if (*(int far *)MK_FP(es, si) == 2) {
        goto L1;
    }
    cx = (int)(unsigned)(PGM_NAME + si);
    loc_2 = es;
    goto L2;
L1:
    cx = (int)(unsigned)STR_NO_PROGRAM;
    loc_2 = SEG_DATA;
L2:
    t3 = cmd_dispatch_1E(arg_2 + 18, arg_0, ((long)loc_2 << 16 | (unsigned)cx));
    return;
}
