/* differs: 150 size 344, image 214; +1 image `enter 4, 0` CL `enter 0x22, 0`; 172 size 344, image 214; +1 image `enter 4, 0` CL `enter 0x22, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_SMEM_POOL_LEN_HI {
    int f_0;
};
struct g_SMEM_POOL_LEN {
    int f_0;
};
extern unsigned char P_3122[1];
extern struct g_SMEM_POOL_LEN SMEM_POOL_LEN;
extern struct g_SMEM_POOL_LEN_HI SMEM_POOL_LEN_HI;
extern unsigned char STR_KBYTES[1];
extern unsigned char STR_MBYTES[1];
extern long __far __pascal cmd_dispatch_1E();
extern void __far __pascal draw_unsigned_value();

void __far __pascal sample_calc_length(int arg_6, int arg_4, int arg_2, int arg_0)
{
    int loc_4;
    int loc_2;
    unsigned int ax;
    unsigned int ax2;
    unsigned int ax3;
    unsigned int ax4;
    int bx;
    int bx2;
    int p12;
    int p14;
    int p16;
    int p18;
    long t1;
    int t2;
    long t3;
    int t4;
    long t5;
    long t6;
    long t7;
    int t8;
    long t9;

    bx = *(int far *)MK_FP(arg_2, arg_0 + 48);
    bx2 = ((bx << 2) + bx) * 2;
    t1 = ((long)*(int *)((char *)&SMEM_POOL_LEN_HI + 0 + bx2) << 16 | (unsigned)*(int *)((char *)&SMEM_POOL_LEN + 0 + bx2)) / 0x200L;
    loc_4 = (int)t1;
    loc_2 = (int)(t1 >> 16);
    if ((int)(t1 >> 16) > 0) {
        goto L1;
    }
    if ((int)(t1 >> 16) < 0) {
        goto L2;
    }
    if ((unsigned int)(int)t1 >= 0x2710) {
        goto L1;
    }
L2:
    draw_unsigned_value(arg_6, arg_4, t1, 4);
    p12 = arg_6 + 24;
    p14 = arg_4;
    p16 = SEG_DATA;
    p18 = (int)(unsigned)STR_KBYTES;
    goto L3;
L1:
    t3 = t1 / 0x400L;
    draw_unsigned_value(arg_6, arg_4, t3, 2);
    t5 = cmd_dispatch_1E(arg_6 + 12, arg_4, (unsigned char far *)P_3122);
    t6 = *(long *)((char *)&loc_4 + 0) % 0x400L;
    ax = (int)t6 * 2;
    ax2 = ax * 2;
    ax3 = ax2 + (int)t6;
    ax4 = ax3 * 2;
    t7 = ((long)((((int)(t6 >> 16) * 2 + (ax < (unsigned int)(int)t6)) * 2 + (ax2 < ax) + (int)(t6 >> 16) + (ax3 < ax2)) * 2 + (ax4 < ax3)) << 16 | (unsigned)ax4) / 0x400L;
    draw_unsigned_value(arg_6 + 18, arg_4, t7, 1);
    p12 = arg_6 + 24;
    p14 = arg_4;
    p16 = SEG_DATA;
    p18 = (int)(unsigned)STR_MBYTES;
L3:
    t9 = cmd_dispatch_1E(p12, p14, ((long)p16 << 16 | (unsigned)p18));
    return;
}
