/* differs: 150 size 14, image 18; +D image `mov es, dx` CL `retf`; 172 size 14, image 18; +D image `mov es, dx` CL `retf` */
extern char G_DSP_CHAN;
long __far channel_validate(int);

int __far X_0187B(void)
{
	return (int)channel_validate(G_DSP_CHAN);
}
