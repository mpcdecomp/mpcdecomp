/* differs: 308 at +6, 97 bytes; 311 at +6, 97 bytes; 312 at +6, 97 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char f_0;
    char pad_1[1];
    char f_2;
};

void far far_cb3f9(struct s1 far *arg_0)
{
    unsigned char loc_1;
    int es;

    arg_0->f_0 = (char)0;
    loc_1 = (unsigned char)0;
    do {
        es = FP_SEG(arg_0);
        *(char far *)MK_FP(es, FP_OFF(arg_0) + loc_1 + 2) = (char)0;
        *(char far *)MK_FP(es, *(int *)((char *)&arg_0 + 0) + loc_1 + 5) = (char)50;
        *(int far *)MK_FP(es, *(int *)((char *)&arg_0 + 0) + (loc_1 << 1) + 8) = loc_1 * 100 + 100;
        *(char far *)MK_FP(es, *(int *)((char *)&arg_0 + 0) + loc_1 + 20) = (char)0;
        loc_1 = (unsigned char)(loc_1 + 1);
    } while (loc_1 < 3);
    arg_0->f_2 = (char)50;
    return;
}
