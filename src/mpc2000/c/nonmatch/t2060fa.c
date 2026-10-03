/* differs: 150 +1E image `jne +2A` CL `jne +34`; 172 +1E image `jne +2A` CL `jne +34` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char PGM_SLOT;
extern unsigned char PGM_TABLE[1];
extern long __far __fastcall __loadds program_close(void);
extern void __far __pascal program_select(int);
extern long __far __pascal program_select_wrapper(int);
extern void __far __pascal smem_dma_init(int);

void __far __fastcall __loadds delete_pgm_do_it(void)
{
    int di;
    int p8;
    char far *__near *si;
    int t1;
    long t2;
    int t3;
    long t4;

    smem_dma_init(PGM_SLOT);
    di = 0;
    si = (char far *__near *)PGM_TABLE;
    while (*(int far *)(*si) == 2) {
        si = si + 1;
        di = di + 1;
        if (di < 24) {
            continue;
        }
        goto L1;
    }
    p8 = di;
    goto L2;
L1:
    t2 = program_select_wrapper(0);
    p8 = 0;
L2:
    program_select(p8);
    t4 = program_close();
    return;
}
