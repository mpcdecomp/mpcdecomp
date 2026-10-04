void * __cdecl memset(void *, int, unsigned);
#pragma intrinsic(memset)
struct name { char s[17]; };
extern int G_ERRNO;
extern char P_8D44[512];
extern char PTR_MIDI_STATE[30];
extern struct name TBL_SOUND_NAMES[128];
int __far int2F_call_fn6(char __far *, int);
void __far int2F_dispatch_10(void);
void __far err_msg_report(void);
void __far sample_data_load_1(void);
int __far X_08A86(void);
int __far X_08B84(void);
int __far smem_init_handler(void);

int __far midi_realtime_stop2(int a, int b, long sig)
{
	unsigned char h[2];
	int i;

	G_ERRNO = 4;
	memset(PTR_MIDI_STATE, 0, 0x1e);
	memset(P_8D44, 0, 0x200);
	for (i = 0; i < 0x80; i++) TBL_SOUND_NAMES[i].s[0] = 0;
	if (int2F_call_fn6(h, 2) == 2 && h[0] == 10) {
		sample_data_load_1();
		switch (h[1]) {
		default:
			G_ERRNO = 6;
			break;
		case 0:
			if (sig == 0xbd93) return X_08B84();
			break;
		case 1:
			return X_08A86();
		case 4:
			return smem_init_handler();
		}
	}
	int2F_dispatch_10();
	err_msg_report();
	return 0;
}
