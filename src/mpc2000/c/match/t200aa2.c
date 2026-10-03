
/* the clamp: the last entry on v1.50, the count on v1.72 */
#include "mpc2k.h"

#if FW_VERSION == 172
#define ERR_MSG_COUNT 0x14
#define ERR_MSG_CLAMP ERR_MSG_COUNT
#else
#define ERR_MSG_LAST 0x13
#define ERR_MSG_CLAMP ERR_MSG_LAST
#endif

void __far err_msg_report(void)
{
	if (G_ERRNO <= ERR_MSG_CLAMP) goto br_00ABD;
	G_ERRNO = ERR_MSG_CLAMP;
br_00ABD:
	((void (__far __pascal *)(long))string_fill_stosb)(((long *)ERR_MSG_TABLE)[G_ERRNO]);
}
