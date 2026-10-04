; Intel 28F016SA flash (the flash board's chips): command words, status
; register bits, identifier.

FLASH_CMD_READ_ARRAY    equ     0ffh
FLASH_CMD_READ_ID       equ     090h            ; then the maker and device words
FLASH_CMD_READ_STATUS   equ     070h            ; SR
FLASH_CMD_READ_XSTATUS  equ     071h            ; XSR, the page buffers'
FLASH_CMD_CLEAR_STATUS  equ     050h
FLASH_CMD_ERASE         equ     020h            ; block erase, then FLASH_CMD_CONFIRM
FLASH_CMD_CONFIRM       equ     0d0h
FLASH_CMD_PAGE_WRITE    equ     0e0h            ; to the page buffer, then a count
FLASH_CMD_PAGE_COMMIT   equ     00ch            ; page buffer to the array, then a count

FLASH_SR_READY          equ     080h            ; the write state machine is idle
FLASH_SR_ERASE_ERR      equ     020h
FLASH_SR_PROGRAM_ERR    equ     010h            ; both with ERASE_ERR: a bad sequence
FLASH_SR_ERRORS         equ     078h            ; erase, program, Vpp low, ...

FLASH_ID_INTEL          equ     089h
FLASH_ID_28F016SA       equ     066a0h
