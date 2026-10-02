/* differs: 308 at +3, 40 bytes; 311 at +3, 40 bytes; 312 at +3, 40 bytes */
struct s1 {
    char pad_0[2];
    char f_2;
};
extern long far far_cbbd4(int);
extern int far far_dab06(int);

int far far_da706(int arg_0)
{
    struct s1 far *t1;

    t1 = (struct s1 far *)far_cbbd4(far_dab06(arg_0));
    return (unsigned char)t1->f_2;
}
