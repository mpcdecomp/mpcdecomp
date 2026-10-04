#include "mpc2krec.h"
extern struct SND __far *PTR_SAMPLE_BUF;
extern struct SND __far *PTR_SAMPLE_DATA;
extern struct SND __far *PTR_DMA_STATE;
int __far __pascal sample_check_active(struct SND __far *);
void __far __pascal smem_proc_wrapper(struct SND __far *);
void __far __pascal smem_free(int);

void __far sample_delete_flagged(void)
{
	struct SND __far *p;
	struct SND __far *q;

	for (p = PTR_SAMPLE_DATA->next; p != PTR_DMA_STATE; p = p->next) {
		q = p->prev;
		if (sample_check_active(p)) {
			smem_proc_wrapper(p);
			if ((unsigned)p->pool_idx < SMEM_POOL_COUNT) smem_free(p->pool_idx);
			p->prev->next = p->next;
			p->next->prev = p->prev;
			p->next = PTR_SAMPLE_BUF;
			PTR_SAMPLE_BUF = p;
			p = q;
		}
	}
}
