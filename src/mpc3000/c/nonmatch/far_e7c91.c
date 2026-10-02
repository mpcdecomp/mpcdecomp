/* differs: 308 at +C, 71 bytes; 311 at +C, 69 bytes; 312 at +C, 69 bytes */
struct g_W_9051 {
    int f_0;
};
extern char B_901B;
extern char B_9052;
extern char B_A5C1;
extern int W_8814;
extern int W_9029;
extern int W_902B;
extern int W_902D;
extern int W_902F;
extern int W_9031;
extern int W_9033;
extern struct g_W_9051 W_9051;
extern int W_9053;
extern int W_9055;
extern long far far_e5612(int, int);

void far far_e7c91(void)
{
    int loc_4;
    int loc_2;
    int dx;
    int dx2;
    int dx3;
    long t1;

    if (B_A5C1 == 0 && B_901B == 2) {
        dx = W_9029;
        W_902F = W_902B;
        W_902D = dx;
        dx2 = W_9031;
        W_902B = W_9033;
        W_9029 = dx2;
        B_901B = (char)0;
        dx3 = W_9051.f_0;
        loc_2 = W_9053;
        loc_4 = dx3;
        W_9053 = 1;
        B_9052 = (char)1;
        *(char *)((char *)&W_9051 + 0) = (char)0;
        W_8814 = 0;
        W_9055 = 0;
        t1 = far_e5612(dx3, loc_2);
    }
    return;
}
