#include "mpc2k.h"

void __far __pascal seq_init_navigation(long p0)
{
	X_07C12();
	PTR_SEQ_LIST_HEAD = far_078E4();
	seq_common_handler(p0);
}
