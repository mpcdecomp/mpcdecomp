/* differs: 172 size 322, image 328 */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int G_ERRNO;
extern unsigned char SND_LENGTH;
extern unsigned char SND_LENGTH_HI;
extern unsigned char SND_RATE;
extern unsigned char SND_STEREO;
extern int __far int2F_call_fn14(long);
extern void __far int2F_dispatch_10(void);
extern void __near __pascal int2F_fn14_setup(int far *, int);
extern void __near __pascal lcd_fill_buffer(int, int);
extern long __far __pascal mem_block_process(int, int, int);
extern long __far __pascal __aFlmul(int, int, int, int);
extern int __far _setjmp(void far *);

long __far __pascal int2F_fn14_caller(int arg_6, int arg_4, int arg_2, int arg_0)
{
    int loc_32;
    int loc_30;
    int loc_2e;
    int loc_2c;
    int loc_2a;
    int loc_28;
    int loc_26;
    int loc_24;
    int loc_22;
    int loc_20;
    int loc_1e;
    int loc_1c;
    int loc_1a;
    int loc_18;
    int loc_16;
    int loc_14;
    int loc_12;
    int loc_10;
    int loc_e;
    int loc_c;
    int loc_a;
    int loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int dx;
    int es;
    int es2;
    int p56;
    int p58;
    int si;
    long t1;
    int t10;
    int t11;
    int t12;
    long t2;
    int t3;
    long t4;
    long t5;
    int t6;
    int t7;
    int t8;
    int t9;

    dx = UNDEF;
    if (int2F_call_fn14(*(long *)((char *)&arg_0 + 0)) != 0) {
        goto L1;
    }
    G_ERRNO = 13;
    goto L2;
L1:
    t1 = mem_block_process(arg_2, arg_0, 0);
    dx = (int)(t1 >> 16);
    if ((int)t1 != 0) {
        goto L3;
    }
    goto L2;
L3:
    t2 = _setjmp(MK_FP(SEG_DATA, -0x709e));
    G_ERRNO = (int)t2;
    if ((int)t2 == 0) {
        goto L4;
    }
    goto L5;
L4:
    loc_14 = 0x6d66;
    loc_12 = 0x2074;
    loc_10 = 18;
    loc_e = (int)t2;
    loc_2e = 1;
    loc_20 = 16;
    loc_1e = (int)t2;
    si = arg_4;
    es = arg_6;
    loc_2c = 0 - (*(char far *)MK_FP(es, (unsigned)&SND_STEREO + si) == 0) + 2;
    loc_2a = *(int far *)MK_FP(es, (unsigned)&SND_RATE + si);
    loc_28 = 0;
    ax = loc_2c;
    ax2 = (((char)(ax >> 8) & 15) << 8 | (unsigned char)(char)ax) * 2;
    loc_22 = ax2;
    p56 = loc_28;
    p58 = loc_2a;
    loc_32 = ax2;
    loc_30 = 0;
    t4 = __aFlmul(p56, p58, 0, ax2);
    loc_26 = (int)t4;
    loc_24 = (int)(t4 >> 16);
    loc_c = 0x6164;
    loc_a = 0x6174;
    es2 = arg_6;
    t5 = __aFlmul(*(int far *)MK_FP(es2, (unsigned)&SND_LENGTH_HI + si), *(int far *)MK_FP(es2, (unsigned)&SND_LENGTH + si), loc_30, loc_32);
    loc_8 = (int)t5;
    loc_6 = (int)(t5 >> 16);
    loc_1c = 0x4952;
    loc_1a = 0x4646;
    loc_18 = (int)t5 + 38;
    loc_16 = (int)(t5 + 38L >> 16);
    loc_4 = 0x4157;
    loc_2 = 0x4556;
    int2F_fn14_setup((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1c), 8);
    int2F_fn14_setup((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4), 4);
    int2F_fn14_setup((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_14), 8);
    int2F_fn14_setup((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2e), 18);
    int2F_fn14_setup((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_c), 8);
    lcd_fill_buffer(arg_6, arg_4);
    int2F_dispatch_10();
    return ((long)UNDEF << 16 | (unsigned)1);
L5:
    int2F_dispatch_10();
    dx = UNDEF;
L2:
    return ((long)dx << 16 | (unsigned)0);
}
