#include "mpc2krec.h"

void * __cdecl memset(void *, int, unsigned);
#pragma intrinsic(memset)
struct SMEM_POOL {
	long base;
	long len;
	int next;
};
struct peak { int neg, pos; };
extern struct SMEM_POOL SMEM_POOL[131];
extern int G_WAVE_VALID;
extern int G_WAVE_COLS_DONE;
extern long G_WAVE_SMEM_START;
extern long G_WAVE_SMEM_END;
extern struct peak TBL_WAVE_NEG_PEAK[245];
extern int BUF_XFER[245];
extern char SND_EDIT_VIEW;
void __far __pascal smem_dma_copy(long, int __far *, int, int);
void __far __pascal voice_buf_helper_1(int);
void __far __pascal voice_buf_helper_2(int);

/* the waveform view's peaks: 245 columns of the sound's samples */
void __far __pascal voice_buffer_init(struct SND __far *s)
{
	int i;
	int *p;

	voice_buf_helper_1(0x10);
	memset(&G_WAVE_VALID, 0, 0x3e0);
	if (s && s->length) {
		G_WAVE_SMEM_START = SMEM_POOL[s->pool_idx].base;
		if (s->stereo && SND_EDIT_VIEW)
			G_WAVE_SMEM_START += SMEM_POOL[s->pool_idx].len / 2;
		G_WAVE_SMEM_END = s->length + G_WAVE_SMEM_START;
		if (!(s->length / 0xf5)) {
			p = BUF_XFER;
			smem_dma_copy(G_WAVE_SMEM_START, p, 0xf5, (int)((s->length << 12) / 0xf5));
			for (i = 0; i < 0xf5; i++) {
				TBL_WAVE_NEG_PEAK[i].pos = 0;
				TBL_WAVE_NEG_PEAK[i].neg = 0;
				if (p[i] >= 0)
					TBL_WAVE_NEG_PEAK[i].pos = p[i];
				else
					TBL_WAVE_NEG_PEAK[i].neg = p[i];
			}
			G_WAVE_COLS_DONE = 0xf5;
		}
		G_WAVE_VALID = 1;
	}
	voice_buf_helper_2(0x10);
}
