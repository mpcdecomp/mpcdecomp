#include "mpc2krec.h"

extern struct SND __far *PTR_SAMPLE_BUF;
int __far __pascal sample_ptr_helper(struct SND __far *);
void __far __pascal smem_free(int);
void __far smem_compact(void);

void __far __pascal sample_validate_ptr(struct SND __far *s)
{
	if (sample_ptr_helper(s)) {
		if ((unsigned)s->pool_idx < SMEM_POOL_COUNT) smem_free(s->pool_idx);
		s->prev->next = s->next;
		s->next->prev = s->prev;
		s->next = PTR_SAMPLE_BUF;
		PTR_SAMPLE_BUF = s;
		smem_compact();
	}
}
