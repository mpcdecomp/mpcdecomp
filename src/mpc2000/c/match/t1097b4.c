#include "mpc2k.h"

void __near __pascal status_poll_delay(long p1, int p0)
{
	if (((int (__far *)(long, int))int2F_call_fn6)(p1, p0) == p0) goto br_0975C;
#if FW_VERSION == 172
	_longjmp(P_8F62, ERR_FILE_DAMAGED);
#else
	_longjmp(P_8F62, ERR_DISK_READ);
#endif
br_0975C:
	;
}
