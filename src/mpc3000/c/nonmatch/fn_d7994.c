/* differs: 308 at +0, 109 bytes; 311 at +0, 109 bytes; 312 at +0, 109 bytes */
extern char B_943C;
extern char TBL_943B;

long far fn_d7994(void)
{
    int ax;
    int ax2;
    int ax3;
    int flags;

    _disable();
    TBL_943B = (char)(TBL_943B & -5);
    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)TBL_943B);
    outp(198, (char)ax);
    B_943C = (char)(B_943C & -5);
    ax3 = ((char)(ax >> 8) << 8 | (unsigned char)B_943C);
    outp(206, (char)ax3);
    __insn("popf", __flags(flags));
    return ((long)206 << 16 | (unsigned)ax3);
}
