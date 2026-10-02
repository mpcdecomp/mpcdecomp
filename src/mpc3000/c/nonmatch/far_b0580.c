/* differs: 308 absent; 311 at +3, 15 bytes; 312 at +3, 15 bytes */
#define UNDEF 0
extern int far far_fb63e(void);

long far far_b0580(void)
{
    return ((long)UNDEF << 16 | (unsigned)far_fb63e());
}
