/* differs: 308 absent; 311 match; 312 match */
extern char B_8A9F;
extern char B_901B;
extern char B_9457;
extern int W_904B;
extern int W_904D;
extern long far far_deee8(char far *, int);
extern void far far_e2a44(int, int, int);
extern long far far_e51be(char far *, int, int);
extern void far far_e5902(int);
extern long far far_e5a99(char far *);

void far far_e1d5f(int arg_0, int arg_2)
{
    int dx;
    long t1;
    int t2;
    long t3;
    long t4;
    int t5;
    long t6;
    long t7;

    if (B_901B == 0 || (int)far_e51be((char far *)&B_901B, B_8A9F, 0) == 0) {
        t1 = far_e5a99((char far *)&B_901B);
        if (B_9457 == 0) {
            far_e2a44(arg_0, arg_2, 0);
            t3 = far_deee8((char far *)&B_901B, arg_0);
            B_901B = (char)1;
            t4 = far_deee8((char far *)&B_901B, arg_2);
            B_901B = (char)0;
            far_e5902(arg_0);
            t6 = far_deee8((char far *)&B_901B, 1);
            t7 = far_e5a99((char far *)&B_901B);
            dx = (int)(far_deee8((char far *)&B_901B, arg_0) >> 16);
            if (W_904D > W_904B) {
                W_904D = 1;
            }
        }
    }
    return;
}
