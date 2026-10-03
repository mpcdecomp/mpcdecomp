#include "mpc2k.h"

void __far timer_str_handler(void)
{
	char l1;
	char l2;

	if (B_8D43 <= 7) goto br_071FA;
	B_8D43 = 0;
br_071FA:
	l1 = TBL_CHANSET_FIELD_X[B_8D43 + B_8D43];
	l2 = TBL_CHANSET_FIELD_Y[B_8D43 + B_8D43];
	switch (B_8D43) { case 0: goto X_07230; case 1: goto X_0724A; case 2: goto X_07282; case 3: goto X_072BE; case 4: goto X_072F2; case 5: goto X_07324; case 6: goto X_0735A; case 7: goto X_07388; default: goto X_073C1; }
X_07230:
	((void (__far __pascal *)(char __far *, char, char, int))timer_value_read_1)(((char *)&G_PAD_NOTE_BASE), l1, l2, 0);
	(*(unsigned char *)&WIN_FIELD_BOX_W) += 0x66;
	return;
X_0724A:
	((char *)&G_EDIT_FIELD_VAL)[0] = *note_clamp_flag((unsigned char)((char *)&G_PAD_NOTE_BASE)[0]);
	((void (__far __pascal *)(char __far *, int, int, int, char, char, long, void (__far *)(void)))status_read_6A_3)(((char *)&G_EDIT_FIELD_VAL), 0, 0x64, 3, l1, l2, 0L, L_070FA);
	return;
X_07282:
	((char *)&G_EDIT_FIELD_VAL)[0] = note_clamp_flag((unsigned char)((char *)&G_PAD_NOTE_BASE)[0])[1] - 0x32;
	((void (__far __pascal *)(char __far *, int, int, int, char, char, int, int))field_register_s8)(((char *)&G_EDIT_FIELD_VAL), -0x32, 0x32, 2, l1, l2, 0, 0, mix_pan_store);
	return;
X_072BE:
	((char *)&G_EDIT_FIELD_VAL)[0] = note_range_clamp((unsigned char)((char *)&G_PAD_NOTE_BASE)[0])[2];
	((void (__far __pascal *)(char __far *, int, int, int, char, char, long, void (__far *)(void)))status_read_6A_3)(((char *)&G_EDIT_FIELD_VAL), 0, 0x64, 3, l1, l2, 0L, L_07136);
	return;
X_072F2:
	((char *)&G_EDIT_FIELD_VAL)[0] = note_range_clamp((unsigned char)((char *)&G_PAD_NOTE_BASE)[0])[3] & 7;
	((void (__far __pascal *)(char __far *, int, char, char, int, void (__far *)(void)))voice_trigger_full)(((char *)&G_EDIT_FIELD_VAL), 8, l1, l2, 4, L_07154);
	goto X_073C1;
X_07324:
	((char *)&G_EDIT_FIELD_VAL)[0] = note_range_clamp((unsigned char)((char *)&G_PAD_NOTE_BASE)[0])[4];
	((void (__far __pascal *)(char __far *, int, int, int, char, char, long, void (__far *)(void)))status_read_6A_3)(((char *)&G_EDIT_FIELD_VAL), 0, 0x64, 3, l1, l2, 0L, L_071AE);
	return;
X_0735A:
	((char *)&G_EDIT_FIELD_VAL)[0] = note_range_clamp((unsigned char)((char *)&G_PAD_NOTE_BASE)[0])[5];
	((void (__far __pascal *)(char __far *, int, char, char, int, void (__far *)(void)))voice_trigger_full)(((char *)&G_EDIT_FIELD_VAL), 4, l1, l2, 3, L_071CC);
	goto X_073C1;
X_07388:
	((char *)&G_EDIT_FIELD_VAL)[0] = (char)(note_range_clamp((unsigned char)((char *)&G_PAD_NOTE_BASE)[0])[3] & 0x80 ? 1 : 0);
	((void (__far __pascal *)(char __far *, int, char, char, int, void (__far *)(void)))voice_trigger_full)(((char *)&G_EDIT_FIELD_VAL), 1, l1, l2, 4, timer_poll_wait_5);
X_073C1:
	;
}
