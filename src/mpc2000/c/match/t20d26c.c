#include "mpc2k.h"

#pragma intrinsic(strcmp, strcpy)

struct snd { char name[0x13]; char term; char pad[0x1c]; int cache_lo; char pad2[4]; };
struct pool { long base; long len; int x; };

void __far __fastcall __loadds sample_process_large(void)
{
	struct snd s;
	char jb[18];
	struct snd far *p;
	long len;

	if (sample_ptr_access(TBL_SOUND_NAMES) || sample_ptr_access(P_8FCD)
	    || !strcmp(TBL_SOUND_NAMES, P_8FCD)) {
		G_ERRNO = ERR_NAME_IN_USE;
		err_msg_report();
		return;
	}
	disp_list_run(PTR_DL_PROCESSING);
	if (_setjmp(jb)) {
		err_msg_report();
	} else {
		s = *(*(struct snd __far **)&SND_CURRENT);
		s.term = 0;
		len = ((struct pool *)SMEM_POOL)[(*(struct snd __far **)&SND_CURRENT)->cache_lo].len / 2;
		if (!mem_io_handler(&s.cache_lo, len, 0))
			_longjmp(jb, G_ERRNO);
		smem_copy_buffered(((struct pool *)SMEM_POOL)[(*(struct snd __far **)&SND_CURRENT)->cache_lo].base + len,
			((struct pool *)SMEM_POOL)[s.cache_lo].base, len);
		strcpy(s.name, P_8FCD);
		if (!(p = ((struct snd __far * (__far __pascal *)(struct snd))sample_pool_add)(s))) {
			smem_free(s.cache_lo);
			G_ERRNO = ERR_SOUND_DIR_FULL;
			_longjmp(jb, G_ERRNO);
		}
		if (!mem_io_handler(&s.cache_lo, len, 0))
			_longjmp(jb, G_ERRNO);
		smem_copy_buffered(((struct pool *)SMEM_POOL)[(*(struct snd __far **)&SND_CURRENT)->cache_lo].base,
			((struct pool *)SMEM_POOL)[s.cache_lo].base, len);
		strcpy(s.name, TBL_SOUND_NAMES);
		if (!(p = ((struct snd __far * (__far __pascal *)(struct snd))sample_pool_add)(s))) {
			smem_free(s.cache_lo);
			G_ERRNO = ERR_SOUND_DIR_FULL;
			_longjmp(jb, G_ERRNO);
		}
		((void (__far __pascal *)(struct snd __far *))voice_buffer_init)((*(struct snd __far **)&SND_CURRENT) = p);
	}
	disp_list_run(TBL_WINKEYS_0455B);
	snd_edit_page_return();
}
