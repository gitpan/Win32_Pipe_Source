    #   T E S T C L . P L
    #   -----------------
    #   Test Client script to test the Win32::Pipe extension.
    #

    use Win32::Pipe;
    require "./test.lib";

        ####
        #   You may notice that named pipe names are case INsensitive!
        ####

    $PipeName = "\\\\$Server\\pipe\\$Pipe";

    foreach $Temp (@ARGV){
        $Temp =~ s/[\/|-]([a-z])/$1/ig;
        $Temp =~ tr/a-z/A-Z/;
        if ($Temp eq "T"){
            $Test = 1;
            print "Running in TEST mode...\n";
        }elsif ($Temp eq "D"){
            $Debug = 1;
            print "Running in DEBUG mode...\n";
        }
    }


    print "I am falling asleep for few seconds, so that we give time\nFor the server to get up and running.\n";
    sleep(4) unless $Test;
    print "\nOpening a pipe ...\n";



    if ($Pipe = new Win32::Pipe($PipeName)){
        print "\n\nPipe has been opened, writing data to it...\n";
        print "-------------------------------------------\n";
        $iFlag2 = 1;
        $Pipe->Write( "\n" . Win32::Pipe::Credit() . "\n\n") unless $Debug;
        while($iFlag2){
            print "\nCommands:\n";
            print "  FILE:xxxxx  Dumps the local file xxxxx to '$Server'.\n";
            print "  RUN:xxxxx   Runs the command xxxxx on '$Server'.\n";
            print "  Credit      Dumps the credit screen.\n";
            print "  Quit        Quits this client (server remains running).\n";
            print "  Exit        Exits both client and server.\n";
            print "  -----------------------------------------\n";
            print "  Enter Command or Message:\n";
            print "  >";

            $In = <STDIN>;
            chop($In);

            if (($File = $In) =~ s/^file:(.*)/$1/i){
                if (-s $File){
                    if (open(FILE, "< $File")){
                        while ($File = <FILE>){
                            $In .= $File;
                        };
                        close(FILE);
                        undef $File;
                    }
                }
            }
            if($In =~ /^credit$/i){
                $In = "\n" . Win32::Pipe::Credit() . "\n\n";
            }

            $iFlag2 = $Pipe->Write("$In");
            if($In =~ /^(exit|quit)$/i){
                print "\nATTENTION: Closing due to user request.\n";
                $iFlag2 = 0;
            }

            undef $In;

        }
        $Pipe->Close();
    }else{
        ($Error, $ErrorText) = Win32::Pipe::Error();
        print "Error:$Error \"$ErrorText\"\n";
        sleep(4);
    }



