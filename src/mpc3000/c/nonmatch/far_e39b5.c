/* differs: 308 at +C, 31 bytes; 311 at +C, 31 bytes; 312 at +C, 31 bytes */
extern void far far_e392e(int);
extern int far far_e517b(char);
void far far_e392e(int p0) { }

void far far_e39b5(void)
{
    int loc_2;
    int t1;
    int t2;

    loc_2 = 0;
    for (;;) {
        t1 = far_e517b(*(char *)((char *)&loc_2 + 0));
        if (t1 <= loc_2) {
            break;
        }
        far_e392e(t1);
        loc_2 = t1;
    }
    return;
}
