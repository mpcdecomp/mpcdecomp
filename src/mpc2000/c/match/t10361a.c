#include "mpc2k.h"

void __far __fstrncpy(char far *, long, int);

void __far __pascal far_call_wrapper_1(long p2, char p1, char p0)
{
	((void (__near __pascal *)(char, char, int, void (__far *)(void), long))mpc_query_status)(p1, p0, 0x10, X_03432, 0L);
	(*(long *)&WIN_FIELD_VAR) = p2;
	__fstrncpy(BUF_NAME_EDIT, (*(long *)&WIN_FIELD_VAR), 0x10);
	B_8CDA = 0;
	NAME_EDIT_CASE = 0;
	NAME_EDIT_LAST_PAD = 0xff;
	(*(char __far **)&NAME_EDIT_CHANGE_FN) = win_key_nop_stub;
	win_keys_merge(P_0CE2);
}
