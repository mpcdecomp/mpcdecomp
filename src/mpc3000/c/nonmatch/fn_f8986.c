/* differs: 308 at +0, 75 bytes; 311 at +0, 75 bytes; 312 at +0, 75 bytes */
struct s1 {
    char pad_0[28];
    int f_1c;
    int f_1e;
    char pad_20[40];
    char f_48;
    int f_49;
    int f_4b;
};

void near fn_f8986(void)
{
    int ax;
    int dx;
    int flags;
    struct s1 near *si;

    ax = si->f_49;
    dx = si->f_4b;
    flags = dx - si->f_1e;
    if (!CC("!=", flags)) {
        flags = ax - si->f_1c;
    }
    if (!CC("<=u", flags)) {
        si->f_1c = ax;
        si->f_1e = dx;
        si->f_48 = (char)-1;
    }
    return;
}
