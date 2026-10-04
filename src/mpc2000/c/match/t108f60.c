int __far int2F_call_fn6(char __far *, int);
long __near __pascal sample_block_copy(int);
long __far __pascal sample_create(int);
extern int G_ERRNO;

long __near midi_active_sense(void)
{
	unsigned char h[2];

	if (int2F_call_fn6(h, 2) == 2 && h[0] == 1) {
		switch (h[1]) {
		default:
			G_ERRNO = 6;
			break;
		case 0: case 1:
			return sample_create(h[1]);
		case 2: case 4:
			return sample_block_copy(h[1]);
		case 3:
			G_ERRNO = 7;
			break;
		}
	} else
		G_ERRNO = 4;
	return 0;
}
