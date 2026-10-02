/* differs: 308 at +5, 126 bytes; 311 at +5, 126 bytes; 312 at +5, 126 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B88;
extern char B_7B89;
extern char B_7B8A;
extern char B_7B8B;
extern int far far_b1ad0(int, int);
extern int far far_b1ae0(int);

long far far_b2739(long arg_0)
{
    char loc_1;
    int bx;
    int es;
    int t1;
    int t2;
    int t3;
    int t4;

    t1 = far_b1ad0(B_7B8A, B_7B89);
    loc_1 = (char)0;
    if (loc_1 < B_7B8B) {
        do {
            es = (int)(arg_0 >> 16);
            if (*(char far *)MK_FP(es, (int)arg_0) != 0) {
                bx = *(int *)((char *)&arg_0 + 0);
                *(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) + 1;
                t2 = far_b1ae0(*(char far *)MK_FP(es, bx));
            } else {
                t3 = far_b1ae0(32);
            }
            loc_1 = (char)(loc_1 + 1);
        } while (loc_1 < B_7B8B);
    }
    t4 = far_b1ad0(B_7B8A, B_7B89);
    B_7B88 = (char)1;
    return ((long)UNDEF << 16 | (unsigned)t4);
}
