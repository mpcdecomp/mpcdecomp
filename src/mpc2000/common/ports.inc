; MPC2000 / MPC2000XL hardware ports, identical on both
; machines and OS revisions. Image-specific addresses
; are beside their corresponding images, not here.

; Word-wide sample-memory / F-ROM DMA engine, ports 080h-08Dh.
DMA_CTRL        equ     080h            ; control
DMA_DATA_LO     equ     082h            ; data low word
DMA_DATA_HI     equ     084h            ; data high word
DMA_ADDR_HI     equ     086h            ; device address high
DMA_STATUS      equ     088h            ; status / GO
DMA_STATUS2     equ     08Ah            ; status 2

; ASIC register window, indexed access:
; `out ASIC_REG, ax` selects, `out ASIC_DATA, ax` writes.
; SYS uses 94 selectors, 000h-27Eh, adds G_DSP_CHAN to
; selector at 211 of 220 write sites
ASIC_REG        equ     0A2h            ; 16-bit register selector
ASIC_DATA       equ     0A0h            ; register value

; MPC ASIC 0C030h-0C03Fh: the main-RAM side of every DMA (target address and
; byte count minus one).  the unnamed ones are named for their port.
ASIC_DMA_MODE   equ     0C030h          ; channel/mode
ASIC_DMA_C031   equ     0C031h
ASIC_DMA_COUNT  equ     0C032h          ; byte count minus one
ASIC_DMA_ADDR   equ     0C034h          ; RAM target, low 16 bits
ASIC_DMA_ADDR_HI equ    0C036h          ; RAM target, bits 16-19
ASIC_DMA_C038   equ     0C038h
ASIC_DMA_DIR    equ     0C039h          ; 1 = device -> RAM, 0 = RAM -> device
ASIC_DMA_C03A   equ     0C03Ah
ASIC_DMA_STATUS equ     0C03Bh          ; bit 6 set while busy
ASIC_DMA_C03F   equ     0C03Fh
