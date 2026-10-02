/* differs: 308 absent; 311 at +5, 186 bytes; 312 absent */
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_A3E7 {
    int f_0;
};
struct g_TBL_A267 {
    int f_0;
};
extern char B_7FC7;
extern unsigned char B_8809;
extern char B_880B;
extern char B_8A9B;
extern char B_977D;
extern char B_977E;
extern char B_977F;
extern char B_A5C1;
extern char B_D4AB;
extern char TBL_966E[];
extern char TBL_9FE7[];
extern struct g_TBL_A267 TBL_A267;
extern char TBL_A367[];
extern struct g_TBL_A3E7 TBL_A3E7;
extern char TBL_A4E7[];
extern int far far_daabc(int);
extern long far far_dd9ba(long, int);

void far far_dd405(void)
{
    char loc_a;
    char loc_9;
    char loc_8;
    char loc_7;
    char loc_6;
    char loc_5[3];
    int loc_2;
    int ax;
    int bx;
    int di;
    int dx;
    int dx2;
    int dx3;
    int es;
    int p18;
    int p20;
    int p22;
    char near *si;
    int t1;
    long t2;

    loc_2 = 35;
    si = (char near *)-0x6aa7;
    di = 70;
    do {
        ax = TBL_966E[loc_2];
        if (ax != 0) {
            dx2 = 0;
            if ((B_D4AB == 0 || B_7FC7 == 0) && B_977F == loc_2) {
                *si = B_977D;
                dx2 = B_977E;
            }
            if (B_A5C1 >= 8) {
                bx = loc_2;
                TBL_9FE7[bx] = (char)dx2;
                TBL_A4E7[bx] = (char)ax;
                *(int *)((char *)&TBL_A3E7 + 0 + di) = 0;
                TBL_A367[bx] = *si;
                *(int *)((char *)&TBL_A267 + 0 + di) = B_8809 - 4;
                B_880B = (char)1;
            }
            loc_a = (char)((char)dx2 | -104);
            loc_9 = B_8A9B;
            loc_8 = *(char *)((char *)&loc_2 + 0);
            loc_7 = (char)ax;
            loc_6 = *si;
            dx3 = B_8809 - 4;
            if (dx3 <= 1) {
                dx3 = 1;
            }
            t1 = far_daabc(dx3);
            *(int *)((char *)&loc_5 + 0) = t1;
            p18 = 7;
            p20 = SEG_STACK;
            p22 = (int)(unsigned)&loc_a;
            t2 = far_dd9ba(((long)p20 << 16 | (unsigned)p22), p18);
            es = UNDEF;
            dx = (int)(t2 >> 16);
        }
        si = si + 1;
        di = di + 2;
        loc_2 = loc_2 + 1;
    } while ((unsigned int)(unsigned)si != -0x6a67);
    return;
}
