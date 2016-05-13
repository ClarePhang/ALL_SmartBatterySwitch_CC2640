#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = iar.targets.arm.M3{1,0,7.40,2
#
ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/Boot/package/package_ti.catalog.arm.cortexm4.tiva.ce.orm3.dep
package/lib/lib/Boot/package/package_ti.catalog.arm.cortexm4.tiva.ce.orm3.dep: ;
endif

package/lib/lib/Boot/package/package_ti.catalog.arm.cortexm4.tiva.ce.orm3: | .interfaces
package/lib/lib/Boot/package/package_ti.catalog.arm.cortexm4.tiva.ce.orm3: package/package_ti.catalog.arm.cortexm4.tiva.ce.c lib/Boot.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_40_2 -Ohs --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/Boot/package/package_ti.catalog.arm.cortexm4.tiva.ce.srm3: | .interfaces
package/lib/lib/Boot/package/package_ti.catalog.arm.cortexm4.tiva.ce.srm3: package/package_ti.catalog.arm.cortexm4.tiva.ce.c lib/Boot.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_40_2 -Ohs --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/Boot/Boot.orm3.dep
package/lib/lib/Boot/Boot.orm3.dep: ;
endif

package/lib/lib/Boot/Boot.orm3: | .interfaces
package/lib/lib/Boot/Boot.orm3: Boot.c lib/Boot.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_40_2 -Ohs --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/Boot/Boot.srm3: | .interfaces
package/lib/lib/Boot/Boot.srm3: Boot.c lib/Boot.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_40_2 -Ohs --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/Boot/Boot_sysctl.orm3.dep
package/lib/lib/Boot/Boot_sysctl.orm3.dep: ;
endif

package/lib/lib/Boot/Boot_sysctl.orm3: | .interfaces
package/lib/lib/Boot/Boot_sysctl.orm3: Boot_sysctl.c lib/Boot.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_40_2 -Ohs --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/Boot/Boot_sysctl.srm3: | .interfaces
package/lib/lib/Boot/Boot_sysctl.srm3: Boot_sysctl.c lib/Boot.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_40_2 -Ohs --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

clean,rm3 ::
	-$(RM) package/lib/lib/Boot/package/package_ti.catalog.arm.cortexm4.tiva.ce.orm3
	-$(RM) package/lib/lib/Boot/Boot.orm3
	-$(RM) package/lib/lib/Boot/Boot_sysctl.orm3
	-$(RM) package/lib/lib/Boot/package/package_ti.catalog.arm.cortexm4.tiva.ce.srm3
	-$(RM) package/lib/lib/Boot/Boot.srm3
	-$(RM) package/lib/lib/Boot/Boot_sysctl.srm3

lib/Boot.arm3: package/lib/lib/Boot/package/package_ti.catalog.arm.cortexm4.tiva.ce.orm3 package/lib/lib/Boot/Boot.orm3 package/lib/lib/Boot/Boot_sysctl.orm3 lib/Boot.arm3.mak

clean::
	-$(RM) lib/Boot.arm3.mak
