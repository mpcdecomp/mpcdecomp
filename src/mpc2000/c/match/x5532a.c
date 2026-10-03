extern long C0_W_0D7C2;
extern char EP_MSG_SOUND_DIR_FULL_OFF[1];
extern char EP_MSG_SOUND_DIR_FULL_SEG[1];
void __far disp_alert_wait_key(char __near *, char __near *);
int __far sound_record_alloc(char far *);

void __far __fastcall __loadds snd_debug_create(void)
{
	char l4[4];

	switch (sound_record_alloc(l4)) { case 0: goto br_55356; }
	C0_W_0D7C2 = *(long *)l4;
	return (int)C0_W_0D7C2;
br_55356:
	return disp_alert_wait_key(EP_MSG_SOUND_DIR_FULL_OFF, EP_MSG_SOUND_DIR_FULL_SEG);
}
