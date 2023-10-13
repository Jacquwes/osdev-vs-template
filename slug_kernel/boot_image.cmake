set(ISO_DIR ${CMAKE_CURRENT_BINARY_DIR}/iso)
set(LIMINE_DIR ${CMAKE_SOURCE_DIR}/limine)

add_custom_target(
	bootable_image
	COMMAND rm -rf ${ISO_DIR}
	COMMAND mkdir -p ${ISO_DIR}
	COMMAND cp -v $<TARGET_FILE:kernel> 
	 	${CMAKE_SOURCE_DIR}/slug_kernel/limine.cfg ${LIMINE_DIR}/limine-bios.sys ${LIMINE_DIR}/limine-bios-cd.bin
		${LIMINE_DIR}/limine-uefi-cd.bin ${ISO_DIR}/
	COMMAND mkdir -p ${ISO_DIR}/EFI/BOOT
	COMMAND cp -v ${LIMINE_DIR}/BOOTX64.EFI ${ISO_DIR}/EFI/BOOT/
	COMMAND cp -v ${LIMINE_DIR}/BOOTIA32.EFI ${ISO_DIR}/EFI/BOOT/
	COMMAND xorriso -as mkisofs -b limine-bios-cd.bin
	 	-no-emul-boot -boot-load-size 4 -boot-info-table
	 	--efi-boot limine-uefi-cd.bin
	 	-efi-boot-part --efi-boot-image --protective-msdos-label
	 	${ISO_DIR} -o ${CMAKE_CURRENT_BINARY_DIR}/kernel.iso
	COMMAND ${LIMINE_DIR}/limine bios-install ${CMAKE_CURRENT_BINARY_DIR}/kernel.iso
	COMMAND rm -rf ${ISO_DIR}
	DEPENDS kernel
	VERBATIM
)