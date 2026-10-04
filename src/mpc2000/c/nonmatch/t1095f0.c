/* differs: 150 size 18, image 16; +0 image `push word ptr [bp - 2]` CL `enter 2, 0`; 172 size 18, image 16; +0 image `push word ptr [bp - 2]` CL `enter 2, 0` */
void __far __pascal ui_enter_pad_assign(int, int);

int __near __fastcall X_09570(int a0)
{
	int l2;

	ui_enter_pad_assign(l2, a0);
	return 1;
}
