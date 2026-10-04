#include "mpc2k.h"

void __far __fastcall __loadds snd_edit_page_return(void)
{
	switch (sample_load_wrapper((*(long *)&SND_CURRENT))) { case 0: goto br_0885F; }
	switch (G_SND_EDIT_PAGE) { case 1: goto br_0884A; case 2: goto br_08852; case 3: goto L_0885A; }
	trim_screen_enter();
	return;
br_0884A:
	fit_to_length_cancel();
	return;
br_08852:
	zone_screen_enter();
	return;
L_0885A:
	snd_params_screen_enter();
br_0885F:
	;
}
