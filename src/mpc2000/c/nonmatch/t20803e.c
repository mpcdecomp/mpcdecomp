/* differs: 150 size 476, image 458; +1 image `enter 0x14, 0` CL `enter 0x16, 0`; 172 size 476, image 458; +1 image `enter 0x14, 0` CL `enter 0x16, 0` */
#pragma pack(1)
struct pool { long base; long len; int next; };
struct snd {
	char name[0x13];
	char stereo;
	long start;
	long end;
	long length;
	char pad[0x10];
	int pool;
};
#pragma pack()

extern struct snd far *SND_CURRENT;
extern struct pool SMEM_POOL[64];
extern int G_WAVE_ZOOM;
extern char SND_EDIT_VIEW;
extern int BUF_XFER[64];
extern char P_30FC[1], P_4CE6[1];
void __far __pascal disp_list_run(char far *);
void __far __pascal cmd_caller_setup(int, int, char far *);
void __far __pascal cmd_exec_0E_wrapper(int);
void __far __pascal smem_read_words(long, int far *, int);
void __far __pascal cmd_dispatch_0E(int, int, int);

void __far __pascal cmd_write_caller(long v)
{
	int zoom;
	int step;
	unsigned col;
	int hi;
	unsigned x;
	unsigned end;
	long pos;
	int max, min;
	int n;
	int far *p;

	disp_list_run(P_30FC);
	cmd_caller_setup(0x4c, 0x0c, P_4CE6);
	cmd_exec_0E_wrapper(1);
	if (SND_CURRENT && SND_CURRENT->length) {
		zoom = G_WAVE_ZOOM;
		if (v - zoom * 0x37 < 0) {
			pos = 0;
			col = 0x37 - v / zoom;
		} else {
			pos = v - zoom * 0x37;
			col = 0;
		}
		if (v + zoom * 0x37 > SND_CURRENT->length)
			end = (SND_CURRENT->length - v) / zoom + 0x37;
		else
			end = 0x6e;
		step = zoom;
		pos += SMEM_POOL[SND_CURRENT->pool].base;
		if (SND_CURRENT->stereo && SND_EDIT_VIEW)
			pos += SMEM_POOL[SND_CURRENT->pool].len / 2;
		for (x = col; x < end; x++) {
			smem_read_words(pos, BUF_XFER, step);
			pos += step;
			max = min = 0;
			p = BUF_XFER;
			for (n = 0, p = BUF_XFER; n < step; n++, p++) {
				if (max < *p)
					max = *p;
				else if (min > *p)
					min = *p;
			}
			hi = max / 0x97b;
			if (min /= 0x97b)
				min--;
			cmd_dispatch_0E(x + 0x17, 0x1d - hi, hi - min);
		}
	}
	cmd_exec_0E_wrapper(0);
}
