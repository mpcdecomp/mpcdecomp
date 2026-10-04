/* differs: XL v1.20 +9, 44 bytes */
extern int C0_W_08DC4;
extern int C0_W_08DC6;
void __near fn_3D91E(void);
void __near fn_3D96E(void);
void __near fn_3DA24(void);
void __near fn_3DA32(void);
void __far voice_release_all(void);

int __near fn_3D8E2(void)
{
	int si_;

	si_ = C0_W_08DC4;
	if (si_ == C0_W_08DC6) goto br_3D91A;
	voice_release_all();
	C0_W_08DC6 = si_;
	switch (si_) { case 1: goto br_3D906; case 2: goto br_3D90C; case 3: goto br_3D912; }
	fn_3D91E();
	goto br_3D915;
br_3D906:
	fn_3D96E();
	goto br_3D915;
br_3D90C:
	fn_3DA24();
	goto br_3D915;
br_3D912:
	fn_3DA32();
br_3D915:
	return 1;
br_3D91A:
	return 0;
}
