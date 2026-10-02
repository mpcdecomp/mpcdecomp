/* differs: 308 at +0, 86 bytes; 311 at +0, 85 bytes; 312 at +0, 85 bytes */
struct g_W_745E {
    int f_0;
};
extern int W_745C;
extern struct g_W_745E W_745E;
extern int W_7460;
extern int W_7462;
extern void far far_cb6a2(void);

void near fn_e813a(void)
{
    int ax;
    int bx;
    int cx;
    int dx;
    int t1;

    W_745C = bx;
    W_745E.f_0 = ax;
    W_7460 = dx;
    W_7462 = cx;
    far_cb6a2();
    outp(-0x3fff, (char)1);
    outpw(-0x3ffc, W_745C);
    outp(-0x3ffa, (char)(*(char *)((char *)&W_745E + 0) | 48));
    W_7460 = W_7460 - 1;
    outpw(-0x3ffe, W_7460);
    return;
}
