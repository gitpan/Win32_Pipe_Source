@echo off

    echo Starting the Pipe Server...
    start "Win32::Pipe Server" perl testsr.pl


    echo Starting the Pipe Client...
    start "Win32::Pipe Client" perl testcl.pl
