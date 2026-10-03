/* differs: XL v1.20 +12, 76 bytes */
extern char C2_B_0D7CC;
extern char C2_B_REC_CANCEL_REQ;
void __far disp_request_flush(void);
void __far far_487C2(void);
int __far far_48980(void);
int __far far_49070(void);
void __far far_4907E(void);
void __far far_49092(void);
int __far far_491D0(void);
void __far far_496B0(void);
void __far far_496CA(int);

void __far __fastcall __loadds sample_record_key_33(int a0)
{
	if (far_48980()) goto br_48B9F;
	if (far_491D0()) goto br_48B72;
	if (!C2_B_0D7CC) goto br_48B69;
	if (!far_49070()) {
		far_487C2();
	} else {
		far_4907E();
	}
br_48B69:
	disp_request_flush();
	return;
br_48B72:
	if (!C2_B_0D7CC) goto br_48B94;
	switch (far_49070()) { case 0: goto br_48B94; }
	C2_B_REC_CANCEL_REQ = 1;
	far_496B0();
	far_49092();
	return;
br_48B94:
	far_496CA(a0);
br_48B9F:
	;
}
