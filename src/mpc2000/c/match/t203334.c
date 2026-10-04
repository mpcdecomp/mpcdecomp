#include "mpc2k.h"

void __far __fastcall __loadds name_edit_commit(void)
{
	char __far *p;

	p = &BUF_NAME_EDIT_LAST;
	while (*p == ' ') p--;
	if (p < BUF_NAME_EDIT)
		_fstrncpy(BUF_NAME_EDIT, WIN_FIELD_VAR, 16);
	else {
		do
			if (*p == ' ') *p = '_';
		while (p-- != BUF_NAME_EDIT);
		_fstrncpy(WIN_FIELD_VAR, BUF_NAME_EDIT, 16);
	}
	G_FLAG_8CA8 = 0;
	(*(void (__far **)(void))&NAME_EDIT_CHANGE_FN)();
}
