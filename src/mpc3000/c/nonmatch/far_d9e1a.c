/* differs: 308 absent; 311 at +0, 111 bytes; 312 at +0, 111 bytes */
extern void far far_c46ab(void);
extern long far far_cdcc2(void);

void far far_d9e1a(void)
{
    int t1;
    long t2;

    far_c46ab();
    outpw(104, 0);
    outp(252, (char)(inp(252) & -49 | -128));
    outp(128, (char)(inp(128) & -7));
    outpw(96, 0x21f);
    outpw(100, -1);
    outpw(98, -1);
    outpw(96, 0x203);
    outpw(100, -1);
    outpw(98, -1);
    t2 = far_cdcc2();
    return;
}
