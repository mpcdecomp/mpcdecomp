#include "mpc2k.h"

int __far __pascal midi_out_io2(int x)
{
	int i;

	for (i = -120; i < 60; i++)
		if (P_0708[i + 120] <= x && P_0708[i + 121] > x)
			return i;
	return 0;
}
