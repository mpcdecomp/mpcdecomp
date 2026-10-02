/* differs: 308 at +6, 97 bytes; 311 at +6, 97 bytes; 312 at +6, 97 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[3];
    char f_3;
    char pad_4[2];
    char f_6;
};
extern long far far_d7805();

void far far_b2b15(int arg_0, int arg_2, struct s1 far *arg_4, int arg_6)
{
    int loc_2;
    char loc_3;
    int loc_4;
    long t1;
    long t2;
    long t3;

    loc_2 = arg_2;
    loc_4 = arg_0;
    t1 = far_d7805(loc_2, arg_4, 3, 48);
    arg_4->f_3 = (char)46;
    t2 = far_d7805(loc_3, ((long)arg_6 << 16 | (unsigned)(*(int *)((char *)&arg_4 + 0) + 4)), 2, 48);
    arg_4->f_6 = (char)46;
    t3 = far_d7805(*(char *)((char *)&loc_4 + 0), ((long)arg_6 << 16 | (unsigned)(*(int *)((char *)&arg_4 + 0) + 7)), 2, 48);
    return;
}
