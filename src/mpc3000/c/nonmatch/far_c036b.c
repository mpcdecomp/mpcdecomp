/* differs: 308 at +5, 82 bytes; 311 absent; 312 absent */
extern char B_8A9C;
extern char B_8A9F;
extern char B_9561;
extern char B_9562;
extern long far far_e4d15(int, char, int);
extern long far fn_c007f(void);
long far fn_c007f(void) { return 0; }

int far far_c036b(void)
{
    int loc_2;
    int ax;
    long t1;
    long t2;

    t1 = far_e4d15(B_8A9F, B_8A9C, -0x71f3);
    t2 = fn_c007f();
    if (B_9562 == 0) {
        ax = ((char)((int)t2 >> 8) << 8 | (unsigned char)B_8A9F);
    } else {
        ax = ((char)((int)t2 >> 8) << 8 | (unsigned char)B_9561);
    }
    loc_2 = (char)ax;
    return (char)ax;
}
