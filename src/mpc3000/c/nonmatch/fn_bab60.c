/* differs: 308 at +5, 147 bytes; 311 at +5, 147 bytes; 312 at +5, 147 bytes */
struct s1 {
    char pad_0[17];
    char f_11;
    char f_12;
    char f_13;
};

long far fn_bab60(struct s1 far *arg_0)
{
    long loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int cx;
    int dx;
    long t1;
    long t2;

    loc_2 = 0;
    *(int *)((char *)&loc_4 + 0) = 0;
    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)arg_0->f_13);
    dx = -((unsigned char)(char)ax < 0);
    loc_2 = dx;
    *(int *)((char *)&loc_4 + 0) = (unsigned char)(char)ax;
    t1 = ((long)dx << 16 | (unsigned)(unsigned char)(char)ax) << 8;
    loc_2 = (int)(t1 >> 16);
    *(int *)((char *)&loc_4 + 0) = (int)t1;
    ax3 = ((char)((int)t1 >> 8) << 8 | (unsigned char)arg_0->f_12);
    *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) | (unsigned char)(char)ax3;
    loc_2 = loc_2 | -((unsigned char)(char)ax3 < 0);
    t2 = loc_4 << 8;
    loc_2 = (int)(t2 >> 16);
    *(int *)((char *)&loc_4 + 0) = (int)t2;
    ax4 = ((char)((int)t2 >> 8) << 8 | (unsigned char)arg_0->f_11);
    *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) | (unsigned char)(char)ax4;
    loc_2 = loc_2 | -((unsigned char)(char)ax4 < 0);
    return loc_4;
}
