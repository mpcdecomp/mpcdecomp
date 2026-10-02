/* differs: 308 at +5, 216 bytes; 311 at +5, 209 bytes; 312 at +5, 209 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7AAA;
extern char B_7AAB;
extern char B_7AAC;
extern char B_7AAD;
extern char B_7AAE;
extern char B_7AAF;
extern char B_7AC0;
extern char B_F292;
extern int W_7ABE;
extern long far far_d5ca6(int, char far *, int, int, int, int);

long far far_d555b(int arg_0, long arg_2, int arg_4, int arg_6, int arg_8, int arg_10, char arg_12)
{
    unsigned int loc_2;
    unsigned int ax;
    int cx;
    int di;
    int dx;
    unsigned int si;

    di = arg_0;
    si = arg_6;
    loc_2 = si;
    B_7AAA = arg_12;
    B_7AAF = (char)0;
    if ((B_F292 & 1) != 0) {
        while (si != 0) {
            loc_2 = 1;
            if (si < loc_2) {
                loc_2 = si;
            }
            B_7AAB = (char)((char)arg_4 & 31);
            B_7AAC = (char)(int)((unsigned long)(unsigned int)(*(int *)((char *)&arg_2 + 0) & -0x100) >> 8);
            B_7AAD = *(char *)((char *)&arg_2 + 0);
            B_7AAE = *(char *)((char *)&loc_2 + 0);
            cx = UNDEF;
            dx = (int)far_d5ca6(di, (char far *)&B_7AAA, 6, arg_8, arg_10, W_7ABE * loc_2);
            if (dx == 0) {
                arg_8 = arg_8 + W_7ABE;
                si = si - loc_2;
                ax = loc_2;
                *(int *)((char *)&arg_2 + 0) = *(int *)((char *)&arg_2 + 0) + ax;
                arg_4 = (int)(arg_2 + (unsigned long)(unsigned int)ax >> 16);
                continue;
            }
            goto L1;
        }
    } else {
        if (B_7AC0 == 5) {
            loc_2 = si + 3 >> 2;
        }
        B_7AAB = (char)((char)arg_4 & 31);
        B_7AAC = (char)(int)((unsigned long)(unsigned int)(*(int *)((char *)&arg_2 + 0) & -0x100) >> 8);
        B_7AAD = *(char *)((char *)&arg_2 + 0);
        B_7AAE = *(char *)((char *)&loc_2 + 0);
        dx = (int)far_d5ca6(di, (char far *)&B_7AAA, 6, arg_8, arg_10, W_7ABE * loc_2);
    }
L1:
    return ((long)dx << 16 | (unsigned)dx);
}
