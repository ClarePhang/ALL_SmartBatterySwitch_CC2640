#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = ti.targets.arm.elf.M3{1,0,5.2,2
#
ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/boot/package/package_ti.targets.arm.rtsarm.oem3.dep
package/lib/lib/boot/package/package_ti.targets.arm.rtsarm.oem3.dep: ;
endif

package/lib/lib/boot/package/package_ti.targets.arm.rtsarm.oem3: | .interfaces
package/lib/lib/boot/package/package_ti.targets.arm.rtsarm.oem3: package/package_ti.targets.arm.rtsarm.c lib/boot.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_2 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include/rts -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/boot/package -fr=./package/lib/lib/boot/package -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/boot/package -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_2 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include/rts -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/boot/package -fr=./package/lib/lib/boot/package
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/boot/package/package_ti.targets.arm.rtsarm.oem3: export C_DIR=
package/lib/lib/boot/package/package_ti.targets.arm.rtsarm.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/boot/package/package_ti.targets.arm.rtsarm.sem3: | .interfaces
package/lib/lib/boot/package/package_ti.targets.arm.rtsarm.sem3: package/package_ti.targets.arm.rtsarm.c lib/boot.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_2 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include/rts -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/boot/package -fr=./package/lib/lib/boot/package -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/boot/package -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_2 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include/rts -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/boot/package -fr=./package/lib/lib/boot/package
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/boot/package/package_ti.targets.arm.rtsarm.sem3: export C_DIR=
package/lib/lib/boot/package/package_ti.targets.arm.rtsarm.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/boot/boot.oem3.dep
package/lib/lib/boot/boot.oem3.dep: ;
endif

package/lib/lib/boot/boot.oem3: | .interfaces
package/lib/lib/boot/boot.oem3: boot.asm lib/boot.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) asmem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -qq --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_2   $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include/rts -I$(ti.targets.arm.elf.M3.rootDir)/include  -fr=./package/lib/lib/boot -fa $<
	$(MKDEP) -a $@.dep -p package/lib/lib/boot -s oem3 $< -C  -qq --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_2   $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include/rts -I$(ti.targets.arm.elf.M3.rootDir)/include 
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/boot/boot.oem3: export C_DIR=
package/lib/lib/boot/boot.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

clean,em3 ::
	-$(RM) package/lib/lib/boot/package/package_ti.targets.arm.rtsarm.oem3
	-$(RM) package/lib/lib/boot/boot.oem3
	-$(RM) package/lib/lib/boot/package/package_ti.targets.arm.rtsarm.sem3

lib/boot.aem3: package/lib/lib/boot/package/package_ti.targets.arm.rtsarm.oem3 package/lib/lib/boot/boot.oem3 lib/boot.aem3.mak

clean::
	-$(RM) lib/boot.aem3.mak
