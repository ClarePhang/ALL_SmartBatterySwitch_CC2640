#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = iar.targets.arm.M4{1,0,7.40,2
#
ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/Boot/package/package_ti.catalog.arm.cortexm3.lm3init.orm4.dep
package/lib/lib/Boot/package/package_ti.catalog.arm.cortexm3.lm3init.orm4.dep: ;
endif

package/lib/lib/Boot/package/package_ti.catalog.arm.cortexm3.lm3init.orm4: | .interfaces
package/lib/lib/Boot/package/package_ti.catalog.arm.cortexm3.lm3init.orm4: package/package_ti.catalog.arm.cortexm3.lm3init.c lib/Boot.arm4.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm4 $< ...
	LC_ALL=C $(iar.targets.arm.M4.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M4 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M4 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_40_2 -Ohs --dlib_config $(iar.targets.arm.M4.rootDir)/inc/c/DLib_Config_Normal.h  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/Boot/package/package_ti.catalog.arm.cortexm3.lm3init.srm4: | .interfaces
package/lib/lib/Boot/package/package_ti.catalog.arm.cortexm3.lm3init.srm4: package/package_ti.catalog.arm.cortexm3.lm3init.c lib/Boot.arm4.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm4 $< ...
	LC_ALL=C $(iar.targets.arm.M4.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M4 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M4 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_40_2 -Ohs --dlib_config $(iar.targets.arm.M4.rootDir)/inc/c/DLib_Config_Normal.h  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/Boot/Boot.orm4.dep
package/lib/lib/Boot/Boot.orm4.dep: ;
endif

package/lib/lib/Boot/Boot.orm4: | .interfaces
package/lib/lib/Boot/Boot.orm4: Boot.c lib/Boot.arm4.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm4 $< ...
	LC_ALL=C $(iar.targets.arm.M4.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M4 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M4 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_40_2 -Ohs --dlib_config $(iar.targets.arm.M4.rootDir)/inc/c/DLib_Config_Normal.h  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/Boot/Boot.srm4: | .interfaces
package/lib/lib/Boot/Boot.srm4: Boot.c lib/Boot.arm4.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm4 $< ...
	LC_ALL=C $(iar.targets.arm.M4.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M4 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M4 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_40_2 -Ohs --dlib_config $(iar.targets.arm.M4.rootDir)/inc/c/DLib_Config_Normal.h  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

clean,rm4 ::
	-$(RM) package/lib/lib/Boot/package/package_ti.catalog.arm.cortexm3.lm3init.orm4
	-$(RM) package/lib/lib/Boot/Boot.orm4
	-$(RM) package/lib/lib/Boot/package/package_ti.catalog.arm.cortexm3.lm3init.srm4
	-$(RM) package/lib/lib/Boot/Boot.srm4

lib/Boot.arm4: package/lib/lib/Boot/package/package_ti.catalog.arm.cortexm3.lm3init.orm4 package/lib/lib/Boot/Boot.orm4 lib/Boot.arm4.mak

clean::
	-$(RM) lib/Boot.arm4.mak
