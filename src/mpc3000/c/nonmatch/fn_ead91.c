/* differs: 308 at +5, 120 bytes; 311 at +5, 120 bytes; 312 at +5, 120 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_FP_E40C {
    long f_0;
};
extern char B_977D;
extern unsigned char B_E427;
extern struct g_FP_E40C FP_E40C;
extern long far far_cb772(char far *);
extern int far far_e931c(void);

long far fn_ead91(void)
{
    char loc_6[6];
    int ax;
    int dx;
    int es;
    long t1;

    ax = far_e931c();
    dx = UNDEF;
    if (B_E427 >= 35) {
        es = (int)(FP_E40C.f_0 >> 16);
        loc_6[0] = (char)(*(char far *)MK_FP(es, (int)FP_E40C.f_0 + B_E427 * 24 - 0x2f3) - 112);
        loc_6[1] = (char)0;
        loc_6[2] = B_E427;
        loc_6[3] = (char)127;
        if (*(char far *)MK_FP(es, *(int *)((char *)&FP_E40C + 0) + 17) == B_E427) {
            loc_6[4] = B_977D;
        } else {
            loc_6[4] = (char)64;
        }
        t1 = far_cb772((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_6));
        ax = (int)t1;
        dx = (int)(t1 >> 16);
    }
    return ((long)dx << 16 | (unsigned)ax);
}
