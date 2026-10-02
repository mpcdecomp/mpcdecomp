/* differs: 308 at +28, 10 bytes; 311 at +28, 10 bytes; 312 at +28, 10 bytes */
#define UNDEF 0
extern int far far_b1ad0(int, int);
extern int far far_b1ae0(int);
extern long far far_b3b12(int, int, int);

long far fn_c81e2(int arg_0)
{
    int ax;
    long t1;

    far_b1ad0(2, 34);
    t1 = far_b3b12(arg_0, 5, 0);
    return ((long)UNDEF << 16 | (unsigned)far_b1ae0(75));
}
