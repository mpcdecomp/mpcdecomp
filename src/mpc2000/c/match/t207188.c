#include "mpc2krec.h"
extern struct SND __far *PTR_SAMPLE_BUF;
extern struct SND __far *PTR_SAMPLE_DATA;

/* s takes the head sentinel's place; the sentinel moves to a node off the free list */
struct SND __far * __far __pascal sample_pool_add(struct SND s)
{
	struct SND __far *p;

	if (PTR_SAMPLE_BUF) {
		p = PTR_SAMPLE_DATA->next;
		*PTR_SAMPLE_DATA = s;
		PTR_SAMPLE_DATA->next = p;
		p = PTR_SAMPLE_BUF;
		PTR_SAMPLE_BUF = p->next;
		p->next = PTR_SAMPLE_DATA;
		p->prev = 0;
		PTR_SAMPLE_DATA->prev = p;
		PTR_SAMPLE_DATA = p;
		PTR_SAMPLE_DATA->name[0] = 0;
		PTR_SAMPLE_DATA->length = 0;
		return PTR_SAMPLE_DATA->next;
	}
	return 0;
}
