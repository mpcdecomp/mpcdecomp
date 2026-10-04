/* differs: 150 size 14, image 18; +D image `mov es, dx` CL `retf`; 172 size 14, image 18; +D image `mov es, dx` CL `retf` */
extern char G_DSP_CHAN;
long __far channel_get_ptr(int);

int __far far_018AC(void)
{
	return (int)channel_get_ptr(G_DSP_CHAN);
}
