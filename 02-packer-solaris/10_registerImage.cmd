@echo off
                                           
@if exist solaris11.box goto addBox

@echo Required 'solaris11.box' does not exist. Possible reasons:
@echo  1. Packer did not create an image either because Packer was not started or because of an error occurred during Packer run;
@echo  2. Image file was manually moved/renamed afterwards.
@echo. 
@echo Please make sure the box is on the path and start the '%~nx0' file again.
@echo If you aware of where the created box file then you can add the box to Vagrant manually by executing command
@echo.
@echo $ vagrant box add 'box_alias' path-to-created-box
@echo.
@echo Additionally, you need to update Vagrantfile in the current folder and set your new 'box-alias' to config.vm.box variable.
@echo For more information please refer to Vagrant documentation https://docs.vagrantup.com/v2/boxes.html https://docs.vagrantup.com/v2/vagrantfile/index.html
@echo.
@goto end

:addBox
@echo off
@call vagrant box add solarisauto/solaris11 solaris11.box --force

:end