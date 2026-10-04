#include "mpc2k.h"

void __near __pascal lcd_clear_display(struct SND __far *s)
{
	long len;
	int r;

	len = *(long *)&REC_LENGTH;
	if (G_REC_MODE == REC_MODE_STEREO) len <<= 1;
	r = smem_alloc(len);
	sample_desc_init(s);
	((void (__far __pascal *)(struct SND __far *))timer_fdc_sync)(s);
	s->pool_idx = r;
	s->stereo = G_REC_MODE == 2 ? 1 : 0;
	s->start = (unsigned)REC_PREREC_LEN;
	s->end = *(long *)&REC_LENGTH;
	s->length = *(long *)&REC_LENGTH;
}

void __far L_07300(void)
{
	if (G_SAMPLE_MODE == SAMPLE_ST_ARMED) {
		if (X_03B24(REC_TRIG_PEAK) >= SAMPLE_THRESHOLD) {
			fn_0704C();
			return;
		}
		REC_TRIG_PEAK = 0;
	}
}
