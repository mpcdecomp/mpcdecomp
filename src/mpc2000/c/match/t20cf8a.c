#include "mpc2k.h"

#pragma intrinsic(strcpy)

struct snd { char name[0x13]; char term; char pad[8]; long range; char pad1[0x10]; int cache_lo; char pad2[4]; };
struct pool { long base; long len; int x; };

void __far __fastcall __loadds sample_string_access(void)
{
	struct snd s;
	char jb[18];
	struct snd far *p;
	long len;

	if (sample_ptr_access(TBL_SOUND_NAMES)) {
		G_ERRNO = ERR_NAME_IN_USE;
		err_msg_report();
		return;
	}
	disp_list_run(PTR_DL_PROCESSING);
	if (_setjmp(jb)) {
		err_msg_report();
	} else {
		s = *(*(struct snd __far **)&SND_CURRENT);
		s.term = 1;
		len = ((struct pool *)SMEM_POOL)[(*(struct snd __far **)&SND_CURRENT)->cache_lo].len;
		if (!mem_io_handler(&s.cache_lo, len * 2, 0))
			_longjmp(jb, G_ERRNO);
		smem_copy_buffered(((struct pool *)SMEM_POOL)[(*(struct snd __far **)&SND_CURRENT)->cache_lo].base,
			((struct pool *)SMEM_POOL)[s.cache_lo].base, len);
		smem_copy_buffered(((struct pool *)SMEM_POOL)[((struct snd __far *)FP_SND_SECONDARY)->cache_lo].base,
			((struct pool *)SMEM_POOL)[s.cache_lo].base + len, len);
		if (((struct snd __far *)FP_SND_SECONDARY)->range < len)
			smem_fill(((struct pool *)SMEM_POOL)[s.cache_lo].base + ((struct snd __far *)FP_SND_SECONDARY)->range + len, 0, len - ((struct snd __far *)FP_SND_SECONDARY)->range);
		strcpy(s.name, TBL_SOUND_NAMES);
		if (!(p = ((struct snd __far * (__far __pascal *)(struct snd))sample_pool_add)(s))) {
			smem_free(s.cache_lo);
			G_ERRNO = ERR_SOUND_DIR_FULL;
			_longjmp(jb, G_ERRNO);
		}
		((void (__far __pascal *)(struct snd __far *))voice_buffer_init)((*(struct snd __far **)&SND_CURRENT) = p);
	}
	disp_list_run(P_44CD);
	snd_edit_page_return();
}
