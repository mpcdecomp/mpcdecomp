/* differs: 308 at +0, 38 bytes; 311 at +0, 38 bytes; 312 at +0, 38 bytes */
extern int far far_fb14d(int);
extern int far far_fb18a(void);
int far far_fb14d(int p0) { return 0; }
int far far_fb18a(void) { return 0; }

void far far_fb380(void)
{
    int flags;
    int p2;
    long t1;
    long t2;

    p2 = __flags(flags);
    _disable();
    t1 = far_fb14d(p2);
    t2 = far_fb18a();
    __insn("popf", p2);
    return;
}
