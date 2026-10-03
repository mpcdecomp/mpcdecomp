/* differs: 150 +B image `je +34` CL `jne +1E`; 172 +B image `je +34` CL `jne +1E` */
extern char G_SAMPLE_MODE;
extern char P_9D40;
extern char REC_CURSOR;
extern unsigned char SAMPLE_THRESHOLD;
extern unsigned SAMPLE_TIME;
extern char STR_TIME_TOO_SHORT[1];
void __far far_067A6(void);
void __near fn_07030(void);
void __near fn_0704C(void);
int __near io_near_stub(void);
void __near rec_arm_field(void);
void __far __pascal string_fill_stosb(char far *);

void __far __fastcall __loadds L_0733E(void)
{
	if (!SAMPLE_TIME) goto br_07372;
	if (!P_9D40) goto br_0736A;
	G_SAMPLE_MODE = 1;
	io_near_stub();
	if (SAMPLE_THRESHOLD >= 0xc1) goto L_07383;
	fn_07030();
	fn_0704C();
	return;
br_0736A:
	far_067A6();
	goto L_07380;
br_07372:
	string_fill_stosb(STR_TIME_TOO_SHORT);
	REC_CURSOR = 4;
L_07380:
	rec_arm_field();
L_07383:
	;
}
