extern char REC_CURSOR;
extern unsigned char REC_INPUT_X;
extern char REC_INPUT_Y;
extern unsigned char REC_MODE_X;
extern char REC_MODE_Y;
extern unsigned char B_2E3A;
extern char B_2E3B;
extern char REC_THRESH_X;
extern char REC_THRESH_Y;
extern unsigned char REC_TIME_X;
extern char SAMPLE_INPUT;
extern char G_REC_MODE;
extern char SAMPLE_MONITOR;
extern char SAMPLE_THRESHOLD;
extern unsigned SAMPLE_TIME;
extern unsigned char SAMPLE_PREREC;
extern unsigned char B_2E40;
extern char B_2E41;
extern char REC_TIME_Y;
void __far L_07386(void);
void __far L_07398(void);
void __far L_073A8(void);
void __far L_03808(void);
int __near fn_0683A(void);
void __far __pascal voice_trigger_full(void __far *, int, char, char, int, void (__far *)(void));
void __far __pascal field_register_s8(void __far *, int, int, int, char, char, long, long);
void __far __pascal status_read_6A(void __far *, int, int, char, char, char, void (__far *)(void), long);
void __far __pascal status_read_6A_3(void __far *, int, int, char, char, char, long, long);

void __near rec_arm_field(void)
{
	switch (REC_CURSOR) { case 0: goto X_0746C; case 1: goto X_073D6; case 2: goto X_073F0; case 3: goto X_07408; case 4: goto X_07428; case 5: goto L_0744C; default: goto X_073CE; }
X_073CE:
	REC_CURSOR = 0;
	goto X_0746C;
X_073D6:
	voice_trigger_full(&G_REC_MODE, 2, REC_MODE_X, REC_MODE_Y, 7, L_07398);
	return;
X_073F0:
	voice_trigger_full(&SAMPLE_MONITOR, 1, B_2E3A, B_2E3B, 4, L_073A8);
	return;
X_07408:
	field_register_s8(&SAMPLE_THRESHOLD, -0x40, 0, 2, REC_THRESH_X, REC_THRESH_Y, 0L, 0L);
	return;
X_07428:
	status_read_6A(&SAMPLE_TIME, 0, fn_0683A(), 4, REC_TIME_X, REC_TIME_Y, L_03808, 0L);
	return;
L_0744C:
	status_read_6A_3(&SAMPLE_PREREC, 0, 100, 3, B_2E40, B_2E41, 0L, 0L);
	return;
X_0746C:
	voice_trigger_full(&SAMPLE_INPUT, 1, REC_INPUT_X, REC_INPUT_Y, 8, L_07386);
}
