/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern long C2_W_PARAM_HOOK_OFF;
void __far __fastcall __loadds pad_audition_note_off(void);
void __far pad_route_mode_set(int);

void __far __fastcall __loadds pgm_assign_refresh(void)
{
	pad_audition_note_off();
	C2_W_PARAM_HOOK_OFF = 0L;
	pad_route_mode_set(0);
}
