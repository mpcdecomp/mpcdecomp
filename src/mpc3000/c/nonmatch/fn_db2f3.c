/* differs: 308 at +6, 121 bytes; 311 at +6, 121 bytes; 312 at +6, 121 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[1];
    char f_1;
};
extern char B_826F;
extern char B_8A9B;
extern char B_96EE;
extern char B_A570;
extern long far far_db113(struct s1 far *, int);
extern long far far_dd133(int, int, int);

long far fn_db2f3(struct s1 far *arg_0, int arg_2, int arg_4)
{
    int loc_2;
    int ax;
    int bx;
    int cx;
    int es;

    cx = B_96EE;
    if (B_A570 != 0) {
        bx = FP_OFF(arg_0);
        es = FP_SEG(arg_0);
        loc_2 = (unsigned char)*(char far *)MK_FP(es, bx + 1) & 15;
        *(char far *)MK_FP(es, bx + 1) = (char)(*(char *)((char *)&loc_2 + 0) + 1);
        if (*(char far *)MK_FP(es, bx + 1) == B_826F) {
            ax = 1;
        } else {
            ax = 0;
        }
        cx = ax;
    } else {
        arg_0->f_1 = B_8A9B;
    }
    if (cx != 0) {
        return far_db113(arg_0, arg_4);
    }
    return far_dd133(*(int *)((char *)&arg_0 + 0), arg_2, arg_4);
}
