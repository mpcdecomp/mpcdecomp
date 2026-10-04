#include "mpc2k.h"

#define VAR (*(struct SND __far * __far *)WIN_FIELD_VAR)

void __far __fastcall __loadds X_036F0(void)
{
	if (!far_078E4()) return;
	if (!VAR)
		VAR = (struct SND __far *)far_078E4();
	else {
		if (!VAR->next->next) return;
		VAR = VAR->next;
	}
	WIN.change();
}
