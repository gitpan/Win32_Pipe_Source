# Microsoft Developer Studio Project File - Name="Pipe" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 5.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=Pipe - Win32 Build 110 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "Pipe.mak".
!MESSAGE 
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

# Begin Project
# PROP Scc_ProjName ""$/Win Pipe", RSBAAAAA"
# PROP Scc_LocalPath "."
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "Pipe - Win32 Build 110 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WinRel"
# PROP BASE Intermediate_Dir "WinRel"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "WinRel"
# PROP Intermediate_Dir "e:\temp\out"
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /FR /YX /c
# ADD CPP /nologo /G4 /MT /W3 /GX /O1 /I "s:\include\perl\110" /I "s:\include\perl\110\inc" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /FD /c
# SUBTRACT CPP /Fr /YX
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /i "s:\include\perl\110" /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /machine:I386
# ADD LINK32 netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /pdb:none /machine:I386 /force /out:"c:\perl\110\lib\auto\Win32\pipe\PIPE.PLL"
# SUBTRACT LINK32 /verbose

!ELSEIF  "$(CFG)" == "Pipe - Win32 Build 110 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "WinDebug"
# PROP BASE Intermediate_Dir "WinDebug"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "WinDebug"
# PROP Intermediate_Dir "e:\temp\out"
# ADD BASE CPP /nologo /MT /W3 /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /YX /c
# ADD CPP /nologo /G4 /MTd /W3 /Gm /GX /Zi /Od /I "s:\include\perl\110" /I "s:\include\perl\110\inc" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /FD /c
# SUBTRACT CPP /Fr
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /i "s:\include\perl\110" /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /debug /machine:I386
# ADD LINK32 netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /base:"0x101f0000" /subsystem:windows /dll /debug /machine:I386 /force /out:"c:\perl\110\lib\auto\Win32\pipe\PIPE.PLL"

!ELSEIF  "$(CFG)" == "Pipe - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Perl_5_0"
# PROP BASE Intermediate_Dir "Perl_5_0"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ""
# PROP Intermediate_Dir ""
# PROP Ignore_Export_Lib 0
# ADD BASE CPP /nologo /G4 /MT /W3 /GX /O1 /I "s:\include\perl" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /FR /c
# SUBTRACT BASE CPP /YX
# ADD CPP /nologo /G4 /MT /W3 /GX /O1 /I "s:\include\perl" /I "s:\include\perl\inc" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "MSWIN32" /D "EMBED" /D "PERL_OBJECT" /FD /c
# SUBTRACT CPP /Fr /YX
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /i "s:\include\perl" /d "NDEBUG" /d "MSWIN32" /d "EMBED" /d "PERL_OBJECT"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib advapi32.lib netapi32.lib /nologo /subsystem:windows /dll /pdb:none /machine:I386 /force /out:"c:\perl\lib\auto\Win32\pipe\PIPE.PLL"
# SUBTRACT BASE LINK32 /verbose
# ADD LINK32 netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib /nologo /subsystem:windows /dll /pdb:none /machine:I386 /force /out:"c:\perl\lib\auto\Win32\pipe\PIPE.PLL" /libpath:"c:\source\include\perl"
# SUBTRACT LINK32 /verbose

!ELSEIF  "$(CFG)" == "Pipe - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Perl_5_1"
# PROP BASE Intermediate_Dir "Perl_5_1"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ""
# PROP Intermediate_Dir ""
# PROP Ignore_Export_Lib 0
# ADD BASE CPP /nologo /MT /W3 /GX /Zi /Od /I "s:\include\perl" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /YX /c
# ADD CPP /nologo /G4 /MTd /W3 /Gm /GX /Zi /Od /I "s:\include\perl" /I "s:\include\perl\inc" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "MSWIN32" /D "EMBED" /D "PERL_OBJECT" /YX /FD /c
# SUBTRACT CPP /Fr
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /i "s:\include\perl" /d "_DEBUG" /d "PERL_OBJECT" /d "MSWIN32" /d "EMBED"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib advapi32.lib netapi32.lib odbc32.lib odbccp32.lib /nologo /base:"0x101f0000" /subsystem:windows /dll /debug /machine:I386 /force /out:"c:\perl\lib\auto\Win32\pipe\PIPE.PLL"
# ADD LINK32 netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib /nologo /base:"0x101f0000" /subsystem:windows /dll /debug /machine:I386 /force /out:"c:\perl\lib\auto\Win32\pipe\PIPE.PLL" /libpath:"c:\source\include\perl"

!ELSEIF  "$(CFG)" == "Pipe - Win32 307 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Pipe___1"
# PROP BASE Intermediate_Dir "Pipe___1"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Pipe___1"
# PROP Intermediate_Dir "Pipe___1"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /G4 /MT /W3 /GX /O1 /I "s:\include\perl\307" /I "s:\include\perl\307\inc" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "MSWIN32" /D "EMBED" /D "PERL_OBJECT" /FD /c
# SUBTRACT BASE CPP /Fr /YX
# ADD CPP /nologo /G4 /MT /W3 /GX /O1 /I "s:\include\perl\307" /I "s:\include\perl\307\inc" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "MSWIN32" /D "EMBED" /D "PERL_OBJECT" /FD /c
# SUBTRACT CPP /Fr /YX
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /fo"pipe.res" /i "s:\include\perl\307" /i "s:\include\perl\307\inc" /d "NDEBUG" /d "MSWIN32" /d "EMBED" /d "PERL_OBJECT"
# ADD RSC /l 0x409 /fo"pipe.res" /i "s:\include\perl\307" /i "s:\include\perl\307\inc" /d "NDEBUG" /d "MSWIN32" /d "EMBED" /d "PERL_OBJECT"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib /nologo /subsystem:windows /dll /pdb:none /machine:I386 /force /out:"bin/PIPE_307.PLL" /libpath:"c:\source\include\perl"
# SUBTRACT BASE LINK32 /verbose
# ADD LINK32 netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib /nologo /subsystem:windows /dll /pdb:none /machine:I386 /force /out:"bin/PIPE_307.PLL" /libpath:"c:\source\include\perl"
# SUBTRACT LINK32 /verbose

!ELSEIF  "$(CFG)" == "Pipe - Win32 311 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Pipe___W"
# PROP BASE Intermediate_Dir "Pipe___W"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Pipe___W"
# PROP Intermediate_Dir "Pipe___W"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /G4 /MT /W3 /GX /O1 /I "s:\include\perl\311" /I "s:\include\perl\311\inc" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "MSWIN32" /D "EMBED" /D "PERL_OBJECT" /FD /c
# SUBTRACT BASE CPP /Fr /YX
# ADD CPP /nologo /G4 /MT /W3 /GX /O1 /I "s:\include\perl\311" /I "s:\include\perl\311\inc" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "MSWIN32" /D "EMBED" /D "PERL_OBJECT" /FD /c
# SUBTRACT CPP /Fr /YX
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /fo"pipe.res" /i "s:\include\perl\311" /d "NDEBUG" /d "MSWIN32" /d "EMBED" /d "PERL_OBJECT"
# ADD RSC /l 0x409 /fo"pipe.res" /i "s:\include\perl\311" /d "NDEBUG" /d "MSWIN32" /d "EMBED" /d "PERL_OBJECT"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib /nologo /subsystem:windows /dll /pdb:none /machine:I386 /force /out:"bin/PIPE_311.PLL" /libpath:"c:\source\include\perl"
# SUBTRACT BASE LINK32 /verbose
# ADD LINK32 netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib /nologo /subsystem:windows /dll /pdb:none /machine:I386 /force /out:"bin/PIPE_311.PLL" /libpath:"c:\source\include\perl"
# SUBTRACT LINK32 /verbose

!ELSEIF  "$(CFG)" == "Pipe - Win32 Core Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Pipe___0"
# PROP BASE Intermediate_Dir "Pipe___0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "g:\temp\out"
# PROP Intermediate_Dir "g:\temp\out"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /G4 /MT /W3 /GX /O1 /I "s:\include\perl\307" /I "s:\include\perl\307\inc" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "MSWIN32" /D "EMBED" /D "PERL_OBJECT" /FD /c
# SUBTRACT BASE CPP /Fr /YX
# ADD CPP /nologo /G4 /MT /W3 /GX /O1 /I "s:\include\perl\core" /I "s:\include\perl\core\inc" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /FD /c
# SUBTRACT CPP /Fr /YX
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /fo"pipe.res" /i "s:\include\perl\307" /i "s:\include\perl\307\inc" /d "NDEBUG" /d "MSWIN32" /d "EMBED" /d "PERL_OBJECT"
# ADD RSC /l 0x409 /fo"pipe.res" /i "s:\include\perl\core" /i "s:\include\perl\core\inc" /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib /nologo /subsystem:windows /dll /pdb:none /machine:I386 /force /out:"bin/PIPE_307.PLL" /libpath:"c:\source\include\perl"
# SUBTRACT BASE LINK32 /verbose
# ADD LINK32 LIBCMT.LIB perl.lib netapi32.lib kernel32.lib user32.lib advapi32.lib /nologo /subsystem:windows /dll /pdb:none /machine:I386 /force /out:"bin/PIPE_core.dll" /libpath:"s:\lib\perl\core"
# SUBTRACT LINK32 /verbose

!ENDIF 

# Begin Target

# Name "Pipe - Win32 Build 110 Release"
# Name "Pipe - Win32 Build 110 Debug"
# Name "Pipe - Win32 Release"
# Name "Pipe - Win32 Debug"
# Name "Pipe - Win32 307 Release"
# Name "Pipe - Win32 311 Release"
# Name "Pipe - Win32 Core Release"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\CPIPE.CPP
# End Source File
# Begin Source File

SOURCE=.\PIPE.CPP
# End Source File
# Begin Source File

SOURCE=.\PIPE.DEF
# End Source File
# Begin Source File

SOURCE=.\PIPE.PM
# End Source File
# Begin Source File

SOURCE=.\pipe.rc

!IF  "$(CFG)" == "Pipe - Win32 Build 110 Release"

!ELSEIF  "$(CFG)" == "Pipe - Win32 Build 110 Debug"

!ELSEIF  "$(CFG)" == "Pipe - Win32 Release"

!ELSEIF  "$(CFG)" == "Pipe - Win32 Debug"

!ELSEIF  "$(CFG)" == "Pipe - Win32 307 Release"

!ELSEIF  "$(CFG)" == "Pipe - Win32 311 Release"

!ELSEIF  "$(CFG)" == "Pipe - Win32 Core Release"

!ENDIF 

# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=.\CPIPE.HPP
# End Source File
# Begin Source File

SOURCE=.\PIPE.H
# End Source File
# Begin Source File

SOURCE=.\pipebuild.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\pipe.ico
# End Source File
# End Group
# End Target
# End Project
