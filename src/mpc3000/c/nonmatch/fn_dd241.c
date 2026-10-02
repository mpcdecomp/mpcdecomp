/* differs: 308 at +3, 6 bytes; 311 at +3, 6 bytes; 312 at +3, 6 bytes */
extern long far far_dd212(void);
long far far_dd212(void) { return 0; }

long far fn_dd241(void)
{
    return far_dd212();
}
