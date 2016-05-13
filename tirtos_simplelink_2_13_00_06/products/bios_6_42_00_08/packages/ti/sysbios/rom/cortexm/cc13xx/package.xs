/*
 * Copyright (c) 2014, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

var Build = xdc.module("ti.sysbios.Build");
var ROM = xdc.module("ti.sysbios.rom.ROM");

/*
 *  ======== Package.getLibs ========
 *  This function is called when a program's configuration files are
 *  being generated and it returns the name of a library appropriate
 *  for the program's configuration.
 */

function getLibs(prog)
{
    var romModName;

    switch(ROM.romName) {
        case ROM.CC1350:
            romModName = "CC13xx";
            break;
    }

    if (this.CC13xx.usePatch == true) {
	romModName += "_patch";
    }

    if (Build.buildROMApp == true) {
	switch (BIOS.libType) {
	    case BIOS.LibType_Instrumented:
            case BIOS.LibType_NonInstrumented:
            case BIOS.LibType_Custom:
            case BIOS.LibType_Debug:
                lib = Build.$private.outputDir + Build.$private.libraryName;
                return ("!" + String(java.io.File(lib).getCanonicalPath()));
                break;
	}
    }
    else {
        return (null);
    }
}

/*
 *  ======== Package.getSects ========
 */
function getSects()
{
    var romModName;

    switch(ROM.romName) {
        case ROM.CC1350:
            romModName = "CC13xx";
            break;
    }

    if (this.CC13xx.usePatch == true) {
	romModName += "_patch";
    }

    if (Build.buildROMApp == true) {
        if (Program.build.target.$name.match(/iar/)) {
            return (String(this.packageBase + "golden/" + romModName +
                "/" + romModName + "_link_iar.xdt"));
        }
        else if (Program.build.target.$name.match(/gnu/)) {
            return (String(this.packageBase + "golden/" + romModName +
                "/" + romModName + "_link_gnu.xdt"));
        }
        else {
            return (String(this.packageBase + "golden/" + romModName +
                "/" + romModName + "_link_ti.xdt"));
        }
    }
    else {
        return (null);
    }
}
