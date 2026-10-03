#include "mpc2k.h"

void __far __pascal voice_release_all_if(long p0)
{
	if (!p0) goto br_02A8E;
	voice_release_all();
br_02A8E:
	;
}
