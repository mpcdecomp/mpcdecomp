/* differs: 308 at +5, 109 bytes; 311 at +5, 93 bytes; 312 at +5, 93 bytes */
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
extern char B_7AB0;
extern char B_7AB1;
extern char B_7AB2;
extern char B_7AB3;
extern int W_7ABE;
extern long far far_d5ca6(int, char far *, int, char far *, int);

long far fn_d569e(int arg_0)
{
    char loc_8[8];
    int loc_a;
    long loc_c;
    int ax;
    int cx;
    int si;
    long t1;

    B_7AAA = (char)37;
    B_7AAB = (char)0;
    B_7AAC = (char)0;
    B_7AAD = (char)0;
    B_7AAE = (char)0;
    B_7AAF = (char)0;
    B_7AB0 = (char)0;
    B_7AB1 = (char)0;
    B_7AB2 = (char)0;
    B_7AB3 = (char)0;
    cx = UNDEF;
    if ((int)far_d5ca6(arg_0, (char far *)&B_7AAA, 10, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8), 8) != 0) {
        return 0L;
    }
    W_7ABE = ((unsigned char)loc_8[6] << 8) + (unsigned char)loc_8[7];
    loc_a = 0;
    *(int *)((char *)&loc_c + 0) = 0;
    si = 0;
    do {
        t1 = loc_c << 8;
        cx = UNDEF;
        loc_a = (int)(t1 >> 16);
        *(int *)((char *)&loc_c + 0) = (int)t1;
        ax = (unsigned char)loc_8[si];
        *(int *)((char *)&loc_c + 0) = *(int *)((char *)&loc_c + 0) | ax;
        loc_a = loc_a | -(ax < 0);
        si = si + 1;
    } while (si < 4);
    if ((*(int *)((char *)&loc_c + 0) | loc_a) != 0) {
        *(int *)((char *)&loc_c + 0) = *(int *)((char *)&loc_c + 0) + 1;
        loc_a = (int)(loc_c + 1L >> 16);
    }
    return loc_c;
}
