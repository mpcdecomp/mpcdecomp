/* differs: 308 at +3, 59 bytes; 311 at +3, 59 bytes; 312 at +3, 59 bytes */
extern long far far_b3723(int, int, long, char, long, int, long);
long far far_b3723(int p0, int p1, long p2, char p3, long p4, int p5, long p6) { return 0; }

long far far_b3819(int arg_0, int arg_2, int arg_4, int arg_6, int arg_8, int arg_10, int arg_12, char arg_14)
{
    int ax;
    int ax2;

    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)arg_14);
    return far_b3723(arg_0, arg_2, *(long *)((char *)&arg_4 + 0), *(char *)((char *)&arg_8 + 0), *(long *)((char *)&arg_10 + 0), ax, 0L);
}
