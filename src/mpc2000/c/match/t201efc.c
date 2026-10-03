#include "mpc2k.h"

void __far __pascal note_off_voices(int note)
{
	unsigned i;

	if ((unsigned)(note - 0x23) <= 0x3f)
		for (i = 0; i < 0x20; i++)
			if (VOICE_TIMER[i] && (unsigned char)VOICE_TABLE[i * 0x12] == note && VOICE_TABLE[i * 0x12 + 1] == 2) {
				if (VOICE_TABLE[i * 0x12 + 3] && !VOICE_TABLE[i * 0x12 + 2]) {
					if (VOICE_TIMER[i - 0x20] == -1) {
						VOICE_TIMER[i] = *(int *)(VOICE_TABLE + i * 0x12 + 8);
						VOICE_TIMER[i - 0x20] = 1;
					}
				} else
					voice_release(i);
			}
}
