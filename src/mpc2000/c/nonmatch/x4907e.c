/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
#include <conio.h>
void __far far_3EE74(void);

int __far far_4907E(void)
{
	outp(0xc002, 7);
	far_3EE74();
	outp(0xc002, 5);
	return 5;
}
