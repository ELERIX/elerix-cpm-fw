#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/elerix-cpm-fw.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/elerix-cpm-fw.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=main.c debug_routines.c dac.c sw_i2c.c adc.c multiplexer.c output_pins.c eeprom_regs.c events.c interface_i2c.c LEDs.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/main.p1 ${OBJECTDIR}/debug_routines.p1 ${OBJECTDIR}/dac.p1 ${OBJECTDIR}/sw_i2c.p1 ${OBJECTDIR}/adc.p1 ${OBJECTDIR}/multiplexer.p1 ${OBJECTDIR}/output_pins.p1 ${OBJECTDIR}/eeprom_regs.p1 ${OBJECTDIR}/events.p1 ${OBJECTDIR}/interface_i2c.p1 ${OBJECTDIR}/LEDs.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/main.p1.d ${OBJECTDIR}/debug_routines.p1.d ${OBJECTDIR}/dac.p1.d ${OBJECTDIR}/sw_i2c.p1.d ${OBJECTDIR}/adc.p1.d ${OBJECTDIR}/multiplexer.p1.d ${OBJECTDIR}/output_pins.p1.d ${OBJECTDIR}/eeprom_regs.p1.d ${OBJECTDIR}/events.p1.d ${OBJECTDIR}/interface_i2c.p1.d ${OBJECTDIR}/LEDs.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/main.p1 ${OBJECTDIR}/debug_routines.p1 ${OBJECTDIR}/dac.p1 ${OBJECTDIR}/sw_i2c.p1 ${OBJECTDIR}/adc.p1 ${OBJECTDIR}/multiplexer.p1 ${OBJECTDIR}/output_pins.p1 ${OBJECTDIR}/eeprom_regs.p1 ${OBJECTDIR}/events.p1 ${OBJECTDIR}/interface_i2c.p1 ${OBJECTDIR}/LEDs.p1

# Source Files
SOURCEFILES=main.c debug_routines.c dac.c sw_i2c.c adc.c multiplexer.c output_pins.c eeprom_regs.c events.c interface_i2c.c LEDs.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/elerix-cpm-fw.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=16F19196
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/main.p1: main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.p1.d 
	@${RM} ${OBJECTDIR}/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -Og -maddrqual=ignore -xassembler-with-cpp -v -mwarn=9 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/main.p1 main.c 
	@-${MV} ${OBJECTDIR}/main.d ${OBJECTDIR}/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/debug_routines.p1: debug_routines.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/debug_routines.p1.d 
	@${RM} ${OBJECTDIR}/debug_routines.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -Og -maddrqual=ignore -xassembler-with-cpp -v -mwarn=9 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/debug_routines.p1 debug_routines.c 
	@-${MV} ${OBJECTDIR}/debug_routines.d ${OBJECTDIR}/debug_routines.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/debug_routines.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/dac.p1: dac.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/dac.p1.d 
	@${RM} ${OBJECTDIR}/dac.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -Og -maddrqual=ignore -xassembler-with-cpp -v -mwarn=9 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/dac.p1 dac.c 
	@-${MV} ${OBJECTDIR}/dac.d ${OBJECTDIR}/dac.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/dac.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/sw_i2c.p1: sw_i2c.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/sw_i2c.p1.d 
	@${RM} ${OBJECTDIR}/sw_i2c.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -Og -maddrqual=ignore -xassembler-with-cpp -v -mwarn=9 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/sw_i2c.p1 sw_i2c.c 
	@-${MV} ${OBJECTDIR}/sw_i2c.d ${OBJECTDIR}/sw_i2c.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/sw_i2c.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/adc.p1: adc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/adc.p1.d 
	@${RM} ${OBJECTDIR}/adc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -Og -maddrqual=ignore -xassembler-with-cpp -v -mwarn=9 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/adc.p1 adc.c 
	@-${MV} ${OBJECTDIR}/adc.d ${OBJECTDIR}/adc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/adc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/multiplexer.p1: multiplexer.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/multiplexer.p1.d 
	@${RM} ${OBJECTDIR}/multiplexer.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -Og -maddrqual=ignore -xassembler-with-cpp -v -mwarn=9 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/multiplexer.p1 multiplexer.c 
	@-${MV} ${OBJECTDIR}/multiplexer.d ${OBJECTDIR}/multiplexer.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/multiplexer.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/output_pins.p1: output_pins.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/output_pins.p1.d 
	@${RM} ${OBJECTDIR}/output_pins.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -Og -maddrqual=ignore -xassembler-with-cpp -v -mwarn=9 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/output_pins.p1 output_pins.c 
	@-${MV} ${OBJECTDIR}/output_pins.d ${OBJECTDIR}/output_pins.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/output_pins.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/eeprom_regs.p1: eeprom_regs.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/eeprom_regs.p1.d 
	@${RM} ${OBJECTDIR}/eeprom_regs.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -Og -maddrqual=ignore -xassembler-with-cpp -v -mwarn=9 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/eeprom_regs.p1 eeprom_regs.c 
	@-${MV} ${OBJECTDIR}/eeprom_regs.d ${OBJECTDIR}/eeprom_regs.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/eeprom_regs.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/events.p1: events.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/events.p1.d 
	@${RM} ${OBJECTDIR}/events.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -Og -maddrqual=ignore -xassembler-with-cpp -v -mwarn=9 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/events.p1 events.c 
	@-${MV} ${OBJECTDIR}/events.d ${OBJECTDIR}/events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/interface_i2c.p1: interface_i2c.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interface_i2c.p1.d 
	@${RM} ${OBJECTDIR}/interface_i2c.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -Og -maddrqual=ignore -xassembler-with-cpp -v -mwarn=9 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/interface_i2c.p1 interface_i2c.c 
	@-${MV} ${OBJECTDIR}/interface_i2c.d ${OBJECTDIR}/interface_i2c.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/interface_i2c.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/LEDs.p1: LEDs.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LEDs.p1.d 
	@${RM} ${OBJECTDIR}/LEDs.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -Og -maddrqual=ignore -xassembler-with-cpp -v -mwarn=9 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/LEDs.p1 LEDs.c 
	@-${MV} ${OBJECTDIR}/LEDs.d ${OBJECTDIR}/LEDs.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/LEDs.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/main.p1: main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.p1.d 
	@${RM} ${OBJECTDIR}/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -Og -maddrqual=ignore -xassembler-with-cpp -v -mwarn=9 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/main.p1 main.c 
	@-${MV} ${OBJECTDIR}/main.d ${OBJECTDIR}/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/debug_routines.p1: debug_routines.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/debug_routines.p1.d 
	@${RM} ${OBJECTDIR}/debug_routines.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -Og -maddrqual=ignore -xassembler-with-cpp -v -mwarn=9 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/debug_routines.p1 debug_routines.c 
	@-${MV} ${OBJECTDIR}/debug_routines.d ${OBJECTDIR}/debug_routines.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/debug_routines.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/dac.p1: dac.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/dac.p1.d 
	@${RM} ${OBJECTDIR}/dac.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -Og -maddrqual=ignore -xassembler-with-cpp -v -mwarn=9 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/dac.p1 dac.c 
	@-${MV} ${OBJECTDIR}/dac.d ${OBJECTDIR}/dac.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/dac.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/sw_i2c.p1: sw_i2c.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/sw_i2c.p1.d 
	@${RM} ${OBJECTDIR}/sw_i2c.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -Og -maddrqual=ignore -xassembler-with-cpp -v -mwarn=9 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/sw_i2c.p1 sw_i2c.c 
	@-${MV} ${OBJECTDIR}/sw_i2c.d ${OBJECTDIR}/sw_i2c.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/sw_i2c.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/adc.p1: adc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/adc.p1.d 
	@${RM} ${OBJECTDIR}/adc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -Og -maddrqual=ignore -xassembler-with-cpp -v -mwarn=9 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/adc.p1 adc.c 
	@-${MV} ${OBJECTDIR}/adc.d ${OBJECTDIR}/adc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/adc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/multiplexer.p1: multiplexer.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/multiplexer.p1.d 
	@${RM} ${OBJECTDIR}/multiplexer.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -Og -maddrqual=ignore -xassembler-with-cpp -v -mwarn=9 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/multiplexer.p1 multiplexer.c 
	@-${MV} ${OBJECTDIR}/multiplexer.d ${OBJECTDIR}/multiplexer.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/multiplexer.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/output_pins.p1: output_pins.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/output_pins.p1.d 
	@${RM} ${OBJECTDIR}/output_pins.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -Og -maddrqual=ignore -xassembler-with-cpp -v -mwarn=9 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/output_pins.p1 output_pins.c 
	@-${MV} ${OBJECTDIR}/output_pins.d ${OBJECTDIR}/output_pins.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/output_pins.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/eeprom_regs.p1: eeprom_regs.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/eeprom_regs.p1.d 
	@${RM} ${OBJECTDIR}/eeprom_regs.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -Og -maddrqual=ignore -xassembler-with-cpp -v -mwarn=9 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/eeprom_regs.p1 eeprom_regs.c 
	@-${MV} ${OBJECTDIR}/eeprom_regs.d ${OBJECTDIR}/eeprom_regs.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/eeprom_regs.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/events.p1: events.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/events.p1.d 
	@${RM} ${OBJECTDIR}/events.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -Og -maddrqual=ignore -xassembler-with-cpp -v -mwarn=9 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/events.p1 events.c 
	@-${MV} ${OBJECTDIR}/events.d ${OBJECTDIR}/events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/interface_i2c.p1: interface_i2c.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interface_i2c.p1.d 
	@${RM} ${OBJECTDIR}/interface_i2c.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -Og -maddrqual=ignore -xassembler-with-cpp -v -mwarn=9 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/interface_i2c.p1 interface_i2c.c 
	@-${MV} ${OBJECTDIR}/interface_i2c.d ${OBJECTDIR}/interface_i2c.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/interface_i2c.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/LEDs.p1: LEDs.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LEDs.p1.d 
	@${RM} ${OBJECTDIR}/LEDs.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -Og -maddrqual=ignore -xassembler-with-cpp -v -mwarn=9 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/LEDs.p1 LEDs.c 
	@-${MV} ${OBJECTDIR}/LEDs.d ${OBJECTDIR}/LEDs.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/LEDs.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/elerix-cpm-fw.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=dist/${CND_CONF}/${IMAGE_TYPE}/elerix-cpm-fw.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -Og -maddrqual=ignore -xassembler-with-cpp -v -mwarn=9 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -std=c99 -gdwarf-3 -mstack=compiled:auto:auto        $(COMPARISON_BUILD) -Wl,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -o dist/${CND_CONF}/${IMAGE_TYPE}/elerix-cpm-fw.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/elerix-cpm-fw.X.${IMAGE_TYPE}.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/elerix-cpm-fw.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=dist/${CND_CONF}/${IMAGE_TYPE}/elerix-cpm-fw.X.${IMAGE_TYPE}.map  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -O0 -fasmfile -Og -maddrqual=ignore -xassembler-with-cpp -v -mwarn=9 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     $(COMPARISON_BUILD) -Wl,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -o dist/${CND_CONF}/${IMAGE_TYPE}/elerix-cpm-fw.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
