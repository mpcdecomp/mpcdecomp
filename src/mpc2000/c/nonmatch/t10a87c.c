/* differs: 150 size 54, image 284; +1 image `enter 0x1e, 0` CL `enter 6, 0`; 172 size 54, image 284; +1 image `enter 0x1e, 0` CL `enter 6, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_SDS_SAMPLE_NUM {
    int f_0;
};
extern char SDS_EXCL_CH;
extern struct g_SDS_SAMPLE_NUM SDS_SAMPLE_NUM;
extern long __near __pascal int4A_sysex_wrapper(char far *, int);
extern long __far __pascal x_aFldiv(int, int, int, int);

void __near __pascal seq_io_control(int arg_2, int arg_0)
{
    char loc_1e;
    char loc_1d;
    char loc_1c;
    char loc_1b;
    char loc_1a;
    char loc_19;
    char loc_18;
    char loc_17;
    char loc_16;
    char loc_15;
    char loc_14;
    char loc_13;
    char loc_12;
    char loc_11;
    char loc_10;
    char loc_f;
    char loc_e;
    char loc_d;
    char loc_c;
    char loc_b;
    char loc_a[2];
    int loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    unsigned int ax;
    unsigned int ax10;
    unsigned int ax2;
    unsigned int ax3;
    unsigned int ax4;
    int ax5;
    int ax6;
    unsigned int ax7;
    unsigned int ax8;
    unsigned int ax9;
    int dx;
    int es;
    long t1;
    long t2;

    loc_1e = (char)-16;
    loc_1d = (char)126;
    loc_1b = (char)1;
    loc_1c = SDS_EXCL_CH;
    loc_1a = (char)(*(char *)((char *)&SDS_SAMPLE_NUM + 0) & 127);
    loc_19 = (char)(SDS_SAMPLE_NUM.f_0 * 2 >> 8);
    loc_18 = (char)16;
    t1 = x_aFldiv(0, *(int far *)MK_FP(arg_2, arg_0 + 38), 0x3b9a, -0x3600);
    loc_4 = (int)t1;
    loc_2 = (int)(t1 >> 16);
    loc_17 = (char)((char)(int)t1 & 127);
    loc_16 = (char)((char)(loc_4 * 2 >> 8) & 127);
    ax = loc_4;
    ax2 = ax * 2;
    loc_15 = (char)((char)(((int)(t1 >> 16) * 2 + (ax2 < ax)) * 2 + (ax2 * 2 < ax2)) & 127);
    es = arg_2;
    loc_14 = (char)(*(char far *)MK_FP(es, arg_0 + 28) & 127);
    loc_13 = (char)((char)(*(int far *)MK_FP(es, arg_0 + 28) * 2 >> 8) & 127);
    ax3 = *(int far *)MK_FP(es, arg_0 + 28);
    ax4 = ax3 * 2;
    loc_12 = (char)((char)((*(int far *)MK_FP(es, arg_0 + 30) * 2 + (ax4 < ax3)) * 2 + (ax4 * 2 < ax4)) & 127);
    ax5 = *(int far *)MK_FP(es, arg_0 + 24);
    ax6 = ax5 - *(int far *)MK_FP(es, arg_0 + 32);
    dx = (int)(((long)*(int far *)MK_FP(es, arg_0 + 26) << 16 | (unsigned)ax5) - *(long far *)MK_FP(es, arg_0 + 32) >> 16);
    loc_8 = ax6;
    loc_6 = dx;
    loc_11 = (char)((char)ax6 & 127);
    loc_10 = (char)((char)(loc_8 * 2 >> 8) & 127);
    ax7 = loc_8;
    ax8 = ax7 * 2;
    loc_f = (char)((char)((dx * 2 + (ax8 < ax7)) * 2 + (ax8 * 2 < ax8)) & 127);
    loc_e = (char)(*(char far *)MK_FP(es, arg_0 + 24) & 127);
    loc_d = (char)((char)(*(int far *)MK_FP(es, arg_0 + 24) * 2 >> 8) & 127);
    ax9 = *(int far *)MK_FP(es, arg_0 + 24);
    ax10 = ax9 * 2;
    loc_c = (char)((char)((*(int far *)MK_FP(es, arg_0 + 26) * 2 + (ax10 < ax9)) * 2 + (ax10 * 2 < ax10)) & 127);
    loc_b = (char)(0 - (*(char far *)MK_FP(es, arg_0 + 36) == 0) & 127);
    loc_a[0] = (char)-9;
    t2 = int4A_sysex_wrapper((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1e), 21);
    return;
}
