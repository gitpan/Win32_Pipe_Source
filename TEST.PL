#       T E S T . P L
#       -------------
#       A test script for exercising the Win32::ODBC extension. Install
#       the ODBC.PLL extension and the ODBC.PM wrapper, set up an ODBC
#       DSN (Data Source Name) via the ODBC administrator, change the
#       $DSN = "xxx"; line (see below) to reflect your configured DSN
#       then give this a try!
#
#       READ THE DOCUMENTATION -- I AM NOT RESPOSIBLE FOR ANY PROBLEMS THAT
#       THIS MAY CAUSE WHATSOEVER.  BY USING THIS OR ANY  ---
#       OF THE WIN32::ODBC PARTS FOUND IN THE DISTRIBUTION YOU ARE AGREEING
#       WITH THE TERMS OF THIS DISTRIBUTION!!!!!
#
#       You have been warned.
#                                                       Dave Roth 96.03.28

    use Win32::ODBC;


    ####
    #   Change the "xxx" to be a quoted DSN.
    ####
    $DSN = "xxx" unless (($DSN) = @ARGV);

    $iWidth=60;
    %SQLStmtTypes = (SQL_CLOSE, "SQL_CLOSE", SQL_DROP, "SQL_DROP", SQL_UNBIND, "SQL_UNBIND", SQL_RESET_PARAMS, "SQL_RESET_PARAMS");

    ($Name, $Version, $Date, $Author, $CompileDate, $CompileTime, $Credits) = Win32::ODBC::Info();
    print "\n";
    print "\t+", "=" x ($iWidth), "+\n";
    print "\t|", Center("", $iWidth), "|\n";
    print "\t|", Center("", $iWidth), "|\n";
    print "\t|", Center("$Name", $iWidth), "|\n";
    print "\t|", Center("-" x length("$Name"), $iWidth), "|\n";
    print "\t|", Center("", $iWidth), "|\n";

    print "\t|", Center("Version $Version ($Date)", $iWidth), "|\n";
    print "\t|", Center("by $Author", $iWidth), "|\n";
    print "\t|", Center("Compiled on $CompileDate at $CompileTime.", $iWidth), "|\n";
    print "\t|", Center("", $iWidth), "|\n";
    print "\t|", Center("Credits:", $iWidth), "|\n";
    print "\t|", Center(("-" x length("Credits:")), $iWidth), "|\n";
    foreach $Temp (split("\n", $Credits)){
        print "\t|", Center("$Temp", $iWidth), "|\n";
    }
    print "\t|", Center("", $iWidth), "|\n";
    print "\t+", "=" x ($iWidth), "+\n";

####
#   T E S T  1
####
    print "\n------- T E S T  # 1  (Dump available ODBC Drivers) ----";
    print "\n-------                                             ----\n";
    print "\nAvailable ODBC Drivers:\n";
    %Temp =  Win32::ODBC::Drivers();
    foreach $Temp2 (keys(%Temp)){
        print "  Driver=\"$Temp2\"\n  Attributes=", join("\n" . " "x13, sort(split(';', $Temp{$Temp2}))), "\n\n";
    }


####
#   T E S T  2
####
    print "\n------- T E S T  # 2  (Dump available datasources) ----";
    print "\n-------                                            ----\n";

    ####
    #   Notice you don't need an instantiated object to use this...
    ####
    print "\nHere are the available datasources...\n";
    %Temp = Win32::ODBC::DataSources();
    foreach $Temp2 (keys(%Temp)){
        print "\tDSN=\"$Temp2\" (\"$Temp{$Temp2}\")\n";
    }


####
#   T E S T  3
####
    print "\n------- T E S T  # 3  (Open several connections) ----";
    print "\n-------                                          ----\n";

    print "\nOpening ODBC connection for \"$DSN\" ";
    if (!($O = new Win32::ODBC($DSN))){
        print "Error opening a connection.\n";
        exit();
    }
    Error($O);

    print "Opening ODBC connection for \"$DSN\" ";
    if (!($O2 = new Win32::ODBC($DSN))){
        print "Error opening a connection.\n";
        exit();
   }
    Error($O2);

    print "Opening ODBC connection for \"$DSN\" ";
    if (!($O3 = new Win32::ODBC($DSN))){
        print "Error opening a connection.\n";
        exit();
    }
    Error($O3);


####
#   T E S T  4
####
    print "\n------- T E S T  # 4  (Close all but one connection) ----";
    print "\n-------                                              ----\n";

        print "\n\tCurrently open ODBC connections are: \"", join(", ", sort($O2->GetConnections())), "\"\n";

    print "Closing ODBC connection #", $O2->Connection(), "... ";
    $O2->Close();
    Error($O2);

        print "\tCurrently open ODBC connections are: \"", join(", ", sort($O2->GetConnections())), "\"\n";

    print "Closing ODBC connection #", $O3->Connection(), "... ";
    $O3->Close();
    Error($O3);

        print "\tCurrently open ODBC connections are: \"", join(", ", sort($O2->GetConnections())), "\"\n";

####
#   T E S T  5
####
    print "\n------- T E S T  # 5  (Set/query Max Buffer size for a connection) ----";
    print "\n-------                                                            ----\n";
    srand(time);
    $Temp = int(rand(10240)) + 10240;
    print "\nMaximum Buffer Size for connection #", $O->Connection(), ":\n";
    print "\tValue set at ", $O->GetMaxBufSize(), "\n";
    Error($O);
    print "\tSetting Maximum Buffer Size to $Temp...  it has been set to ", $O->SetMaxBufSize($Temp), "\n";
    Error($O);
    print "\tValue set at ", $O->GetMaxBufSize(), "\n";
    Error($O);

    $Temp += int(rand(10240)) + 102400;
    print "\tSetting Maximum Buffer Size to $Temp... (can not be more than 102400)\n\t\t...it has been set to ", $O->SetMaxBufSize($Temp), "\n";
    Error($O);
    print "\tValue set at ", $O->GetMaxBufSize(), "\n";
    Error($O);

    $Temp = int(rand(1024)) + 2048;
    print "\tSetting Maximum Buffer Size to $Temp...  it has been set to ", $O->SetMaxBufSize($Temp), "\n";
    Error($O);
    print "\tValue set at ", $O->GetMaxBufSize(), "\n";
    Error($O);


####
#   T E S T  6
####
    print "\n------- T E S T  # 6  (Set/query Stmt Close Type      ) ----";
    print "\n-------                                                 ----\n";


    print "\nStatement Close Type is currently set as ", $O->GetStmtCloseType(), " " . $O->Error . "\n";
    print "Setting Statement Close Type to SQL_CLOSE: (returned code of ",  $O->SetStmtCloseType(SQL_CLOSE), ")" . $O->Error . "\n";
    print "Statement Close Type is currently set as ", $O->GetStmtCloseType(), " " . $O->Error ."\n";


####
#   T E S T  7
####
    print "\n------- T E S T  # 7  (Dump DSN for current connection) ----";
    print "\n-------                                                 ----\n";
    print"\nThe current connection #", $O->Connection(), ":";
    Error($O);
    print "DSN=\"", ($O->GetDSN() =~ /DSN=(.*?);.*/i), "\"\n";
    Error($O);
    print "Full ODBC DSN=\"", ($O->GetDSN()), "\"\n";
    Error($O);



####
#   T E S T  8
####
    print "\n------- T E S T  # 8  (Dump list of tables in datasource) ----";
    print "\n-------                                                   ----\n";
    print "\nList of tables for \"", ($O->GetDSN() =~ /DSN=(.*?);.*/i), "\"\n";
    Error($O);

    $Num = 1;
    foreach $Temp ($O->TableList()){
        print $Num++, ".) \"$Temp\"\n";
    }




####
#   T E S T  9
####
    print "\n------- T E S T  # 9  (Dump list of tables in datasource) ----";
    print "\n-------                                                   ----\n";
    $Num = 1;
    foreach $Temp ($O->TableList("", "", "%", "TABLE")){
        print $Num++, ".) \"$Temp\"\n";
    }
    $iRow = $O->RowCount();
    print "There were $iRow row", ((iRow == 1)? "":"s"), " affected.\n";
    print "This should produce an inoccuous error stating no data records remain.\n";
    Error($O);



####
#   T E S T  10
####
    print "\n------- T E S T  # 10 (Dump list of tables in datasource) ----";
    print "\n-------               (based on a specified criteria    ) ----\n";
    print "\n";
    $Num = 1;
    foreach $Temp ($O->TableList("", "", "%", "TABLE, VIEW, SYSTEM TABLE")){
        print $Num++, ".) \"$Temp\"\n";
    }
    print "This should produce an inoccuous error stating no data records remain.\n";
    Error($O);



####
#   T E S T  11
####
    print "\n------- T E S T  # 11 (Dump list of tables in datasource) ----";
    print "\n-------               (based on another criteria        ) ----\n";
    print "\nNOTICE: This is the Catalog() not TableList(), so you need\nto process the data manualy.\n\n";
    if(! $O->Catalog("", "", "%", "")){
        foreach $Key ($O->FieldNames){
            print "$Key", "\t";
        }
        print "\n";
        while ($O->FetchRow()){
            print "\"", $O->Data(($O->FieldNames)[0]), "\"\t\"", $O->Data(($O->FieldNames)[1]), "\"\t\"", $O->Data(($O->FieldNames)[2]), "\"\t\"", $O->Data(($O->FieldNames)[3]), "\"\t\"", $O->Data(($O->FieldNames)[4]), "\"\n";
        }
    }
    print "This should produce an inoccuous error stating no data records remain.\n";
    Error($O);


#----------------------- F U N C T I O N S ---------------------------

sub Error{
    my($Data) = @_;
    $Data->DumpError() if ref($Data);
    Win32::ODBC::DumpError() if ! ref($Data);
}


sub Center{
    local($Temp, $Width) = @_;
    local($Len) = ($Width - length($Temp)) / 2;
    return " " x int($Len), $Temp, " " x (int($Len) + (($Len != int($Len))? 1:0));
}

