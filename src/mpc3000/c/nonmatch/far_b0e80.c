/* differs: 308 at +6, 162 bytes; 311 at +6, 162 bytes; 312 at +6, 162 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B5D;
extern char B_7B87;
extern char B_7B88;
extern char B_7B89;
extern char B_7B8A;
extern char B_7B8B;
extern char B_7B8C;
extern char TBL_7B5E[];
extern int far far_b1ad0(int, int);
extern int far far_b1ae0(int);

int far far_b0e80(long arg_0)
{
    char loc_1;
    int ax;
    int bx;
    int es;
    int t1;
    int t2;

    if (B_7B88 != 0) {
        B_7B87 = (char)0;
        if (B_7B87 < B_7B8B) {
            do {
                bx = (int)arg_0;
                es = (int)(arg_0 >> 16);
                if (*(char far *)MK_FP(es, bx) != 0) {
                    loc_1 = *(char far *)MK_FP(es, bx);
                    *(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) + 1;
                } else {
                    loc_1 = (char)32;
                }
                t1 = far_b1ae0(loc_1);
                TBL_7B5E[B_7B87] = loc_1;
                B_7B87 = (char)(B_7B87 + 1);
            } while (B_7B87 < B_7B8B);
        }
        TBL_7B5E[B_7B8B] = (char)0;
        B_7B87 = (char)0;
        t2 = far_b1ad0(B_7B8A, B_7B89);
        B_7B88 = (char)0;
        if ((B_7B8C & 15) == 1) {
            ax = 1;
        } else {
            ax = 0;
        }
        B_7B5D = (char)ax;
    }
    return ax;
}
