/* differs: 150 size 106, image 102; +A image `jge +26` CL `jl +4E`; 172 size 106, image 102; +A image `jge +26` CL `jl +4E` */
#include <conio.h>
extern char P_9A7A[1];
extern char P_9A7C[1];
extern char P_9A7E[1];
void __far __pascal voice_release(int);
void __far __pascal voice_release_full(int);

int __far __pascal voice_timer_expire(int p0)
{
	int ax_;

	if (p0 >= 0x20) goto br_02174;
	outpw(0x80, p0 | 0x400);
	outpw(0x82, *(int *)(P_9A7A + p0 * 18));
	ax_ = -0x8000;
dma_0216D:
	outpw(0x84, ax_);
	return ax_;
br_02174:
	if (p0 < 0x40) {
		return voice_release(p0 - 0x20);
	}
	if (p0 >= 0x60) goto br_021A6;
	p0 -= 0x40;
	outpw(0x80, p0 | 0x600);
	outpw(0x82, *(int *)(P_9A7C + p0 * 18));
	ax_ = *(int *)(P_9A7E + p0 * 18);
	goto dma_0216D;
br_021A6:
	return voice_release_full(p0 - 0x60);
}
