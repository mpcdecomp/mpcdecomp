/* differs: XL v1.20 +0, 7 bytes */
void __near __fastcall disk_svc_call(int);

int __far L_37E7C(void)
{
	return disk_svc_call(0x15);
}
