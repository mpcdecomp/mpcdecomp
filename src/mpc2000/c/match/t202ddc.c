#include "mpc2k.h"

long __far __pascal field_value_store(long v)
{
	switch ((unsigned char)WIN_FIELD_MODE) {
	case 0:
		if (*WIN_FIELD_VAR == (char)v) return;
		*WIN_FIELD_VAR = (char)v;
		break;
	case 1:
		if (*WIN_FIELD_VAR == (char)v) return;
		*WIN_FIELD_VAR = (char)v;
		break;
	case 2:
		if (*(int __far *)WIN_FIELD_VAR == (int)v) return;
		*(int __far *)WIN_FIELD_VAR = (int)v;
		break;
	case 3:
		if (*(int __far *)WIN_FIELD_VAR == (int)v) return;
		*(int __far *)WIN_FIELD_VAR = (int)v;
		break;
	case 4:
		if (*(long __far *)WIN_FIELD_VAR == v) return;
		*(long __far *)WIN_FIELD_VAR = v;
		break;
	default:
		return;
	}
	((void (__far *)(void))WIN_FIELD_CHANGE_FN)();
}
