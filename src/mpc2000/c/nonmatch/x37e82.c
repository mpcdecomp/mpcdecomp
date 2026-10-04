/* differs: XL v1.20 +0, 7 bytes */
void __near __fastcall disk_svc_call(int);

int __far far_37E82(void)
{
	return disk_svc_call(0x1e);
}
