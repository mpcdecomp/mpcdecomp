/* differs: 150 size 40, image 50; +0 image `cmp byte ptr [0x9aec], 1` CL `push si`; 172 size 40, image 50; +0 image `cmp byte ptr [0x9d2e], 1` CL `push si` */
extern char G_SAMPLE_MODE;
extern int REC_TRIG_PEAK;
extern char SAMPLE_THRESHOLD;
int __far __fastcall X_03B24(int);
void __near fn_0704C(void);

void __far L_07300(void)
{
	int v0;

	if (G_SAMPLE_MODE != 1) goto L_07324_1;
	v0 = X_03B24(REC_TRIG_PEAK);
	if (v0 >= SAMPLE_THRESHOLD) {
		fn_0704C();
		return;
	}
	REC_TRIG_PEAK = 0;
L_07324_1:
	;
}
