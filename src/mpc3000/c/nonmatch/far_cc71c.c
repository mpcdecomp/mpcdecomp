/* differs: 308 absent; 311 at +3, 296 bytes; 312 at +3, 297 bytes */
extern char B_9482;
extern char B_D4BE;
extern char B_D5DD;
extern char B_D5DE;
extern unsigned char TBL_9483[];
extern unsigned char TBL_94C3[];
extern unsigned char TBL_9503[];
extern long far far_da5fe(int, int);
extern long far far_da62b(int, int);
extern long far far_da659(int, int);
extern int far fn_cc800(unsigned char far *, char, char);

int far far_cc71c(int arg_0, int arg_2, char arg_4)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;

    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char *)((char *)&arg_2 + 0));
    if ((char)ax == 1) {
        goto L1;
    }
    if ((char)ax == 2) {
        goto L2;
    }
    if ((char)ax != 3) {
        goto L3;
    }
    goto L4;
L3:
    return (char)ax;
L1:
    ax3 = (int)far_da5fe(*(char *)((char *)&arg_0 + 0), arg_4);
    if (B_D5DE == 74) {
        goto L5;
    }
    goto L6;
L5:
    if (B_D5DD == 1) {
        goto L7;
    }
    goto L6;
L7:
    ax5 = ((char)(fn_cc800((unsigned char far *)TBL_9503, *(char *)((char *)&arg_0 + 0), arg_4) >> 8) << 8 | (unsigned char)*(char *)((char *)&arg_2 + 0));
    B_9482 = (char)ax5;
    B_D4BE = (char)80;
    return ax5;
L2:
    ax3 = (int)far_da62b(*(char *)((char *)&arg_0 + 0), arg_4);
    if (B_D5DE != 74) {
        goto L6;
    }
    if (B_D5DD != 1) {
        goto L6;
    }
    ax4 = ((char)(fn_cc800((unsigned char far *)TBL_94C3, *(char *)((char *)&arg_0 + 0), arg_4) >> 8) << 8 | (unsigned char)*(char *)((char *)&arg_2 + 0));
    B_9482 = (char)ax4;
    B_D4BE = (char)80;
    return ax4;
L4:
    ax3 = (int)far_da659(*(char *)((char *)&arg_0 + 0), arg_4);
    if (B_D5DE != 74) {
        goto L6;
    }
    if (B_D5DD != 2) {
        goto L6;
    }
    ax3 = ((char)(fn_cc800((unsigned char far *)TBL_9483, *(char *)((char *)&arg_0 + 0), arg_4) >> 8) << 8 | (unsigned char)*(char *)((char *)&arg_2 + 0));
    B_9482 = (char)ax3;
    B_D4BE = (char)80;
L6:
    return ax3;
}
int far fn_cc800(unsigned char far *p0, char p1, char p2) { return 0; }
