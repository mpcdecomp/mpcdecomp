/* differs: XL v1.20 +0, 7 bytes */
void __near __fastcall disk_svc_call(int);

void __far disk_file_close(void)
{
	disk_svc_call(0xa);
}
