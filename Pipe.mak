# Microsoft Developer Studio Generated NMAKE File, Based on Pipe.dsp
!IF "$(CFG)" == ""
CFG=Pipe - Win32 Build 110 Debug
!MESSAGE No configuration specified. Defaulting to Pipe - Win32 Build 110\
 Debug.
!ENDIF 

!IF "$(CFG)" != "Pipe - Win32 Build 110 Release" && "$(CFG)" !=\
 "Pipe - Win32 Build 110 Debug" && "$(CFG)" != "Pipe - Win32 Release" &&\
 "$(CFG)" != "Pipe - Win32 Debug" && "$(CFG)" != "Pipe - Win32 307 Release" &&\
 "$(CFG)" != "Pipe - Win32 311 Release" && "$(CFG)" !=\
 "Pipe - Win32 Core Release"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Pipe.mak" CFG="Pipe - Win32 Build 110 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Pipe - Win32 Build 110 Release" (based on\
 "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Pipe - Win32 Build 110 Debug" (based on\
 "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Pipe - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Pipe - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Pipe - Win32 307 Release" (based on\
 "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Pipe - Win32 311 Release" (based on\
 "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Pipe - Win32 Core Release" (based on\
 "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "Pipe - Win32 Build 110 Release"

OUTDIR=.\WinRel
INTDIR=e:\temp\out

!IF "$(RECURSE)" == "0" 

ALL : "c:\perl\110\lib\auto\Win32\pipe\PIPE.PLL"

!ELSE 

ALL : "c:\perl\110\lib\auto\Win32\pipe\PIPE.PLL"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\CPIPE.OBJ"
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\pipe.res"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\PIPE.exp"
	-@erase "$(OUTDIR)\PIPE.lib"
	-@erase "c:\perl\110\lib\auto\Win32\pipe\PIPE.PLL"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /G4 /MT /W3 /GX /O1 /I "s:\include\perl\110" /I\
 "s:\include\perl\110\inc" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=e:\temp\out/
CPP_SBRS=.
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\pipe.res" /i "s:\include\perl\110" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Pipe.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib\
 comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib\
 odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /pdb:none /machine:I386\
 /def:".\PIPE.DEF" /force /out:"c:\perl\110\lib\auto\Win32\pipe\PIPE.PLL"\
 /implib:"$(OUTDIR)\PIPE.lib" 
DEF_FILE= \
	".\PIPE.DEF"
LINK32_OBJS= \
	"$(INTDIR)\CPIPE.OBJ" \
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\pipe.res"

"c:\perl\110\lib\auto\Win32\pipe\PIPE.PLL" : "$(OUTDIR)" $(DEF_FILE)\
 $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Pipe - Win32 Build 110 Debug"

OUTDIR=.\WinDebug
INTDIR=e:\temp\out

!IF "$(RECURSE)" == "0" 

ALL : "c:\perl\110\lib\auto\Win32\pipe\PIPE.PLL"

!ELSE 

ALL : "c:\perl\110\lib\auto\Win32\pipe\PIPE.PLL"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\CPIPE.OBJ"
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\pipe.res"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(OUTDIR)\PIPE.exp"
	-@erase "$(OUTDIR)\PIPE.lib"
	-@erase "$(OUTDIR)\PIPE.pdb"
	-@erase "c:\perl\110\lib\auto\Win32\pipe\PIPE.ILK"
	-@erase "c:\perl\110\lib\auto\Win32\pipe\PIPE.PLL"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /G4 /MTd /W3 /Gm /GX /Zi /Od /I "s:\include\perl\110" /I\
 "s:\include\perl\110\inc" /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)\Pipe.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=e:\temp\out/
CPP_SBRS=.
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\pipe.res" /i "s:\include\perl\110" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Pipe.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib\
 comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib\
 odbc32.lib odbccp32.lib /nologo /base:"0x101f0000" /subsystem:windows /dll\
 /incremental:yes /pdb:"$(OUTDIR)\PIPE.pdb" /debug /machine:I386\
 /def:".\PIPE.DEF" /force /out:"c:\perl\110\lib\auto\Win32\pipe\PIPE.PLL"\
 /implib:"$(OUTDIR)\PIPE.lib" 
DEF_FILE= \
	".\PIPE.DEF"
LINK32_OBJS= \
	"$(INTDIR)\CPIPE.OBJ" \
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\pipe.res"

"c:\perl\110\lib\auto\Win32\pipe\PIPE.PLL" : "$(OUTDIR)" $(DEF_FILE)\
 $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Pipe - Win32 Release"

OUTDIR=.
INTDIR=.

!IF "$(RECURSE)" == "0" 

ALL : "c:\perl\lib\auto\Win32\pipe\PIPE.PLL"

!ELSE 

ALL : "c:\perl\lib\auto\Win32\pipe\PIPE.PLL"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\CPIPE.OBJ"
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\pipe.res"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\PIPE.exp"
	-@erase "$(OUTDIR)\PIPE.lib"
	-@erase "c:\perl\lib\auto\Win32\pipe\PIPE.PLL"

CPP_PROJ=/nologo /G4 /MT /W3 /GX /O1 /I "s:\include\perl" /I\
 "s:\include\perl\inc" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "MSWIN32" /D\
 "EMBED" /D "PERL_OBJECT" /FD /c 
CPP_OBJS=.
CPP_SBRS=.
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\pipe.res" /i "s:\include\perl" /d "NDEBUG" /d\
 "MSWIN32" /d "EMBED" /d "PERL_OBJECT" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Pipe.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib\
 comdlg32.lib advapi32.lib /nologo /subsystem:windows /dll /pdb:none\
 /machine:I386 /def:".\PIPE.DEF" /force\
 /out:"c:\perl\lib\auto\Win32\pipe\PIPE.PLL" /implib:"$(OUTDIR)\PIPE.lib"\
 /libpath:"c:\source\include\perl" 
DEF_FILE= \
	".\PIPE.DEF"
LINK32_OBJS= \
	"$(INTDIR)\CPIPE.OBJ" \
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\pipe.res"

"c:\perl\lib\auto\Win32\pipe\PIPE.PLL" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Pipe - Win32 Debug"

OUTDIR=.
INTDIR=.

!IF "$(RECURSE)" == "0" 

ALL : "c:\perl\lib\auto\Win32\pipe\PIPE.PLL"

!ELSE 

ALL : "c:\perl\lib\auto\Win32\pipe\PIPE.PLL"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\CPIPE.OBJ"
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\pipe.res"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(OUTDIR)\PIPE.exp"
	-@erase "$(OUTDIR)\PIPE.lib"
	-@erase "$(OUTDIR)\PIPE.pdb"
	-@erase "c:\perl\lib\auto\Win32\pipe\PIPE.ILK"
	-@erase "c:\perl\lib\auto\Win32\pipe\PIPE.PLL"

CPP_PROJ=/nologo /G4 /MTd /W3 /Gm /GX /Zi /Od /I "s:\include\perl" /I\
 "s:\include\perl\inc" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "MSWIN32" /D\
 "EMBED" /D "PERL_OBJECT" /Fp"$(INTDIR)\Pipe.pch" /YX /FD /c 
CPP_OBJS=.
CPP_SBRS=.
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\pipe.res" /i "s:\include\perl" /d "_DEBUG" /d\
 "PERL_OBJECT" /d "MSWIN32" /d "EMBED" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Pipe.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib\
 comdlg32.lib advapi32.lib /nologo /base:"0x101f0000" /subsystem:windows /dll\
 /incremental:yes /pdb:"$(OUTDIR)\PIPE.pdb" /debug /machine:I386\
 /def:".\PIPE.DEF" /force /out:"c:\perl\lib\auto\Win32\pipe\PIPE.PLL"\
 /implib:"$(OUTDIR)\PIPE.lib" /libpath:"c:\source\include\perl" 
DEF_FILE= \
	".\PIPE.DEF"
LINK32_OBJS= \
	"$(INTDIR)\CPIPE.OBJ" \
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\pipe.res"

"c:\perl\lib\auto\Win32\pipe\PIPE.PLL" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Pipe - Win32 307 Release"

OUTDIR=.\Pipe___1
INTDIR=.\Pipe___1

!IF "$(RECURSE)" == "0" 

ALL : ".\bin\PIPE_307.PLL"

!ELSE 

ALL : ".\bin\PIPE_307.PLL"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\CPIPE.OBJ"
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\PIPE_307.exp"
	-@erase "$(OUTDIR)\PIPE_307.lib"
	-@erase ".\bin\PIPE_307.PLL"
	-@erase ".\pipe.res"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /G4 /MT /W3 /GX /O1 /I "s:\include\perl\307" /I\
 "s:\include\perl\307\inc" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "MSWIN32" /D\
 "EMBED" /D "PERL_OBJECT" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\Pipe___1/
CPP_SBRS=.
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"pipe.res" /i "s:\include\perl\307" /i\
 "s:\include\perl\307\inc" /d "NDEBUG" /d "MSWIN32" /d "EMBED" /d "PERL_OBJECT" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Pipe.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib\
 comdlg32.lib advapi32.lib /nologo /subsystem:windows /dll /pdb:none\
 /machine:I386 /def:".\PIPE.DEF" /force /out:"bin/PIPE_307.PLL"\
 /implib:"$(OUTDIR)\PIPE_307.lib" /libpath:"c:\source\include\perl" 
DEF_FILE= \
	".\PIPE.DEF"
LINK32_OBJS= \
	"$(INTDIR)\CPIPE.OBJ" \
	"$(INTDIR)\PIPE.OBJ" \
	".\pipe.res"

".\bin\PIPE_307.PLL" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Pipe - Win32 311 Release"

OUTDIR=.\Pipe___W
INTDIR=.\Pipe___W

!IF "$(RECURSE)" == "0" 

ALL : ".\bin\PIPE_311.PLL"

!ELSE 

ALL : ".\bin\PIPE_311.PLL"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\CPIPE.OBJ"
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\PIPE_311.exp"
	-@erase "$(OUTDIR)\PIPE_311.lib"
	-@erase ".\bin\PIPE_311.PLL"
	-@erase ".\pipe.res"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /G4 /MT /W3 /GX /O1 /I "s:\include\perl\311" /I\
 "s:\include\perl\311\inc" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "MSWIN32" /D\
 "EMBED" /D "PERL_OBJECT" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\Pipe___W/
CPP_SBRS=.
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"pipe.res" /i "s:\include\perl\311" /d "NDEBUG" /d\
 "MSWIN32" /d "EMBED" /d "PERL_OBJECT" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Pipe.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib\
 comdlg32.lib advapi32.lib /nologo /subsystem:windows /dll /pdb:none\
 /machine:I386 /def:".\PIPE.DEF" /force /out:"bin/PIPE_311.PLL"\
 /implib:"$(OUTDIR)\PIPE_311.lib" /libpath:"c:\source\include\perl" 
DEF_FILE= \
	".\PIPE.DEF"
LINK32_OBJS= \
	"$(INTDIR)\CPIPE.OBJ" \
	"$(INTDIR)\PIPE.OBJ" \
	".\pipe.res"

".\bin\PIPE_311.PLL" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Pipe - Win32 Core Release"

OUTDIR=g:\temp\out
INTDIR=g:\temp\out

!IF "$(RECURSE)" == "0" 

ALL : ".\bin\PIPE_core.dll"

!ELSE 

ALL : ".\bin\PIPE_core.dll"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\CPIPE.OBJ"
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\PIPE_core.exp"
	-@erase "$(OUTDIR)\PIPE_core.lib"
	-@erase ".\bin\PIPE_core.dll"
	-@erase ".\pipe.res"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /G4 /MT /W3 /GX /O1 /I "s:\include\perl\core" /I\
 "s:\include\perl\core\inc" /D "NDEBUG" /D "WIN32" /D "_WINDOWS"\
 /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=g:\temp\out/
CPP_SBRS=.
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"pipe.res" /i "s:\include\perl\core" /i\
 "s:\include\perl\core\inc" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Pipe.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=LIBCMT.LIB perl.lib netapi32.lib kernel32.lib user32.lib\
 advapi32.lib /nologo /subsystem:windows /dll /pdb:none /machine:I386\
 /def:".\PIPE.DEF" /force /out:"bin/PIPE_core.dll"\
 /implib:"$(OUTDIR)\PIPE_core.lib" /libpath:"s:\lib\perl\core" 
DEF_FILE= \
	".\PIPE.DEF"
LINK32_OBJS= \
	"$(INTDIR)\CPIPE.OBJ" \
	"$(INTDIR)\PIPE.OBJ" \
	".\pipe.res"

".\bin\PIPE_core.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.c{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<


!IF "$(CFG)" == "Pipe - Win32 Build 110 Release" || "$(CFG)" ==\
 "Pipe - Win32 Build 110 Debug" || "$(CFG)" == "Pipe - Win32 Release" ||\
 "$(CFG)" == "Pipe - Win32 Debug" || "$(CFG)" == "Pipe - Win32 307 Release" ||\
 "$(CFG)" == "Pipe - Win32 311 Release" || "$(CFG)" ==\
 "Pipe - Win32 Core Release"
SOURCE=.\CPIPE.CPP

!IF  "$(CFG)" == "Pipe - Win32 Build 110 Release"

DEP_CPP_CPIPE=\
	"..\..\..\..\include\perl\110\av.h"\
	"..\..\..\..\include\perl\110\config.h"\
	"..\..\..\..\include\perl\110\cop.h"\
	"..\..\..\..\include\perl\110\cv.h"\
	"..\..\..\..\include\perl\110\dirent.h"\
	"..\..\..\..\include\perl\110\dosish.h"\
	"..\..\..\..\include\perl\110\embed.h"\
	"..\..\..\..\include\perl\110\EXTERN.h"\
	"..\..\..\..\include\perl\110\form.h"\
	"..\..\..\..\include\perl\110\gv.h"\
	"..\..\..\..\include\perl\110\handy.h"\
	"..\..\..\..\include\perl\110\hv.h"\
	"..\..\..\..\include\perl\110\IPerlSup.h"\
	"..\..\..\..\include\perl\110\mg.h"\
	"..\..\..\..\include\perl\110\nt.h"\
	"..\..\..\..\include\perl\110\ntpp.h"\
	"..\..\..\..\include\perl\110\ntxsub.h"\
	"..\..\..\..\include\perl\110\op.h"\
	"..\..\..\..\include\perl\110\opcode.h"\
	"..\..\..\..\include\perl\110\perl.h"\
	"..\..\..\..\include\perl\110\perllib.h"\
	"..\..\..\..\include\perl\110\perly.h"\
	"..\..\..\..\include\perl\110\pp.h"\
	"..\..\..\..\include\perl\110\proto.h"\
	"..\..\..\..\include\perl\110\regexp.h"\
	"..\..\..\..\include\perl\110\scope.h"\
	"..\..\..\..\include\perl\110\sv.h"\
	"..\..\..\..\include\perl\110\unixish.h"\
	"..\..\..\..\include\perl\110\util.h"\
	"..\..\..\..\include\perl\110\XSUB.h"\
	".\CPIPE.HPP"\
	".\PIPE.H"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_CPIPE=\
	"..\..\..\..\include\perl\110\vmsish.h"\
	

"$(INTDIR)\CPIPE.OBJ" : $(SOURCE) $(DEP_CPP_CPIPE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Pipe - Win32 Build 110 Debug"

DEP_CPP_CPIPE=\
	"..\..\..\..\include\perl\110\av.h"\
	"..\..\..\..\include\perl\110\config.h"\
	"..\..\..\..\include\perl\110\cop.h"\
	"..\..\..\..\include\perl\110\cv.h"\
	"..\..\..\..\include\perl\110\dirent.h"\
	"..\..\..\..\include\perl\110\dosish.h"\
	"..\..\..\..\include\perl\110\embed.h"\
	"..\..\..\..\include\perl\110\EXTERN.h"\
	"..\..\..\..\include\perl\110\form.h"\
	"..\..\..\..\include\perl\110\gv.h"\
	"..\..\..\..\include\perl\110\handy.h"\
	"..\..\..\..\include\perl\110\hv.h"\
	"..\..\..\..\include\perl\110\IPerlSup.h"\
	"..\..\..\..\include\perl\110\mg.h"\
	"..\..\..\..\include\perl\110\nt.h"\
	"..\..\..\..\include\perl\110\ntpp.h"\
	"..\..\..\..\include\perl\110\ntxsub.h"\
	"..\..\..\..\include\perl\110\op.h"\
	"..\..\..\..\include\perl\110\opcode.h"\
	"..\..\..\..\include\perl\110\perl.h"\
	"..\..\..\..\include\perl\110\perllib.h"\
	"..\..\..\..\include\perl\110\perly.h"\
	"..\..\..\..\include\perl\110\pp.h"\
	"..\..\..\..\include\perl\110\proto.h"\
	"..\..\..\..\include\perl\110\regexp.h"\
	"..\..\..\..\include\perl\110\scope.h"\
	"..\..\..\..\include\perl\110\sv.h"\
	"..\..\..\..\include\perl\110\unixish.h"\
	"..\..\..\..\include\perl\110\util.h"\
	"..\..\..\..\include\perl\110\XSUB.h"\
	".\CPIPE.HPP"\
	".\PIPE.H"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_CPIPE=\
	"..\..\..\..\include\perl\110\vmsish.h"\
	

"$(INTDIR)\CPIPE.OBJ" : $(SOURCE) $(DEP_CPP_CPIPE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Pipe - Win32 Release"

DEP_CPP_CPIPE=\
	"..\..\..\..\include\perl\av.h"\
	"..\..\..\..\include\perl\build.h"\
	"..\..\..\..\include\perl\config.h"\
	"..\..\..\..\include\perl\cop.h"\
	"..\..\..\..\include\perl\cv.h"\
	"..\..\..\..\include\perl\dirent.h"\
	"..\..\..\..\include\perl\dosish.h"\
	"..\..\..\..\include\perl\embed.h"\
	"..\..\..\..\include\perl\EXTERN.h"\
	"..\..\..\..\include\perl\form.h"\
	"..\..\..\..\include\perl\gv.h"\
	"..\..\..\..\include\perl\handy.h"\
	"..\..\..\..\include\perl\hv.h"\
	"..\..\..\..\include\perl\IPerlSup.h"\
	"..\..\..\..\include\perl\mg.h"\
	"..\..\..\..\include\perl\nostdio.h"\
	"..\..\..\..\include\perl\nt.h"\
	"..\..\..\..\include\perl\ntxsub.h"\
	"..\..\..\..\include\perl\objpp.h"\
	"..\..\..\..\include\perl\op.h"\
	"..\..\..\..\include\perl\opcode.h"\
	"..\..\..\..\include\perl\perl.h"\
	"..\..\..\..\include\perl\perlio.h"\
	"..\..\..\..\include\perl\perlLib.h"\
	"..\..\..\..\include\perl\perlsdio.h"\
	"..\..\..\..\include\perl\perlsfio.h"\
	"..\..\..\..\include\perl\perly.h"\
	"..\..\..\..\include\perl\pp.h"\
	"..\..\..\..\include\perl\proto.h"\
	"..\..\..\..\include\perl\regexp.h"\
	"..\..\..\..\include\perl\scope.h"\
	"..\..\..\..\include\perl\sv.h"\
	"..\..\..\..\include\perl\unixish.h"\
	"..\..\..\..\include\perl\util.h"\
	"..\..\..\..\include\perl\XSUB.h"\
	".\CPIPE.HPP"\
	".\PIPE.H"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_CPIPE=\
	"..\..\..\..\include\perl\os2ish.h"\
	"..\..\..\..\include\perl\plan9\plan9ish.h"\
	"..\..\..\..\include\perl\vmsish.h"\
	

"$(INTDIR)\CPIPE.OBJ" : $(SOURCE) $(DEP_CPP_CPIPE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Pipe - Win32 Debug"

DEP_CPP_CPIPE=\
	"..\..\..\..\include\perl\av.h"\
	"..\..\..\..\include\perl\build.h"\
	"..\..\..\..\include\perl\config.h"\
	"..\..\..\..\include\perl\cop.h"\
	"..\..\..\..\include\perl\cv.h"\
	"..\..\..\..\include\perl\dirent.h"\
	"..\..\..\..\include\perl\dosish.h"\
	"..\..\..\..\include\perl\embed.h"\
	"..\..\..\..\include\perl\EXTERN.h"\
	"..\..\..\..\include\perl\form.h"\
	"..\..\..\..\include\perl\gv.h"\
	"..\..\..\..\include\perl\handy.h"\
	"..\..\..\..\include\perl\hv.h"\
	"..\..\..\..\include\perl\IPerlSup.h"\
	"..\..\..\..\include\perl\mg.h"\
	"..\..\..\..\include\perl\nostdio.h"\
	"..\..\..\..\include\perl\nt.h"\
	"..\..\..\..\include\perl\ntxsub.h"\
	"..\..\..\..\include\perl\objpp.h"\
	"..\..\..\..\include\perl\op.h"\
	"..\..\..\..\include\perl\opcode.h"\
	"..\..\..\..\include\perl\perl.h"\
	"..\..\..\..\include\perl\perlio.h"\
	"..\..\..\..\include\perl\perlLib.h"\
	"..\..\..\..\include\perl\perlsdio.h"\
	"..\..\..\..\include\perl\perlsfio.h"\
	"..\..\..\..\include\perl\perly.h"\
	"..\..\..\..\include\perl\pp.h"\
	"..\..\..\..\include\perl\proto.h"\
	"..\..\..\..\include\perl\regexp.h"\
	"..\..\..\..\include\perl\scope.h"\
	"..\..\..\..\include\perl\sv.h"\
	"..\..\..\..\include\perl\unixish.h"\
	"..\..\..\..\include\perl\util.h"\
	"..\..\..\..\include\perl\XSUB.h"\
	".\CPIPE.HPP"\
	".\PIPE.H"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_CPIPE=\
	"..\..\..\..\include\perl\os2ish.h"\
	"..\..\..\..\include\perl\plan9\plan9ish.h"\
	"..\..\..\..\include\perl\vmsish.h"\
	

"$(INTDIR)\CPIPE.OBJ" : $(SOURCE) $(DEP_CPP_CPIPE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Pipe - Win32 307 Release"

DEP_CPP_CPIPE=\
	"..\..\..\..\include\perl\307\av.h"\
	"..\..\..\..\include\perl\307\build.h"\
	"..\..\..\..\include\perl\307\config.h"\
	"..\..\..\..\include\perl\307\cop.h"\
	"..\..\..\..\include\perl\307\cv.h"\
	"..\..\..\..\include\perl\307\dosish.h"\
	"..\..\..\..\include\perl\307\embed.h"\
	"..\..\..\..\include\perl\307\extern.h"\
	"..\..\..\..\include\perl\307\form.h"\
	"..\..\..\..\include\perl\307\gv.h"\
	"..\..\..\..\include\perl\307\handy.h"\
	"..\..\..\..\include\perl\307\hv.h"\
	"..\..\..\..\include\perl\307\inc\dirent.h"\
	"..\..\..\..\include\perl\307\iperlsup.h"\
	"..\..\..\..\include\perl\307\mg.h"\
	"..\..\..\..\include\perl\307\nt.h"\
	"..\..\..\..\include\perl\307\ntxsub.h"\
	"..\..\..\..\include\perl\307\objpp.h"\
	"..\..\..\..\include\perl\307\op.h"\
	"..\..\..\..\include\perl\307\opcode.h"\
	"..\..\..\..\include\perl\307\perl.h"\
	"..\..\..\..\include\perl\307\perlio.h"\
	"..\..\..\..\include\perl\307\perllib.h"\
	"..\..\..\..\include\perl\307\perlsdio.h"\
	"..\..\..\..\include\perl\307\perly.h"\
	"..\..\..\..\include\perl\307\pp.h"\
	"..\..\..\..\include\perl\307\proto.h"\
	"..\..\..\..\include\perl\307\regexp.h"\
	"..\..\..\..\include\perl\307\scope.h"\
	"..\..\..\..\include\perl\307\sv.h"\
	"..\..\..\..\include\perl\307\util.h"\
	"..\..\..\..\include\perl\307\xsub.h"\
	".\CPIPE.HPP"\
	".\PIPE.H"\
	

"$(INTDIR)\CPIPE.OBJ" : $(SOURCE) $(DEP_CPP_CPIPE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Pipe - Win32 311 Release"

DEP_CPP_CPIPE=\
	"..\..\..\..\include\perl\311\av.h"\
	"..\..\..\..\include\perl\311\build.h"\
	"..\..\..\..\include\perl\311\config.h"\
	"..\..\..\..\include\perl\311\cop.h"\
	"..\..\..\..\include\perl\311\cv.h"\
	"..\..\..\..\include\perl\311\dosish.h"\
	"..\..\..\..\include\perl\311\embed.h"\
	"..\..\..\..\include\perl\311\extern.h"\
	"..\..\..\..\include\perl\311\form.h"\
	"..\..\..\..\include\perl\311\gv.h"\
	"..\..\..\..\include\perl\311\handy.h"\
	"..\..\..\..\include\perl\311\hv.h"\
	"..\..\..\..\include\perl\311\inc\dirent.h"\
	"..\..\..\..\include\perl\311\iperlsup.h"\
	"..\..\..\..\include\perl\311\mg.h"\
	"..\..\..\..\include\perl\311\nt.h"\
	"..\..\..\..\include\perl\311\ntxsub.h"\
	"..\..\..\..\include\perl\311\objpp.h"\
	"..\..\..\..\include\perl\311\op.h"\
	"..\..\..\..\include\perl\311\opcode.h"\
	"..\..\..\..\include\perl\311\perl.h"\
	"..\..\..\..\include\perl\311\perlio.h"\
	"..\..\..\..\include\perl\311\perllib.h"\
	"..\..\..\..\include\perl\311\perlsdio.h"\
	"..\..\..\..\include\perl\311\perly.h"\
	"..\..\..\..\include\perl\311\pp.h"\
	"..\..\..\..\include\perl\311\proto.h"\
	"..\..\..\..\include\perl\311\regexp.h"\
	"..\..\..\..\include\perl\311\scope.h"\
	"..\..\..\..\include\perl\311\sv.h"\
	"..\..\..\..\include\perl\311\util.h"\
	"..\..\..\..\include\perl\311\xsub.h"\
	".\CPIPE.HPP"\
	".\PIPE.H"\
	

"$(INTDIR)\CPIPE.OBJ" : $(SOURCE) $(DEP_CPP_CPIPE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Pipe - Win32 Core Release"

DEP_CPP_CPIPE=\
	"..\..\..\..\include\perl\core\av.h"\
	"..\..\..\..\include\perl\core\config.h"\
	"..\..\..\..\include\perl\core\cop.h"\
	"..\..\..\..\include\perl\core\cv.h"\
	"..\..\..\..\include\perl\core\dirent.h"\
	"..\..\..\..\include\perl\core\dosish.h"\
	"..\..\..\..\include\perl\core\embed.h"\
	"..\..\..\..\include\perl\core\extern.h"\
	"..\..\..\..\include\perl\core\form.h"\
	"..\..\..\..\include\perl\core\gv.h"\
	"..\..\..\..\include\perl\core\handy.h"\
	"..\..\..\..\include\perl\core\hv.h"\
	"..\..\..\..\include\perl\core\mg.h"\
	"..\..\..\..\include\perl\core\netdb.h"\
	"..\..\..\..\include\perl\core\op.h"\
	"..\..\..\..\include\perl\core\opcode.h"\
	"..\..\..\..\include\perl\core\perl.h"\
	"..\..\..\..\include\perl\core\perlio.h"\
	"..\..\..\..\include\perl\core\perlsdio.h"\
	"..\..\..\..\include\perl\core\perly.h"\
	"..\..\..\..\include\perl\core\pp.h"\
	"..\..\..\..\include\perl\core\proto.h"\
	"..\..\..\..\include\perl\core\regexp.h"\
	"..\..\..\..\include\perl\core\scope.h"\
	"..\..\..\..\include\perl\core\sv.h"\
	"..\..\..\..\include\perl\core\sys\socket.h"\
	"..\..\..\..\include\perl\core\util.h"\
	"..\..\..\..\include\perl\core\win32.h"\
	"..\..\..\..\include\perl\core\win32io.h"\
	"..\..\..\..\include\perl\core\win32iop.h"\
	"..\..\..\..\include\perl\core\xsub.h"\
	".\CPIPE.HPP"\
	".\PIPE.H"\
	

"$(INTDIR)\CPIPE.OBJ" : $(SOURCE) $(DEP_CPP_CPIPE) "$(INTDIR)"


!ENDIF 

SOURCE=.\PIPE.CPP

!IF  "$(CFG)" == "Pipe - Win32 Build 110 Release"

DEP_CPP_PIPE_=\
	"..\..\..\..\include\perl\110\av.h"\
	"..\..\..\..\include\perl\110\config.h"\
	"..\..\..\..\include\perl\110\cop.h"\
	"..\..\..\..\include\perl\110\cv.h"\
	"..\..\..\..\include\perl\110\dirent.h"\
	"..\..\..\..\include\perl\110\dosish.h"\
	"..\..\..\..\include\perl\110\embed.h"\
	"..\..\..\..\include\perl\110\EXTERN.h"\
	"..\..\..\..\include\perl\110\form.h"\
	"..\..\..\..\include\perl\110\gv.h"\
	"..\..\..\..\include\perl\110\handy.h"\
	"..\..\..\..\include\perl\110\hv.h"\
	"..\..\..\..\include\perl\110\IPerlSup.h"\
	"..\..\..\..\include\perl\110\mg.h"\
	"..\..\..\..\include\perl\110\nt.h"\
	"..\..\..\..\include\perl\110\ntpp.h"\
	"..\..\..\..\include\perl\110\ntxsub.h"\
	"..\..\..\..\include\perl\110\op.h"\
	"..\..\..\..\include\perl\110\opcode.h"\
	"..\..\..\..\include\perl\110\perl.h"\
	"..\..\..\..\include\perl\110\perllib.h"\
	"..\..\..\..\include\perl\110\perly.h"\
	"..\..\..\..\include\perl\110\pp.h"\
	"..\..\..\..\include\perl\110\proto.h"\
	"..\..\..\..\include\perl\110\regexp.h"\
	"..\..\..\..\include\perl\110\scope.h"\
	"..\..\..\..\include\perl\110\sv.h"\
	"..\..\..\..\include\perl\110\unixish.h"\
	"..\..\..\..\include\perl\110\util.h"\
	"..\..\..\..\include\perl\110\XSUB.h"\
	".\CPIPE.HPP"\
	".\PIPE.H"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\..\..\include\perl\110\vmsish.h"\
	

"$(INTDIR)\PIPE.OBJ" : $(SOURCE) $(DEP_CPP_PIPE_) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Pipe - Win32 Build 110 Debug"

DEP_CPP_PIPE_=\
	"..\..\..\..\include\perl\110\av.h"\
	"..\..\..\..\include\perl\110\config.h"\
	"..\..\..\..\include\perl\110\cop.h"\
	"..\..\..\..\include\perl\110\cv.h"\
	"..\..\..\..\include\perl\110\dirent.h"\
	"..\..\..\..\include\perl\110\dosish.h"\
	"..\..\..\..\include\perl\110\embed.h"\
	"..\..\..\..\include\perl\110\EXTERN.h"\
	"..\..\..\..\include\perl\110\form.h"\
	"..\..\..\..\include\perl\110\gv.h"\
	"..\..\..\..\include\perl\110\handy.h"\
	"..\..\..\..\include\perl\110\hv.h"\
	"..\..\..\..\include\perl\110\IPerlSup.h"\
	"..\..\..\..\include\perl\110\mg.h"\
	"..\..\..\..\include\perl\110\nt.h"\
	"..\..\..\..\include\perl\110\ntpp.h"\
	"..\..\..\..\include\perl\110\ntxsub.h"\
	"..\..\..\..\include\perl\110\op.h"\
	"..\..\..\..\include\perl\110\opcode.h"\
	"..\..\..\..\include\perl\110\perl.h"\
	"..\..\..\..\include\perl\110\perllib.h"\
	"..\..\..\..\include\perl\110\perly.h"\
	"..\..\..\..\include\perl\110\pp.h"\
	"..\..\..\..\include\perl\110\proto.h"\
	"..\..\..\..\include\perl\110\regexp.h"\
	"..\..\..\..\include\perl\110\scope.h"\
	"..\..\..\..\include\perl\110\sv.h"\
	"..\..\..\..\include\perl\110\unixish.h"\
	"..\..\..\..\include\perl\110\util.h"\
	"..\..\..\..\include\perl\110\XSUB.h"\
	".\CPIPE.HPP"\
	".\PIPE.H"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\..\..\include\perl\110\vmsish.h"\
	

"$(INTDIR)\PIPE.OBJ" : $(SOURCE) $(DEP_CPP_PIPE_) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Pipe - Win32 Release"

DEP_CPP_PIPE_=\
	"..\..\..\..\include\perl\av.h"\
	"..\..\..\..\include\perl\build.h"\
	"..\..\..\..\include\perl\config.h"\
	"..\..\..\..\include\perl\cop.h"\
	"..\..\..\..\include\perl\cv.h"\
	"..\..\..\..\include\perl\dirent.h"\
	"..\..\..\..\include\perl\dosish.h"\
	"..\..\..\..\include\perl\embed.h"\
	"..\..\..\..\include\perl\EXTERN.h"\
	"..\..\..\..\include\perl\form.h"\
	"..\..\..\..\include\perl\gv.h"\
	"..\..\..\..\include\perl\handy.h"\
	"..\..\..\..\include\perl\hv.h"\
	"..\..\..\..\include\perl\IPerlSup.h"\
	"..\..\..\..\include\perl\mg.h"\
	"..\..\..\..\include\perl\nostdio.h"\
	"..\..\..\..\include\perl\nt.h"\
	"..\..\..\..\include\perl\ntxsub.h"\
	"..\..\..\..\include\perl\objpp.h"\
	"..\..\..\..\include\perl\op.h"\
	"..\..\..\..\include\perl\opcode.h"\
	"..\..\..\..\include\perl\perl.h"\
	"..\..\..\..\include\perl\perlio.h"\
	"..\..\..\..\include\perl\perlLib.h"\
	"..\..\..\..\include\perl\perlsdio.h"\
	"..\..\..\..\include\perl\perlsfio.h"\
	"..\..\..\..\include\perl\perly.h"\
	"..\..\..\..\include\perl\pp.h"\
	"..\..\..\..\include\perl\proto.h"\
	"..\..\..\..\include\perl\regexp.h"\
	"..\..\..\..\include\perl\scope.h"\
	"..\..\..\..\include\perl\sv.h"\
	"..\..\..\..\include\perl\unixish.h"\
	"..\..\..\..\include\perl\util.h"\
	"..\..\..\..\include\perl\XSUB.h"\
	".\CPIPE.HPP"\
	".\PIPE.H"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\..\..\include\perl\os2ish.h"\
	"..\..\..\..\include\perl\plan9\plan9ish.h"\
	"..\..\..\..\include\perl\vmsish.h"\
	

"$(INTDIR)\PIPE.OBJ" : $(SOURCE) $(DEP_CPP_PIPE_) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Pipe - Win32 Debug"

DEP_CPP_PIPE_=\
	"..\..\..\..\include\perl\av.h"\
	"..\..\..\..\include\perl\build.h"\
	"..\..\..\..\include\perl\config.h"\
	"..\..\..\..\include\perl\cop.h"\
	"..\..\..\..\include\perl\cv.h"\
	"..\..\..\..\include\perl\dirent.h"\
	"..\..\..\..\include\perl\dosish.h"\
	"..\..\..\..\include\perl\embed.h"\
	"..\..\..\..\include\perl\EXTERN.h"\
	"..\..\..\..\include\perl\form.h"\
	"..\..\..\..\include\perl\gv.h"\
	"..\..\..\..\include\perl\handy.h"\
	"..\..\..\..\include\perl\hv.h"\
	"..\..\..\..\include\perl\IPerlSup.h"\
	"..\..\..\..\include\perl\mg.h"\
	"..\..\..\..\include\perl\nostdio.h"\
	"..\..\..\..\include\perl\nt.h"\
	"..\..\..\..\include\perl\ntxsub.h"\
	"..\..\..\..\include\perl\objpp.h"\
	"..\..\..\..\include\perl\op.h"\
	"..\..\..\..\include\perl\opcode.h"\
	"..\..\..\..\include\perl\perl.h"\
	"..\..\..\..\include\perl\perlio.h"\
	"..\..\..\..\include\perl\perlLib.h"\
	"..\..\..\..\include\perl\perlsdio.h"\
	"..\..\..\..\include\perl\perlsfio.h"\
	"..\..\..\..\include\perl\perly.h"\
	"..\..\..\..\include\perl\pp.h"\
	"..\..\..\..\include\perl\proto.h"\
	"..\..\..\..\include\perl\regexp.h"\
	"..\..\..\..\include\perl\scope.h"\
	"..\..\..\..\include\perl\sv.h"\
	"..\..\..\..\include\perl\unixish.h"\
	"..\..\..\..\include\perl\util.h"\
	"..\..\..\..\include\perl\XSUB.h"\
	".\CPIPE.HPP"\
	".\PIPE.H"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_PIPE_=\
	"..\..\..\..\include\perl\os2ish.h"\
	"..\..\..\..\include\perl\plan9\plan9ish.h"\
	"..\..\..\..\include\perl\vmsish.h"\
	

"$(INTDIR)\PIPE.OBJ" : $(SOURCE) $(DEP_CPP_PIPE_) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Pipe - Win32 307 Release"

DEP_CPP_PIPE_=\
	"..\..\..\..\include\perl\307\av.h"\
	"..\..\..\..\include\perl\307\build.h"\
	"..\..\..\..\include\perl\307\config.h"\
	"..\..\..\..\include\perl\307\cop.h"\
	"..\..\..\..\include\perl\307\cv.h"\
	"..\..\..\..\include\perl\307\dosish.h"\
	"..\..\..\..\include\perl\307\embed.h"\
	"..\..\..\..\include\perl\307\extern.h"\
	"..\..\..\..\include\perl\307\form.h"\
	"..\..\..\..\include\perl\307\gv.h"\
	"..\..\..\..\include\perl\307\handy.h"\
	"..\..\..\..\include\perl\307\hv.h"\
	"..\..\..\..\include\perl\307\inc\dirent.h"\
	"..\..\..\..\include\perl\307\iperlsup.h"\
	"..\..\..\..\include\perl\307\mg.h"\
	"..\..\..\..\include\perl\307\nt.h"\
	"..\..\..\..\include\perl\307\ntxsub.h"\
	"..\..\..\..\include\perl\307\objpp.h"\
	"..\..\..\..\include\perl\307\op.h"\
	"..\..\..\..\include\perl\307\opcode.h"\
	"..\..\..\..\include\perl\307\perl.h"\
	"..\..\..\..\include\perl\307\perlio.h"\
	"..\..\..\..\include\perl\307\perllib.h"\
	"..\..\..\..\include\perl\307\perlsdio.h"\
	"..\..\..\..\include\perl\307\perly.h"\
	"..\..\..\..\include\perl\307\pp.h"\
	"..\..\..\..\include\perl\307\proto.h"\
	"..\..\..\..\include\perl\307\regexp.h"\
	"..\..\..\..\include\perl\307\scope.h"\
	"..\..\..\..\include\perl\307\sv.h"\
	"..\..\..\..\include\perl\307\util.h"\
	"..\..\..\..\include\perl\307\xsub.h"\
	".\CPIPE.HPP"\
	".\PIPE.H"\
	

"$(INTDIR)\PIPE.OBJ" : $(SOURCE) $(DEP_CPP_PIPE_) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Pipe - Win32 311 Release"

DEP_CPP_PIPE_=\
	"..\..\..\..\include\perl\311\av.h"\
	"..\..\..\..\include\perl\311\build.h"\
	"..\..\..\..\include\perl\311\config.h"\
	"..\..\..\..\include\perl\311\cop.h"\
	"..\..\..\..\include\perl\311\cv.h"\
	"..\..\..\..\include\perl\311\dosish.h"\
	"..\..\..\..\include\perl\311\embed.h"\
	"..\..\..\..\include\perl\311\extern.h"\
	"..\..\..\..\include\perl\311\form.h"\
	"..\..\..\..\include\perl\311\gv.h"\
	"..\..\..\..\include\perl\311\handy.h"\
	"..\..\..\..\include\perl\311\hv.h"\
	"..\..\..\..\include\perl\311\inc\dirent.h"\
	"..\..\..\..\include\perl\311\iperlsup.h"\
	"..\..\..\..\include\perl\311\mg.h"\
	"..\..\..\..\include\perl\311\nt.h"\
	"..\..\..\..\include\perl\311\ntxsub.h"\
	"..\..\..\..\include\perl\311\objpp.h"\
	"..\..\..\..\include\perl\311\op.h"\
	"..\..\..\..\include\perl\311\opcode.h"\
	"..\..\..\..\include\perl\311\perl.h"\
	"..\..\..\..\include\perl\311\perlio.h"\
	"..\..\..\..\include\perl\311\perllib.h"\
	"..\..\..\..\include\perl\311\perlsdio.h"\
	"..\..\..\..\include\perl\311\perly.h"\
	"..\..\..\..\include\perl\311\pp.h"\
	"..\..\..\..\include\perl\311\proto.h"\
	"..\..\..\..\include\perl\311\regexp.h"\
	"..\..\..\..\include\perl\311\scope.h"\
	"..\..\..\..\include\perl\311\sv.h"\
	"..\..\..\..\include\perl\311\util.h"\
	"..\..\..\..\include\perl\311\xsub.h"\
	".\CPIPE.HPP"\
	".\PIPE.H"\
	

"$(INTDIR)\PIPE.OBJ" : $(SOURCE) $(DEP_CPP_PIPE_) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Pipe - Win32 Core Release"

DEP_CPP_PIPE_=\
	"..\..\..\..\include\perl\core\av.h"\
	"..\..\..\..\include\perl\core\config.h"\
	"..\..\..\..\include\perl\core\cop.h"\
	"..\..\..\..\include\perl\core\cv.h"\
	"..\..\..\..\include\perl\core\dirent.h"\
	"..\..\..\..\include\perl\core\dosish.h"\
	"..\..\..\..\include\perl\core\embed.h"\
	"..\..\..\..\include\perl\core\extern.h"\
	"..\..\..\..\include\perl\core\form.h"\
	"..\..\..\..\include\perl\core\gv.h"\
	"..\..\..\..\include\perl\core\handy.h"\
	"..\..\..\..\include\perl\core\hv.h"\
	"..\..\..\..\include\perl\core\mg.h"\
	"..\..\..\..\include\perl\core\netdb.h"\
	"..\..\..\..\include\perl\core\op.h"\
	"..\..\..\..\include\perl\core\opcode.h"\
	"..\..\..\..\include\perl\core\perl.h"\
	"..\..\..\..\include\perl\core\perlio.h"\
	"..\..\..\..\include\perl\core\perlsdio.h"\
	"..\..\..\..\include\perl\core\perly.h"\
	"..\..\..\..\include\perl\core\pp.h"\
	"..\..\..\..\include\perl\core\proto.h"\
	"..\..\..\..\include\perl\core\regexp.h"\
	"..\..\..\..\include\perl\core\scope.h"\
	"..\..\..\..\include\perl\core\sv.h"\
	"..\..\..\..\include\perl\core\sys\socket.h"\
	"..\..\..\..\include\perl\core\util.h"\
	"..\..\..\..\include\perl\core\win32.h"\
	"..\..\..\..\include\perl\core\win32io.h"\
	"..\..\..\..\include\perl\core\win32iop.h"\
	"..\..\..\..\include\perl\core\xsub.h"\
	".\CPIPE.HPP"\
	".\PIPE.H"\
	

"$(INTDIR)\PIPE.OBJ" : $(SOURCE) $(DEP_CPP_PIPE_) "$(INTDIR)"


!ENDIF 

SOURCE=.\pipe.rc

!IF  "$(CFG)" == "Pipe - Win32 Build 110 Release"

DEP_RSC_PIPE_R=\
	"..\..\..\..\include\perl\110\build.h"\
	".\pipe.ico"\
	".\pipebuild.h"\
	

"$(INTDIR)\pipe.res" : $(SOURCE) $(DEP_RSC_PIPE_R) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Pipe - Win32 Build 110 Debug"

DEP_RSC_PIPE_R=\
	"..\..\..\..\include\perl\110\build.h"\
	".\pipe.ico"\
	".\pipebuild.h"\
	

"$(INTDIR)\pipe.res" : $(SOURCE) $(DEP_RSC_PIPE_R) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Pipe - Win32 Release"

DEP_RSC_PIPE_R=\
	"..\..\..\..\include\perl\build.h"\
	".\pipe.ico"\
	".\pipebuild.h"\
	

"$(INTDIR)\pipe.res" : $(SOURCE) $(DEP_RSC_PIPE_R) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Pipe - Win32 Debug"

DEP_RSC_PIPE_R=\
	"..\..\..\..\include\perl\build.h"\
	".\pipe.ico"\
	".\pipebuild.h"\
	

"$(INTDIR)\pipe.res" : $(SOURCE) $(DEP_RSC_PIPE_R) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Pipe - Win32 307 Release"

DEP_RSC_PIPE_R=\
	"..\..\..\..\include\perl\307\build.h"\
	".\pipe.ico"\
	".\pipebuild.h"\
	

".\pipe.res" : $(SOURCE) $(DEP_RSC_PIPE_R) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Pipe - Win32 311 Release"

DEP_RSC_PIPE_R=\
	"..\..\..\..\include\perl\311\build.h"\
	".\pipe.ico"\
	".\pipebuild.h"\
	

".\pipe.res" : $(SOURCE) $(DEP_RSC_PIPE_R) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Pipe - Win32 Core Release"

DEP_RSC_PIPE_R=\
	"..\..\..\..\include\perl\core\build.h"\
	".\pipe.ico"\
	".\pipebuild.h"\
	

".\pipe.res" : $(SOURCE) $(DEP_RSC_PIPE_R) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ENDIF 


!ENDIF 

