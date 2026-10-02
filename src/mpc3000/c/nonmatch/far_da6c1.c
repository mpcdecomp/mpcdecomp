/* differs: 308 at +3, 39 bytes; 311 at +3, 39 bytes; 312 at +3, 39 bytes */
extern long far far_cbb70(int);
extern int far far_dab06(int);

int far far_da6c1(int arg_0)
{
    char far *t1;

    t1 = (char far *)far_cbb70(far_dab06(arg_0));
    return (unsigned char)*t1;
}
