#include "mpc2k.h"

void __far __fastcall __loadds sample_voice_init(void)
{
	char far *ref;

	((void (__far __pascal *)(char __far *))voice_release_all_if)((*(char __far **)&SND_CURRENT));
	disp_list_run(PTR_DL_PROCESSING);
	ref = *(char far * far *)((*(char __far **)&SND_CURRENT) + 40);
	((void (__far __pascal *)(char __far *))smem_proc_wrapper)((*(char __far **)&SND_CURRENT));
	((void (__far __pascal *)(char __far *))sample_validate_ptr)((*(char __far **)&SND_CURRENT));
	if (((int (__far __pascal *)(char __far *))sample_ptr_helper)(ref))
		(*(char __far **)&SND_CURRENT) = ref;
	else
		(*(char __far **)&SND_CURRENT) = ((char __far * (__far *)(void))far_078E4)();
	voice_buffer_init((*(char __far **)&SND_CURRENT));
	disp_list_run(P_31EB);
	snd_edit_page_return();
}
