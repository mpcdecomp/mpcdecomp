/* differs: 308 at +0, 89 bytes; 311 at +0, 89 bytes; 312 at +0, 89 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

int far far_ead2e(void)
{
    *(int far *)MK_FP(0x90cb /* SEG_9167 */, 0x44c) = -1;
    *(int far *)MK_FP(0x910f /* SEG_91A6 */, 0x390) = -1;
    *(int far *)MK_FP(0x9148 /* SEG_91D8 */, 0x76c) = -1;
    *(int far *)MK_FP(0x91be /* SEG_9248 */, 0x6b0) = -1;
    *(int far *)MK_FP(0x9229 /* SEG_92AC */, 0x44c) = -1;
    *(int far *)MK_FP(0x926d /* SEG_92EB */, 0x458) = -1;
    *(int far *)MK_FP(0x92b2 /* SEG_9329 */, 0x454) = -1;
    *(int far *)MK_FP(0x92f7 /* SEG_9368 */, 0x3ee8) = -1;
    return 0x92f7 /* SEG_9368 */;
}
