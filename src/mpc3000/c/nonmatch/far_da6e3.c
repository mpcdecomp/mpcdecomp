/* differs: 308 at +3, 40 bytes; 311 at +3, 40 bytes; 312 at +3, 40 bytes */
struct s1 {
    char pad_0[1];
    char f_1;
};
extern long far far_cbb70(int);
extern int far far_dab06(int);

int far far_da6e3(int arg_0)
{
    struct s1 far *t1;

    t1 = (struct s1 far *)far_cbb70(far_dab06(arg_0));
    return (unsigned char)t1->f_1;
}
