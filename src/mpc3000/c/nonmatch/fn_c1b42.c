/* differs: 308 at +5, 125 bytes; 311 at +5, 125 bytes; 312 at +5, 125 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_955C;
extern unsigned char B_D4B5;
extern int TBL_954B[];
extern int TBL_9553[];
extern void far fn_c1b13(char, int, int);
void far fn_c1b13(char p0, int p1, int p2) { }

long far fn_c1b42(int arg_0, int arg_2, unsigned int arg_4, int arg_6)
{
    int loc_2;
    int ax;
    int dx;
    int si;
    int t1;
    int t2;

    loc_2 = (int)B_D4B5 >> 4;
    if (arg_6 != 0) {
        si = 0;
        do {
            fn_c1b13(*(char *)((char *)&arg_0 + 0), arg_2, si);
            ax = UNDEF;
            si = si + 1;
        } while (si < 16);
        dx = -1;
    } else {
        fn_c1b13(*(char *)((char *)&arg_0 + 0), arg_2, arg_4);
        ax = UNDEF;
        dx = 1 << (unsigned char)*(char *)((char *)&arg_4 + 0);
    }
    if (arg_2 != 0) {
        TBL_954B[loc_2] = dx;
        B_955C = (char)(B_955C | 2);
        while (TBL_954B[loc_2] != 0) {
        }
        return ((long)dx << 16 | (unsigned)ax);
    }
    TBL_9553[loc_2] = dx;
    B_955C = (char)(B_955C | 1);
    while (TBL_9553[loc_2] != 0) {
    }
    return ((long)dx << 16 | (unsigned)ax);
}
