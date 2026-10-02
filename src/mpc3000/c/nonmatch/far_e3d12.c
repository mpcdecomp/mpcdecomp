/* differs: 308 at +5, 286 bytes; 311 at +5, 286 bytes; 312 at +5, 286 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8800;
extern unsigned char B_8804;
extern unsigned char B_901B[];
extern char TBL_A5BC[];
extern int W_87FE;
extern int far far_deee8(long, int);
extern long far far_e3ddb(long);
extern long far far_e7073(int, int);

long far far_e3d12(long arg_0, int arg_2, int arg_4, int arg_6)
{
    int loc_2;
    int loc_4;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int cx;
    int es;
    int es2;
    long t1;
    int t2;
    int t3;
    long t4;

    loc_2 = arg_6;
    loc_4 = arg_4;
    if (B_8800 != 0) {
        arg_6 = SEG_DATA;
        if (arg_2 == arg_6 && *(int *)((char *)&arg_0 + 0) == (unsigned int)(unsigned)B_901B) {
            cx = W_87FE;
            t1 = (long)(int)B_8804 * 0x1f4L;
            arg_4 = (int)(t1 >> 16);
            if (TBL_A5BC[(int)t1] == 0) {
                return ((long)arg_4 << 16 | (unsigned)(int)t1);
            }
            goto L1;
        }
L2:
        bx = (int)arg_0;
        es = (int)(arg_0 >> 16);
        cx = *(int far *)MK_FP(es, bx + 48);
        if (*(char far *)MK_FP(es, bx) >= 0) {
L1:
            if (loc_2 > cx) {
                loc_4 = 0x100;
            }
            bx2 = (int)arg_0;
            if (*(int far *)MK_FP((int)(arg_0 >> 16), bx2 + 56) != loc_2) {
                t2 = far_deee8(((long)arg_2 << 16 | (unsigned)bx2), loc_2);
                arg_4 = UNDEF;
            }
            bx3 = (int)arg_0;
            if (*(int far *)MK_FP((int)(arg_0 >> 16), bx3 + 54) >= loc_4) {
                t3 = far_deee8(((long)arg_2 << 16 | (unsigned)bx3), loc_2);
                arg_4 = UNDEF;
            }
            for (;;) {
                bx4 = (int)arg_0;
                es2 = (int)(arg_0 >> 16);
                if (*(int far *)MK_FP(es2, bx4 + 54) == loc_4) {
                    break;
                }
                arg_4 = (int)(far_e3ddb(arg_0) >> 16);
            }
            arg_6 = SEG_DATA;
            if (arg_2 == arg_6 && *(int *)((char *)&arg_0 + 0) == (unsigned int)(unsigned)B_901B) {
                t4 = far_e7073(*(int far *)MK_FP(es2, bx4 + 42), *(int far *)MK_FP(es2, bx4 + 44));
                arg_6 = (int)t4;
                arg_4 = (int)(t4 >> 16);
            }
        }
        return ((long)arg_4 << 16 | (unsigned)arg_6);
    }
    goto L2;
}
long far far_e3ddb(long p0) { return 0; }
