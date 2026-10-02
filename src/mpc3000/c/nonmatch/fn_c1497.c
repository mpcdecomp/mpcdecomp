/* differs: 308 absent; 311 at +5, 255 bytes; 312 at +5, 255 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
struct s1 {
    char pad_0[1];
    char f_1;
};
extern char B_D4B5;
extern char B_EFDA;
extern int TBL_1433[];
extern unsigned char TBL_159B[];
extern long far far_b133a(long, int, char, int, int);
extern long far far_cbb70(int);
extern int far far_dab06(int);

long far fn_c1497(int arg_0)
{
    long loc_c;
    int loc_a;
    int loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int bx;
    int bx2;
    int dx;
    int es;
    int es2;
    int si2;
    struct s1 far *t1;
    long t2;
    long t3;

    ax = far_dab06(arg_0 + B_D4B5);
    dx = UNDEF;
    loc_4 = ax;
    if (ax >= 35) {
        t1 = (struct s1 far *)far_cbb70(loc_4);
        loc_2 = (unsigned char)t1->f_1;
        loc_6 = SEG_DATA;
        loc_8 = (int)(unsigned)TBL_159B;
        t2 = (long)(int)arg_0 * 15L;
        ax = TBL_1433[loc_2 * 10 / 67];
        loc_a = SEG_DATA;
        *(int *)((char *)&loc_c + 0) = ax;
        si2 = 0;
        do {
            ax2 = ((char)(ax >> 8) << 8 | (unsigned char)B_EFDA);
            bx = (int)loc_c;
            es = (int)(loc_c >> 16);
            *(int *)((char *)&loc_c + 0) = *(int *)((char *)&loc_c + 0) + 1;
            ax3 = ((char)((int)far_b133a(*(long *)((char *)&loc_8 + 0), (int)t2 + 3, *(char far *)MK_FP(es, bx), 8, ax2) >> 8) << 8 | (unsigned char)B_EFDA);
            bx2 = (int)loc_c;
            es2 = (int)(loc_c >> 16);
            *(int *)((char *)&loc_c + 0) = *(int *)((char *)&loc_c + 0) + 1;
            t3 = far_b133a(*(long *)((char *)&loc_8 + 0), (int)t2, *(char far *)MK_FP(es2, bx2), 3, ax3);
            ax = (int)t3;
            dx = (int)(t3 >> 16);
            loc_8 = loc_8 + 30;
            si2 = si2 + 1;
        } while (si2 < 11);
    }
    return ((long)dx << 16 | (unsigned)ax);
}
