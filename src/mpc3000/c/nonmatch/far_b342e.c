/* differs: 308 at +3, 2 bytes; 311 at +3, 2 bytes; 312 at +3, 2 bytes */
struct s1 {
    char pad_0[13];
    char f_d;
};
extern int FP_7B8F;
extern int W_7B91;

void far far_b342e(void)
{
    struct s1 far *loc_4;
    int loc_2;
    int dx;

    dx = FP_7B8F;
    loc_2 = W_7B91;
    *(int *)((char *)&loc_4 + 0) = dx;
    return;
}
