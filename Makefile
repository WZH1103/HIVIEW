# Makefile for all libs
# (c) fangyi, 2014

GSF_HOME ?= $(PWD)
GSF_CPU_ARCH ?= XXX


MOD_DIRS := mod/bsp
MOD_DIRS += mod/mpp/${GSF_CPU_ARCH}
MOD_DIRS += mod/codec
MOD_DIRS += mod/rtsps
MOD_DIRS += mod/rec
MOD_DIRS += mod/webs
MOD_DIRS += mod/onvif
MOD_DIRS += mod/svp
MOD_DIRS += mod/rtmps
MOD_DIRS += mod/sips
MOD_DIRS += mod/srts
MOD_DIRS += mod/app 

FW_DIRS :=  fw/nm
FW_DIRS +=  fw/cfifo
FW_DIRS +=  fw/cjson
FW_DIRS +=  fw/mxml
FW_DIRS +=  fw/comm
FW_DIRS +=  fw/tindex
FW_DIRS +=  fw/libmov
FW_DIRS +=  fw/libfont
FW_DIRS +=  fw/libhttp
FW_DIRS +=  fw/librtp
FW_DIRS +=  fw/librtsp
FW_DIRS +=  fw/librtmp
FW_DIRS +=  fw/libmpeg
FW_DIRS +=  fw/libsip
FW_DIRS +=  fw/libflv
FW_DIRS +=  fw/h26xbits
FW_DIRS +=  fw/gsoap
FW_DIRS +=  fw/lvgl 

CLEAN_DIRS := $(addprefix _cls_, $(FW_DIRS) $(MOD_DIRS))

.PHONY: mod fw $(FW_DIRS) $(MOD_DIRS) CHECK_ENV SUMMARY clean

mod: CHECK_ENV $(MOD_DIRS) SUMMARY
	@echo "..."

fw: CHECK_ENV $(FW_DIRS) SUMMARY
	@echo "..."

SUMMARY:
	@echo ""
	@echo "================ GSF-$(GSF_DEV_TYPE) ================"
	@echo "All Done."
	@echo "Env: $(GSF_CPU_ARCH)"
	@echo "Output: $(GSF_HOME)/lib/$(GSF_CPU_ARCH)"
	@echo "Output: `ls -l $(GSF_HOME)/lib/$(GSF_CPU_ARCH)`"
	@echo "Output: $(GSF_HOME)/bin/$(GSF_CPU_ARCH)"
	@echo "Output: `ls -l $(GSF_HOME)/bin/$(GSF_CPU_ARCH)`"

CHECK_ENV:
	@echo "================ GSF-IPC ================"
	@echo "Env: $(GSF_CPU_ARCH)"
ifeq ($(GSF_CPU_ARCH), XXX)
	@echo "Env Error."
	@exit 1
endif

$(MOD_DIRS):
	@$(MAKE) -C $@ || exit "$$?"

$(FW_DIRS):
	@$(MAKE) -C $@ || exit "$$?"
	
clean: $(CLEAN_DIRS)
	#-rm $(GSF_HOME)/bin/$(GSF_CPU_ARCH)/*.exe -rf
	#-rm $(GSF_HOME)/lib/$(GSF_CPU_ARCH)/*.so -rf

$(CLEAN_DIRS):
	$(MAKE) -C $(patsubst _cls_%, %, $@) clean
