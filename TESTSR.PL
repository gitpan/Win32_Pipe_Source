    #   T E S T S R . P L
    #   -----------------
    #   Test Server script to test the Win32::Pipe extension.
    #

    use Win32::Pipe;
    require "./test.lib";

    $PipeName = $Pipe;
    $NewSize = 2048;

    $| = 1;

    $iFlag = 1;
    while($iFlag){
        print "Creating pipe \"$PipeName\".\n";
        if($Pipe = new Win32::Pipe($PipeName)){
            $PipeSize = $Pipe->BufferSize();
            print "This pipe's current size is $PipeSize byte" . (($PipeSize == 1)? "":"s") . ".\nWe shall change it to $NewSize ...";
            print (($Pipe->ResizeBuffer($NewSize) == $NewSize)? "Successful":"Unsucessful") . "!\n\n";

            print "\n\nR e a d y   f o r   r e a d i n g :\n";
            print "-----------------------------------\n";
            $iFlag2 = 1;

            print "Openning the pipe...\n";
            undef $In;
            if ($Pipe->Connect()){

                $User = ($Pipe->GetInfo()) [2];

                 while($iFlag2){
                    ++$iMessage;
                    print "Reading Message #$iMessage from $User: ";
                    $In = $Pipe->Read();

                    ####
                    #   In case the pipe is terminated on the client end
                    #   without telling us.
                    ####
                    if(! $In){
                        $iFlag2 = 0;
                        print "Recieved no data, closing connection....\n";
                        next;
                    }

                    ####
                    #   In case the client wants to quit
                    ####
                    if ($In =~ /^quit/i){
                        print "\n\nQuitting this connection....\n";
                        $iFlag2 = 0;
                    }elsif

                        ####
                        #   In case the client wants to exit this entire test
                        ####
                        ($In =~ /^exit/i){
                        print "\n\nExitting.....\n";
                        $iFlag2 = $iFlag = 0;
                    }
                    elsif($In =~ /^run:/i)
                    {
                        ####
                        #   If the a request to run a command is sent...
                        ####

                       ($Command) = ($In =~ /^run:(.*)/i);

                       print "Running a command:\n";
                       print "Command: '$Command'\n";
                       print "Output:\n", "-" x 40, "\n";

                       @Output = `$Command`;

                       map {print "$_";} @Output;

                       print "\n", "-" x 40, "\n";

                    }else{
                        print "\"$In\"\n";
                    }
                }
                print "Disconnecting...\n";
                $Pipe->Disconnect();
            }
            $Pipe->Close();
        }else{
            print "\nCould not connect pipe to a client (Connect() failed)\n";
            print "Error: " . $Win32::Pipe::ErrorText . "\n";
            print "Aborting...\n";
            exit;
        }
    }


