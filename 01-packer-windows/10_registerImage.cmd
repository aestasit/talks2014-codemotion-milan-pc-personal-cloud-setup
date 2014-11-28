@echo off
                                           
@if exist windows_2008_r2_virtualbox.box goto addBox

@echo Required 'windows_2008_r2_virtualbox.box' does not exist. Possible reasons:
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
@echo Adding Packer box to Vagrant repository.
@vagrant box add winauto/2008R2_puppet windows_2008_r2_virtualbox.box --force

:end