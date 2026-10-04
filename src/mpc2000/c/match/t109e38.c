#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
extern char far *PTR_SEQ_LIST_HEAD;

void __near __pascal seq_common_handler(int far *out)
{
	char far *p;
	long n;

	p = 0;
	n = 0;
	if (PTR_SEQ_LIST_HEAD) {
		p = PTR_SEQ_LIST_HEAD;
		n = (long)(p[0x13] ? 4 : 2) * *(long far *)(p + 0x1c) + 0x28;
	}
	out[0] = FP_SEG(p);
	out[3] = FP_OFF(p);
	out[7] = (int)(n >> 16);
	out[9] = (int)n;
}
