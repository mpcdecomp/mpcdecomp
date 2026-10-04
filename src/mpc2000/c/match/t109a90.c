#include "mpc2k.h"

struct s54 { char b[54]; };
#pragma intrinsic(strcpy)

char far * __near __pascal voice_play_request(char far *p4, char far *p2, long p0)
{
	char l54[54];

	((long (__far __pascal *)(char __far *))sample_desc_init)(l54);
	strcpy(l54, p4);
	l54[19] = p2[2] - 1;
	*(long *)(l54 + 28) = p0 / (unsigned long)(unsigned)*(int far *)(p2 + 12);
	*(long *)(l54 + 24) = *(long *)(l54 + 28);
	*(int *)(l54 + 38) = *(int far *)(p2 + 4);
	l54[18] = ((char (__far __pascal *)(int, int))midi_out_io)(*(int far *)(p2 + 6), *(int far *)(p2 + 4));
	return ((long (__far __pascal *)(struct s54))sample_pool_add)(*(struct s54 *)l54);
}
