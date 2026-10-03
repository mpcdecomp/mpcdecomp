/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
#include <conio.h>

int __far far_49070(void)
{
	return inp(0xc002) & 0x80 ? 0 : 1;
}
