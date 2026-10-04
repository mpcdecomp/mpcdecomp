#include "mpc2k.h"

int __far sample_ptr_caller(char __far *name)
{
	char __far *t;
	char __far *s;

	int2F_dispatch_10();
	s = (char __far *)sample_ptr_access(name);
	t = (char __far *)sample_name_lookup((long)name);
	if (!t) {
		err_msg_report();
		return 0;
	}
	if (s == t) {
		string_fill_stosb((char *)STR_NAME_IN_USE);
		return 0;
	}
	ui_enter_pad_assign((long)t);
	return 1;
}
