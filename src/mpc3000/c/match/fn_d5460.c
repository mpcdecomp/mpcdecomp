extern char B_7AAA;
extern char B_7AAB;
extern char B_7AAC;
extern char B_7AAD;
extern char B_7AAE;
extern char B_7AAF;
extern long far far_d5ca6(int, char far *, int, int, int, int);

long far fn_d5460(int arg_0, int arg_2, int arg_4, int arg_6)
{
    B_7AAA = (char)18;
    B_7AAB = (char)0;
    B_7AAC = (char)0;
    B_7AAD = (char)0;
    B_7AAE = (char)arg_2;
    B_7AAF = (char)0;
    return far_d5ca6(arg_0, (char far *)&B_7AAA, 6, arg_4, arg_6, arg_2);
}
