#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = iar.targets.arm.M3{1,0,7.40,3
#
ifeq (,$(MK_NOGENDEPS))
-include package/cfg/appBLE_prm3.orm3.dep
package/cfg/appBLE_prm3.orm3.dep: ;
endif

package/cfg/appBLE_prm3.orm3: | .interfaces
package/cfg/appBLE_prm3.orm3: package/cfg/appBLE_prm3.c package/cfg/appBLE_prm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm    -D POWER_SAVING   -D GATT_TI_UUID_128_BIT   -D FEATURE_REGISTER_SERVICE   -D FEATURE_OAD   -D FACTORY_IMAGE   -D USE_ICALL   -D TI_DRIVERS_PIN_INCLUDED   -D TI_DRIVERS_I2C_INCLUDED   -D TI_DRIVERS_SPI_INCLUDED   -D HEAPMGR_SIZE=2872   -D ICALL_MAX_NUM_TASKS=8   -D ICALL_MAX_NUM_ENTITIES=11   -D CC26XXWARE   -D CC26XX   -D xdc_runtime_Assert_DISABLE_ALL   -D xdc_runtime_Log_DISABLE_ALL   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../Source/Application/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Projects/ble/Include/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Projects/ble/ICall/Include/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Projects/ble/Profiles/Roles/CC26xx/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Projects/ble/Profiles/Roles/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Projects/ble/Profiles/Keys/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Projects/ble/Profiles/DevInfo/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Projects/ble/Profiles/SensorProfile/cc26xx/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Projects/ble/Profiles/OAD/cc26xxST/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Projects/ble/common/cc26xx/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/applib/heap/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/ble/hci/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/ble/controller/CC26xx/include/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/ble/host/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/hal/target/CC2650TIRTOS/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/hal/target/_common/cc26xx/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/hal/include/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/osal/include/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/services/sdata/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/services/saddr/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/icall/include/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/icall/ports/tirtos/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/ble/include/   -I C:/ti/tirtos_simplelink_2_13_00_06/products/cc26xxware_2_21_01_15600/   -I C:/ti/tirtos_simplelink_2_13_00_06/packages/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../Source/Application/Board_patch/interfaces/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../Source/Application/Board_patch/devices/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../Source/Application/Board_patch/CC26XXST_0120/   --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb   -Dxdc_cfg__xheader__='"configPkg/package/cfg/appBLE_prm3.h"'  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_40_3 -Ohs --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/cfg/appBLE_prm3.srm3: | .interfaces
package/cfg/appBLE_prm3.srm3: package/cfg/appBLE_prm3.c package/cfg/appBLE_prm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm    -D POWER_SAVING   -D GATT_TI_UUID_128_BIT   -D FEATURE_REGISTER_SERVICE   -D FEATURE_OAD   -D FACTORY_IMAGE   -D USE_ICALL   -D TI_DRIVERS_PIN_INCLUDED   -D TI_DRIVERS_I2C_INCLUDED   -D TI_DRIVERS_SPI_INCLUDED   -D HEAPMGR_SIZE=2872   -D ICALL_MAX_NUM_TASKS=8   -D ICALL_MAX_NUM_ENTITIES=11   -D CC26XXWARE   -D CC26XX   -D xdc_runtime_Assert_DISABLE_ALL   -D xdc_runtime_Log_DISABLE_ALL   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../Source/Application/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Projects/ble/Include/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Projects/ble/ICall/Include/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Projects/ble/Profiles/Roles/CC26xx/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Projects/ble/Profiles/Roles/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Projects/ble/Profiles/Keys/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Projects/ble/Profiles/DevInfo/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Projects/ble/Profiles/SensorProfile/cc26xx/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Projects/ble/Profiles/OAD/cc26xxST/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Projects/ble/common/cc26xx/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/applib/heap/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/ble/hci/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/ble/controller/CC26xx/include/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/ble/host/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/hal/target/CC2650TIRTOS/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/hal/target/_common/cc26xx/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/hal/include/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/osal/include/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/services/sdata/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/services/saddr/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/icall/include/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/icall/ports/tirtos/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../../../../../Components/ble/include/   -I C:/ti/tirtos_simplelink_2_13_00_06/products/cc26xxware_2_21_01_15600/   -I C:/ti/tirtos_simplelink_2_13_00_06/packages/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../Source/Application/Board_patch/interfaces/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../Source/Application/Board_patch/devices/   -I C:/ti/simplelink/ble_cc26xx_2_01_01_44627/Projects/ble/SensorTag/CC26xx/IAR/Application/CC2650/../../../Source/Application/Board_patch/CC26XXST_0120/   --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb   -Dxdc_cfg__xheader__='"configPkg/package/cfg/appBLE_prm3.h"'  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_40_3 -Ohs --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

clean,rm3 ::
	-$(RM) package/cfg/appBLE_prm3.orm3
	-$(RM) package/cfg/appBLE_prm3.srm3

appBLE.prm3: package/cfg/appBLE_prm3.orm3 package/cfg/appBLE_prm3.mak

clean::
	-$(RM) package/cfg/appBLE_prm3.mak
