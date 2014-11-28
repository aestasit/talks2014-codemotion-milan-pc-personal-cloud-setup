@echo off

@set local_iso_file=file:///E:/OperatingSystems/Microsoft/WindowsServer/SPLA/2008 R2/SW_DVD5_Windows_Svr_DC_EE_SE_Web_2008_R2_64Bit_English_w_SP1_MLF_X17-22580.ISO
@set local_ga_file=file:///E:/VirtualBox/VBoxGuestAdditions_4.3.18.iso
@set local_ga_sum=e5b425ec4f6a62523855c3cbd3975d17f962f27df093d403eab27c0e7f71464a

@if "%local_iso_file%"=="" goto loadFromWeb

@echo Creating image from local ISO file:
@echo "%local_iso_file%"
@echo.
@echo.

@if not "%local_ga_file%"=="" set ga_vars=-var guest_additions_url="%local_ga_file%"
@if not "%local_ga_sum%"=="" set ga_vars=%ga_vars% -var guest_additions_checksum="%local_ga_sum%"

@packer build -force -var win_iso_url="%local_iso_file%" %ga_vars% windows_2008_r2_puppet.json 

@goto end

:loadFromWeb

@echo Creating image based on the ISO image that will be downloaded from Microsoft website.
@echo.
@echo.

@packer build -force windows_2008_r2_puppet.json

:end
