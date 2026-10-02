/* differs: 308 at +3, 267 bytes; 311 at +3, 267 bytes; 312 at +3, 268 bytes */
struct s1 {
    char f_0;
    char pad_1[1];
    char f_2;
    char pad_3[4];
    char f_7;
};
extern char B_F5FE;
extern char B_F5FF;
extern char B_F742;
extern char B_F743;
extern char TBL_F47A[];
extern char TBL_F4FE[];
extern char TBL_F57E[];
extern char TBL_F602[];
extern char TBL_F642[];
extern char TBL_F682[];
extern int TBL_F6C2[];
extern unsigned char TBL_dc145[];
extern int W_F2B4;
extern int W_F4FA;
extern int W_F4FC;
extern int W_F600;
extern int far far_de4c2(struct s1 far *);

void far far_dc03b(struct s1 far *arg_0, int arg_2)
{
    unsigned int t1;

    if (arg_0->f_0 == -1) {
        B_F743 = (char)-1;
        return;
    }
    t1 = far_de4c2(arg_0);
    if (t1 > 12) {
L1:
        return;
    }
    switch ((unsigned int)(unsigned)(TBL_dc145 + (t1 << 1))) {
    case 0:
        W_F4FC = -1;
        W_F4FA = -1;
        return;
    case 1:
        TBL_F47A[(unsigned char)arg_0->f_2 & 127] = (char)-1;
        return;
    case 2:
        TBL_F4FE[(unsigned char)arg_0->f_2 & 127] = (char)-1;
        return;
    case 3:
        TBL_F57E[(unsigned char)arg_0->f_2 & 127] = (char)-1;
        return;
    case 4:
        B_F5FE = (char)-1;
        return;
    case 5:
        B_F5FF = (char)-1;
        return;
    case 6:
        W_F600 = -1;
        return;
    case 7:
        W_F2B4 = 0;
        return;
    case 8:
        TBL_F602[(unsigned char)arg_0->f_7 & 63] = (char)-1;
        return;
    case 9:
        TBL_F642[(unsigned char)arg_0->f_7 & 63] = (char)-1;
        return;
    case 10:
        TBL_F682[(unsigned char)arg_0->f_7 & 63] = (char)-1;
        return;
    case 11:
        TBL_F6C2[(unsigned char)arg_0->f_7 & 63] = -1;
        return;
    case 12:
        B_F742 = (char)-1;
        goto L1;
    }
}
