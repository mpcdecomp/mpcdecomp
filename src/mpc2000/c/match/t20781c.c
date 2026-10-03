#include "mpc2k.h"

int __far __pascal fdc_port_90_access(char far *a, char far *b)
{
	return _fstricmp(a, b);
}
