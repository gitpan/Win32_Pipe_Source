
#define WIN32_LEAN_AND_MEAN
#include <io.h>
#include <FCNTL.H>

#ifdef __BORLANDC__
typedef wchar_t wctype_t; /* in tchar.h, but unavailable unless _UNICODE */
#endif

#include <windows.h>
#include <stdio.h>		//	Gurusamy's right, Borland is brain damaged!
#include <math.h>		//	Gurusamy's right, MS is brain damaged!


	//	Win32 Perl Stuff
	//	used for the core distribution

#if defined(__cplusplus)  && !defined(PERL_OBJECT)
extern "C" {
#endif	//	C++ and not PERL_OBJECT
#include "EXTERN.h"
#include "perl.h"
#include "XSub.h"
#if defined(__cplusplus)  && !defined(PERL_OBJECT)
}	
#endif	//	C++ and not PERL_OBJECT


#include "cpipe.hpp"
#include "pipe.h"


#ifdef _open_osfhandle
#undef _open_osfhandle
#endif

#ifdef _get_osfhandle
#undef _get_osfhandle
#endif


char gszError[ERROR_TEXT_SIZE];
int	giError = 0;



/*----------------------- P E R L   F U N C T I O N S -------------------*/

// constant function for exporting NT definitions.
static long constant(PERL_OBJECT_PROTO char *name)
{
    errno = 0;
    switch (*name) {
	    case 'A':
			break;
    	case 'B':
			break;
    	case 'C':
			break;
    	case 'D':
				if (strEQ(name, "DEFAULT_WAIT_TIME"))
			#ifdef DEFAULT_WAIT_TIME
				    return DEFAULT_WAIT_TIME;
			#else
				    goto not_there;
			#endif
			


			break;
    	case 'E':
				if (strEQ(name, "ERROR_MORE_DATA"))
			#ifdef ERROR_MORE_DATA
				    return ERROR_MORE_DATA;
			#else
				    goto not_there;
			#endif
						
			break;
	    case 'F':
			break;
	    case 'G':
			break;
	    case 'H':
			break;
	    case 'I':
			break;
	    case 'J':
			break;
	    case 'K':
			break;
	    case 'L':
			break;
	    case 'M':
			break;
	    case 'N':
				if (strEQ(name, "NMPWAIT_NOWAIT"))
			#ifdef NMPWAIT_NOWAIT 
				    return NMPWAIT_NOWAIT;
			#else
				    goto not_there;
			#endif

				if (strEQ(name, "NMPWAIT_WAIT_FOREVER"))
			#ifdef NMPWAIT_WAIT_FOREVER
				    return NMPWAIT_WAIT_FOREVER;
			#else
				    goto not_there;
			#endif

				if (strEQ(name, "NMPWAIT_USE_DEFAULT_WAIT"))
			#ifdef NMPWAIT_USE_DEFAULT_WAIT 
				    return NMPWAIT_USE_DEFAULT_WAIT;
			#else
				    goto not_there;
			#endif
						
					
			break;
	    case 'O':
			break;
	    case 'P':
				if (strEQ(name, "PIPE_TYPE_BYTE"))
			#ifdef PIPE_TYPE_BYTE
				    return PIPE_TYPE_BYTE;
			#else
				    goto not_there;
			#endif
						
				if (strEQ(name, "PIPE_TYPE_MESSAGE"))
			#ifdef PIPE_TYPE_MESSAGE
				    return PIPE_TYPE_MESSAGE;
			#else
				    goto not_there;
			#endif
				
				if (strEQ(name, "PIPE_READMODE_BYTE"))
			#ifdef PIPE_READMODE_BYTE
				    return PIPE_READMODE_BYTE;
			#else
				    goto not_there;
			#endif
						
				if (strEQ(name, "PIPE_READMODE_MESSAGE"))
			#ifdef PIPE_READMODE_MESSAGE
				    return PIPE_READMODE_MESSAGE;
			#else
				    goto not_there;
			#endif						

			break;
	    case 'Q':
			break;
	    case 'R':
			break;
	    case 'S':

				if (strEQ(name, "STD_INPUT_HANDLE"))
			#ifdef STD_INPUT_HANDLE
				    return STD_INPUT_HANDLE;
			#else
				    goto not_there;
			#endif
			
				if (strEQ(name, "STD_ERROR_HANDLE"))
			#ifdef STD_ERROR_HANDLE
				    return STD_ERROR_HANDLE;
			#else
				    goto not_there;
			#endif

				if (strEQ(name, "STD_OUTPUT_HANDLE"))
			#ifdef STD_OUTPUT_HANDLE
				    return STD_OUTPUT_HANDLE;
			#else
				    goto not_there;
			#endif

 			break;
	    case 'T':
			break;
	    case 'U':
			break;
	    case 'V':
			break;
	    case 'W':
			break;
	    case 'X':
			break;
	    case 'Y':
			break;
	    case 'Z':
			break;
    }
    errno = EINVAL;
    return 0;

not_there:
    errno = ENOENT;
    return 0;
}

XS(XS_WIN32__Pipe_Constant)
{
	dXSARGS;
	if (items != 2)
	{
		croak("Usage: Win23::Pipe::Constant(name, arg)\n");
    }
	{
		char* name = (char*) SvPV( ST( 0 ), na );
		ST( 0 ) = sv_newmortal();
		sv_setiv( ST( 0 ), constant( PERL_OBJECT_ARG name ) );
	}
	XSRETURN(1);
}


/*----------------------- M I S C   F U N C T I O N S -------------------*/
int	Error( int iErrorNum, char *szErrorText )
{
	strncpy( (char *) gszError, szErrorText, ERROR_TEXT_SIZE );
	gszError[ ERROR_TEXT_SIZE ] = '\0';
	giError = iErrorNum;
	return( giError );
}		

	//	Correct slashes to be backslashes.
void FixPath( char *pszPath )
{
	while( 0 != *pszPath )
	{
		if( '/' == *pszPath )
		{
			*pszPath = '\\';
		}
		pszPath++;
	}
	return;
}

HV *GetSelf( PERL_OBJECT_PROTO SV *svSelf )
{
	HV	*hvSelf = 0;

	if( svSelf )
	{
		if( SvROK( svSelf ) )
		{
			svSelf = SvRV( svSelf );
			if( SvTYPE( svSelf ) == SVt_PVHV )
			{
				hvSelf = (HV *) svSelf;
			}
		}
	}
	return( hvSelf );
}

CPipe *GetObjectPointer( PERL_OBJECT_PROTO HV *hv )
{
	SV		*sv;
	CPipe	*pPointer = 0;

	if( hv )
	{
		if( SvTYPE( (SV *) hv ) == SVt_PVHV )
		{
			if( hv_exists( (HV *) hv, CLASS_POINTER_MEMBER_NAME, strlen( CLASS_POINTER_MEMBER_NAME ) ) )
			{
				if( sv = (SV*) hv_fetch( (HV *) hv, CLASS_POINTER_MEMBER_NAME, strlen( CLASS_POINTER_MEMBER_NAME ), 0 ) )
				{
					pPointer = (CPipe *) SvIV( ( (SV **) sv ) [0] );
				}
			}
		}
	}
	return( pPointer );
}
/*------------------- P E R L   O D B C   F U N C T I O N S ---------------*/

XS(XS_WIN32__Pipe_Create)
{
	dXSARGS;
	
	UCHAR	*szName = 0;
	DWORD	dwWait = DEFAULT_WAIT_TIME;
	CPipe	*pPipe = 0;
	DWORD	dwType = PIPE_TYPE_BYTE;
	

	if( 2 > items  || 3 < items ){
		CROAK("usage: " EXTENSION_NAMESPACE "::Create( $Name, $TimeToWait [, $Type ] );\n");
	}
	szName = (UCHAR *) SvPV( ST( 0 ), na );
	dwWait = (DWORD) SvIV( ST( 1 ) );

	if( 2 < items )
	{
		dwType = (DWORD) SvIV( ST( 2 ) );
	}

	PUSHMARK( sp );

	if( 255 < strlen( (const char *) szName ) )
	{
		Error( ERROR_NAME_TOO_LONG );
	}else{
		pPipe = CPipe::CreateInstance( (char *) szName, dwWait, dwType );
	}

	if( pPipe )
	{
		if( NULL != (int) pPipe->GetError() )
		{
			giError = pPipe->GetError();
			strcpy( gszError, (const char *) pPipe->GetErrorText() );
			delete pPipe;
			pPipe = NULL;
		}
	}
	if( pPipe )
	{
		XPUSHs( sv_2mortal( newSViv( (long) pPipe ) ) );
		XPUSHs( sv_2mortal( newSViv( (long) pPipe->GetHandle() ) ) );
	}else{
		XPUSHs( sv_2mortal( newSViv( 0 ) ) );
	}
	PUTBACK;
} 

XS(XS_WIN32__Pipe_Close)
{
	dXSARGS;
	CPipe	*pPipe;

	if( 1 != items )
	{
		CROAK("usage: " EXTENSION_NAMESPACE "::Close();\n");
	}

	pPipe = GET_PIPE();
	
	PUSHMARK(sp);
	
	if (pPipe){
		delete pPipe;
	}

	XPUSHs( sv_2mortal( newSViv( 0 ) ) );
	PUTBACK;
} 

XS(XS_WIN32__Pipe_Write)
{
	dXSARGS;
	CPipe	*pPipe = 0;
	void	*pData = 0;
	int		iResult = 0;
	STRLEN	dwDataLen;

	if( 2 != items )
	{
		CROAK("usage: " EXTENSION_NAMESPACE "::Write( $Data );\n");
	}
	
	pPipe = GET_PIPE();
	
	pData = (void *) SvPV( ST( 1 ), na );
	dwDataLen = SvCUR( ST( 1 ) );

	PUSHMARK(sp);
	
	if( pPipe )
	{
		iResult = pPipe->Write( (void *) pData, (DWORD)dwDataLen );
	}

	XPUSHs( sv_2mortal( newSViv( iResult ) ) );

	PUTBACK;
} 

XS(XS_WIN32__Pipe_Read)
{
	dXSARGS;
	CPipe	*pPipe = 0;
	int		iFlag = 1;
	DWORD	dLen = 0;
	void	*vpData = 0;

	if( 1 != items )
	{
		CROAK("usage: " EXTENSION_NAMESPACE "::Read();\n");
	}
	 
	pPipe = GET_PIPE();
	
	PUSHMARK(sp);
	
	if( pPipe )
	{
		while( iFlag )
		{
			vpData = pPipe->Read( &dLen );
			iFlag = 0;				
				//	If we have more data to read then for God's sake, do it!

				//	I don't know if this will work ... it would return an
				//	array. This may not be good. Hmmmm.
			if(!vpData && GetLastError() == ERROR_MORE_DATA){
				iFlag = 1;
			}				

			if( dLen ){
				XPUSHs( sv_2mortal( newSVpv( (char *) vpData, dLen ) ) );
			}else{
				sv_setsv( ST( 0 ), (SV*) &sv_undef );
			}
		}
	}
	PUTBACK;
} 

XS(XS_WIN32__Pipe_Connect)
{
	dXSARGS;
	CPipe	*pPipe;
	int		iResult = 0;

	if(items != 1){
		CROAK("usage: " EXTENSION_NAMESPACE "::Connect();\n");
	}
	
	pPipe = GET_PIPE();
	
	PUSHMARK(sp);
	
	if( pPipe )
	{
		iResult = pPipe->Connect();
	}

	XPUSHs( sv_2mortal( newSViv( (long) iResult ) ) );

	PUTBACK;
} 

XS(XS_WIN32__Pipe_Disconnect)
{
	dXSARGS;
	CPipe	*pPipe;
	int		iResult = 0;
	int		iPurge = 0;

	if( 0 < items  && 3 > items )
	{
		CROAK("usage: " EXTENSION_NAMESPACE "::Disconnect( [, $iPurge] );\n" );
	}
	
	pPipe = GET_PIPE();

	if( 2 == items )
	{
		iPurge = (int) SvIV( ST( 1 ) );
	}

	PUSHMARK( sp );
	
	if( NULL != pPipe )
	{
		iResult = pPipe->Disconnect( iPurge );
	}

	XPUSHs( sv_2mortal( newSViv( (long) iResult ) ) );
	PUTBACK;
} 

XS(XS_WIN32__Pipe_ResizeBuffer)
{
	dXSARGS;
	CPipe	*pPipe = 0;
	DWORD	dwResult = 0;
	DWORD	dwSize;
	
	if( 2 != items )
	{
		CROAK("usage: " EXTENSION_NAMESPACE "::ResizeBuffer( $Size );\n" );
	}
	
	pPipe = GET_PIPE();

	dwSize = (DWORD) SvIV( ST( 1 ) );

	PUSHMARK( sp );
	
	if( NULL != pPipe )
	{
		dwResult = pPipe->ResizeBuffer( dwSize );
	}

	XPUSHs( sv_2mortal( newSViv( (long) dwResult ) ) );
	PUTBACK;
} 

XS(XS_WIN32__Pipe_BufferSize)
{
	dXSARGS;
	CPipe	*pPipe = 0;
	DWORD	dwResult = 0;
	
	if( 1 != items )
	{
		CROAK("usage: " EXTENSION_NAMESPACE "::BufferSize();\n" );
	}
	
	pPipe = GET_PIPE();

	PUSHMARK( sp );
	
	if( NULL != pPipe )
	{
		dwResult = pPipe->BufferSize();
	}

	XPUSHs( sv_2mortal( newSViv( (long) dwResult ) ) );
	PUTBACK;
} 


XS(XS_WIN32__Pipe_Error)
{
	dXSARGS;
	CPipe	*pPipe = NULL;
	int		iResult = 0;
	char	*szError = 0;
	int		iError = 0;
	
	if(items > 1){
		CROAK("usage: " EXTENSION_NAMESPACE "::Error( [$PipeHandle] );\n");
	}
	if (items == 1){
		pPipe = GET_PIPE();
	}

	PUSHMARK( sp );
	
	if( NULL != pPipe )
	{
		iError = pPipe->GetError();
		szError = (char *) pPipe->GetErrorText();
	}else{
		iError = giError;
		szError = gszError;
	}

	XPUSHs( sv_2mortal( newSViv( (long) iError ) ) );
	XPUSHs( sv_2mortal( newSVpv( (char *) szError, strlen( szError ) ) ) ); 

	PUTBACK;
} 

XS(XS_WIN32__Pipe_Anonymous)
{
	dXSARGS;
	int		iResult = 0;
	HANDLE	hRead, hWrite;
	int		fhRead, fhWrite;
	SECURITY_ATTRIBUTES	saTemp;
		
	if( 0 != items )
	{
		CROAK("usage: ($Error, $Read, $Write) = " EXTENSION_NAMESPACE "::Anonymous();\n" );
	}

	PUSHMARK( sp );
	
	fhRead = fhWrite = 0;
	hRead = hWrite = 0;
	saTemp.nLength = sizeof( SECURITY_ATTRIBUTES );
	saTemp.bInheritHandle = 1;
	saTemp.lpSecurityDescriptor = 0;

	if( CreatePipe( &hRead, &hWrite, &saTemp, 512 ) )
	{
		if( 0 <= ( fhRead = _open_osfhandle( (long) hRead, _O_TEXT | _O_RDONLY ) ) )
		{
			if( 0 <=( fhWrite = _open_osfhandle( (long) hWrite, _O_TEXT | _O_WRONLY ) ) )
			{
				iResult = 1;
			}
		}
	}
	
	if( 0 != iResult )
	{
		XPUSHs( sv_2mortal( newSViv( (long) fhRead ) ) );
		XPUSHs( sv_2mortal( newSViv( (long) fhWrite ) ) );
		XPUSHs( sv_2mortal( newSViv( (long) hRead ) ) );
		XPUSHs( sv_2mortal( newSViv( (long) hWrite ) ) );
	}
	
	PUTBACK;
} 

XS(XS_WIN32__Pipe_ReOpen)
{
	dXSARGS;
	int		iResult = 0;
	HANDLE	hRead, hWrite;
	int		fhRead, fhWrite;
		
	if( 2 != items )
	{
		CROAK("usage: ($Read, $Write) = " EXTENSION_NAMESPACE "::ReOpen( $ReadOSHandle, $WriteOSHandle );\n" );
	}

	PUSHMARK( sp );
	
	fhRead = fhWrite = 0;
	hRead = hWrite = 0;

	hRead  = (HANDLE) SvIV( ST( 0 ) );
	hWrite = (HANDLE) SvIV( ST( 1 ) );

	if( 0 != hRead )
	{
		if( 0 <= ( fhRead = _open_osfhandle( (long) hRead, _O_TEXT | _O_RDONLY ) ) )
		{
			iResult = 1;
		}
	}
	
	if( 0 != hWrite )
	{
		if( 0 <= ( fhWrite = _open_osfhandle( (long) hWrite, _O_TEXT | _O_WRONLY ) ) )
		{
			iResult = 1;
		}
	}
	
	if( 0 != iResult )
	{
		XPUSHs( sv_2mortal( newSViv( (long) fhRead ) ) );
		XPUSHs( sv_2mortal( newSViv( (long) fhWrite ) ) );
	}
	
	PUTBACK;
} 

XS(XS_WIN32__Pipe_ClosePipe)
{
	dXSARGS;
	HANDLE	hPipe;
	int		fhPipe;
	int		iResult = 0;
		
	if( 1 != items )
	{
		CROAK("usage: ($Error) = " EXTENSION_NAMESPACE "::ClosePipe( $PipeFD );\n" );
	}	
		
	PUSHMARK( sp );
	
	fhPipe = SvIV( ST( 0 ) );
	hPipe = 0;

	if( 0 <= ( hPipe = (HANDLE) _get_osfhandle( fhPipe ) ) )
	{
		iResult = CloseHandle( hPipe );
	}
	
	XPUSHs( sv_2mortal( newSViv( (long) iResult ) ) );
	
	PUTBACK;
} 

XS(XS_WIN32__Pipe_StdHandle)
{
	dXSARGS;
	HANDLE	hFile;
	DWORD	dwType;
	int		fhFile = -1;
	BOOL	iResult = FALSE;
		
	if( 1 > items || 2 < items )
	{
		CROAK("usage: ($Error, $Read, $Write) = " EXTENSION_NAMESPACE "::StdHandle( $Type [, $OSHandle ] );\n" );
	}	
		
	PUSHMARK( sp );
	
	dwType = (DWORD) SvIV( ST( 0 ) );	

	if( 2 == items )
	{
		hFile = (HANDLE) SvIV( ST( 0 ) );
	}

	if( 0 <= hFile )
	{	
		iResult = SetStdHandle( dwType, hFile );
	}else{
		hFile = GetStdHandle( dwType );
		if( INVALID_HANDLE_VALUE != hFile )
		{
			iResult = TRUE;
		}
	}
		
	XPUSHs( sv_2mortal( newSViv( (long) iResult ) ) );
	if( 1 == items )
	{
		XPUSHs( sv_2mortal( newSViv( (long) hFile ) ) );
	}			
	
	PUTBACK;
} 

XS(XS_WIN32__Pipe_GetHandle)
{
	dXSARGS;
	HANDLE	hFile;
	int		fhFile = -1;
		
	if( 1 != items )
	{
		CROAK("usage: ( $OSHandle ) = " EXTENSION_NAMESPACE "::GetHandle( $FileDescriptor );\n" );
	}	
		
	PUSHMARK( sp );
	
	fhFile = SvIV( ST( 0 ) );	

	hFile =(void *) _get_osfhandle( fhFile );
		
	XPUSHs( sv_2mortal( newSViv( (long) hFile ) ) );
	
	PUTBACK;
} 

XS(XS_WIN32__Pipe_State)
{
	dXSARGS;
	CPipe	*pPipe = NULL;
	DWORD	dwState = 0;
		
	if( 1 > items || 2 < items ){
		CROAK("usage: $State = " EXTENSION_NAMESPACE "::SetState( $State );\n" );
	}	
		
	PUSHMARK( sp );

	pPipe = GET_PIPE();
	
	if( NULL != pPipe )
	{
		if( 2 == items )
		{
			dwState = pPipe->State( (DWORD) SvIV( ST( 1 ) ) );
		}
		else
		{
			dwState = pPipe->State();
		}
	}

	XPUSHs( sv_2mortal( newSViv( (long) dwState ) ) );
	
	PUTBACK;
}

XS(XS_WIN32__Pipe_CloseHandle)
{
	dXSARGS;
	HANDLE	hFile;
	int		iResult = 0;
		
	if( 1 != items )
	{
		CROAK("usage: = " EXTENSION_NAMESPACE "::CloseHandle( $OSHandle );\n" );
	}	
		
	PUSHMARK( sp );
	
	hFile = (void *) SvIV( ST( 0 ) );	

	iResult = CloseHandle( hFile );
			
	XPUSHs( sv_2mortal( newSViv( (long) iResult ) ) );
	
	PUTBACK;
} 

XS(XS_WIN32__Pipe_PeekPipe)
{
	dXSARGS;
	HANDLE	hPipe;
	DWORD	dwSize = 0;
	DWORD	dwAvail = 0;
	char	*szBuffer = 0;
	BOOL	bResult = TRUE;
		
	if( 2 != items )
	{
		CROAK("usage: ( $Data, $Size, $Available ) = " EXTENSION_NAMESPACE "::PeekPipe( $Size );\n" );
	}	
		
	PUSHMARK(sp);
		
	hPipe = (HANDLE) SvIV( ST( 0 ) );	
	
	if( FALSE != bResult )
	{
		dwSize = SvIV( ST( 1 ) );
		if( 0 != dwSize )
		{
			if( NULL != ( szBuffer = new char [ dwSize + 1 ] ) )
			{
				bResult = TRUE;
			}
		}
		if( FALSE != bResult )
		{
			bResult = PeekNamedPipe( hPipe, szBuffer, dwSize, &dwSize, &dwAvail, 0 );
	    }
	}		
	if( FALSE != bResult )
	{
		XPUSHs( sv_2mortal( newSVpv( szBuffer, dwSize ) ) );
		XPUSHs( sv_2mortal( newSViv( (long) dwSize ) ) );
		XPUSHs( sv_2mortal( newSViv( (long) dwAvail ) ) );
	}

	if( NULL != szBuffer )
	{
		delete [] szBuffer;
	}

	PUTBACK;
}

XS(XS_WIN32__Pipe_Peek)
{
	dXSARGS;
	DWORD	dwSize = 0;
	CPipe	*pPipe = NULL;
	char	*pszBuffer = NULL;

	
	if( 1 != items )
	{
		CROAK("usage: ( $Data ) = " EXTENSION_NAMESPACE "::Peek();\n" );
	}	
		
	PUSHMARK(sp);
		
	pPipe = GET_PIPE();

	if( NULL != pPipe )
	{
		dwSize = pPipe->Peek( &pszBuffer );
			    
	}	

	if( NULL == pszBuffer )
	{
		pszBuffer = "";
		dwSize = 0;
	}
	
	XPUSHs( sv_2mortal( newSVpv( pszBuffer, dwSize ) ) );

	PUTBACK;
} 

XS(XS_WIN32__Pipe_GetPipeInfo)
{
	dXSARGS;
	CPipe	*pCPipe;
	int		iResult = TRUE;
	sPipeInfo	*psInfo = NULL;
	
	if(items != 1){
		CROAK("usage: ($State, $Instances, $User, $MaxCollectionCount, $CollectTimeout) = " EXTENSION_NAMESPACE "::GetPipeInfo($Handle);\n");
	}	
		
	PUSHMARK(sp);
	
	pCPipe = (CPipe *) SvIV(ST(0));	

	if( NULL != pCPipe )
	{
		if( NULL != ( psInfo = pCPipe->GetInfo() ) )
		{
			XPUSHs( sv_2mortal( newSViv( (long) psInfo->dwState ) ) );
			XPUSHs( sv_2mortal( newSViv( (long) psInfo->dwInstances ) ) );
			XPUSHs( sv_2mortal( newSVpv( (char *) psInfo->szUserName, strlen( psInfo->szUserName ) ) ) );
			XPUSHs( sv_2mortal( newSViv( (long) psInfo->dwMaxCollectionCount ) ) );
			XPUSHs( sv_2mortal( newSViv( (long) psInfo->dwCollectDataTimeout ) ) );
		}	
	}

	PUTBACK;
} 

		//	Test string; p Win32::Pipe::CallNamedPipe( "//dev/pipe/$Pipe", "run:dir", $Buff );
XS(XS_WIN32__Pipe_CallNamedPipe)
{
	dXSARGS;

	char	*pszPipeName = NULL;
	char	*pSendData = NULL;
	char	pReceiveData[ MAX_BUFFER_SIZE ];
	DWORD	dwSendBufferSize = 0;
	DWORD	dwReceiveBufferSize = sizeof( pReceiveData );
	DWORD	dwcbReceived = 0;
	DWORD	dwTimeOut = NMPWAIT_USE_DEFAULT_WAIT;
	SV		*svReceiveBuffer = NULL;
	BOOL	bResult = FALSE;

		
	if( items < 3 || items > 5 ){
		CROAK("usage: $bResult = " EXTENSION_NAMESPACE "::CallNamedPipe($PipeName, $SendData, $RecieveData [, $TimeOut ]);\n");
	}	
	
		//	Get the name of the named pipe	
	pszPipeName = (char *) SvPV( ST( 0 ), na );
	FixPath( pszPipeName );

		//	Get the Send Buffer and discover it's size
	pSendData = (char *) SvPV( ST( 1), na );
	dwSendBufferSize = SvCUR( ST( 1 ) ) + 1;

	svReceiveBuffer = (SV *) ST( 2 );

	if( items > 3 )
	{
		dwTimeOut = (DWORD) SvIV( ST( 3 ) );
	}
		//	Clean out the recieve buffer
	ZeroMemory( pReceiveData, sizeof( pReceiveData ) );


		//	If bResult is FALSE *AND* GetLastError is ERROR_MORE_DATA then the $Receive buffer
		//	will have the partial message retrieved.
	bResult = CallNamedPipe(
			pszPipeName,
			(void *) pSendData,
			dwSendBufferSize,
			(void *) pReceiveData,
			dwReceiveBufferSize,
			&dwcbReceived,
			dwTimeOut );
	
	sv_setpvn( ST( 2 ), (char *) pReceiveData, dwcbReceived );

	if( FALSE != bResult )
	{
		XST_mYES( 0 );
	}
	else
	{
		XST_mNO( 0 );
	}

	XSRETURN( 1 );
}

///////////////////////////////////////////////////
//	THIS assumes that the first parameter passed in is the $self
///////////////////////////////////////////////////
XS(XS_WIN32__Pipe_Transact)
{
	dXSARGS;
	CPipe	*pPipe = NULL;
	void	*pData = NULL;
	DWORD	dwDataLen = 0;
	int		iResult = TRUE;
	sPipeInfo	*psInfo = NULL;
	BOOL	bResult = FALSE;
	
		//	There are three inputs even though we croak that there are only two.
		//	The first one is auto sent when referenced as a method.
		//	This prevents classless calling! 
	if(items != 3){
		CROAK("usage: " EXTENSION_NAMESPACE "::Transact( $SendBuffer, $ReceiveBuffer );\n");
	}	
		
	pData = (void *) SvPV( ST( 1 ), na );
	dwDataLen = SvCUR( ST( 1 ) );

	pPipe = GET_PIPE();

	if( NULL != pPipe )
	{
		bResult = pPipe->Transact( &pData, &dwDataLen );
	}

	if( FALSE != bResult )
	{
		XST_mYES( 0 );
	}
	else
	{
		XST_mNO( 0 );
	}

	sv_setpvn( ST( 2 ), (char *) ( ( NULL == pData )? "":pData ), ( NULL == pData)? 0:dwDataLen );

	XSRETURN( 1 );
} 


XS(XS_WIN32__Pipe_TransactNamedPipe)
{
	dXSARGS;
	HANDLE hHandle = 0;
	char	*pReceiveBuffer[ MAX_BUFFER_SIZE ];
	DWORD	dwRecieveBufferSize = sizeof( pReceiveBuffer );
	DWORD	dwcbReceived = 0;
	void	*pData = NULL;
	DWORD	dwDataLen = 0;
	int		iResult = TRUE;
	sPipeInfo	*psInfo = NULL;
	BOOL	bResult = FALSE;
	
	if(items != 3){
		CROAK("usage: " EXTENSION_NAMESPACE "::TransactNamedPipe( $Handle, $SendBuffer, $ReceiveBuffer );\n");
	}	
		
	pData = (void *) SvPV( ST( 1 ), na );
	dwDataLen = SvCUR( ST( 1 ) );

	hHandle= ( HANDLE ) SvIV(ST(0));	

	ZeroMemory( pReceiveBuffer, dwRecieveBufferSize );

	if( 0 != hHandle )
	{
		bResult = TransactNamedPipe( 
				hHandle,
				pData,
				dwDataLen,
				(void *) pReceiveBuffer,
				dwRecieveBufferSize,
				&dwcbReceived,
				NULL );
	}

	if( FALSE != bResult )
	{
		XST_mYES( 0 );
	}
	else
	{
		XST_mNO( 0 );
	}

	sv_setpvn( ST( 2 ), (char *) pReceiveBuffer, dwRecieveBufferSize );

	XSRETURN( 1 );
} 



//////////////////////////////////////////////////////////////////
//	VERY TEST! Don't use yet
//////////////////////////////////////////////////////////////////
/*
XS(XS_WIN32__Pipe_OpenAsPerlFile)
{
	dXSARGS;
	int		iResult = TRUE;
	HANDLE	hFile;
	
	if(items != 2){
		CROAK("usage: " EXTENSION_NAMESPACE "::OpenAsPerlFile($FileName, $Handle);\n");
	}	
		
	PUSHMARK(sp);
	
	hFile = SvIV(ST(1));	


	if ( NULL != ( fNewFile = _open_osfhandle ( hFile , 0) )
	{
		dSP; dTARGET;
		GV *gv;
		SV *svFileName;
		char *tmps;
		STRLEN len;

		svFileName = ST( 0 );

 
//		else if (SvTYPE(TOPs) == SVt_PVGV)
//			sv = GvSV(TOPs);
//		else
//			DIE(no_usym, "filehandle");

		gv = (GV*)POPs;
		if (IoFLAGS(GvIOn(gv)) & IOf_UNTAINT)   // This GV has UNTAINT previously set
			IoFLAGS(GvIOp(gv)) &= ~IOf_UNTAINT; // Clear it. We don't carry that over
		
		tmps = SvPV(sv, len);
		
		if (do_open(gv, tmps, len, FALSE, 0, 0, Nullfp)) 
		{
			IoLINES(GvIOp(gv)) = 0;
			PUSHi( (I32)forkprocess );
		}
		else if (forkprocess == 0)		// we are a new child
		{
			PUSHi(0);
		}
		else
		{
			RETPUSHUNDEF;
		}
	}
	PUTBACK;
} 
*/

XS(XS_WIN32__Pipe_Info) 
{
	dXSARGS;

	if(items > 1){
		CROAK("usage: ($ExtName, $Version, $Date, $Author, $CompileDate, $Credits) = " EXTENSION_NAMESPACE "::Info()\n");
	}
	
	PUSHMARK(sp);
	
	XPUSHs(sv_2mortal(newSVpv(VERNAME, strlen(VERNAME))));
	XPUSHs(sv_2mortal(newSVpv(VERSION, strlen(VERSION))));
	XPUSHs(sv_2mortal(newSVpv(VERDATE, strlen(VERDATE))));
	XPUSHs(sv_2mortal(newSVpv(VERAUTH, strlen(VERAUTH))));
	XPUSHs(sv_2mortal(newSVpv(__DATE__, strlen(__DATE__))));
	XPUSHs(sv_2mortal(newSVpv(__TIME__, strlen(__TIME__))));
	XPUSHs(sv_2mortal(newSVpv(VERCRED, strlen(VERCRED))));

	PUTBACK;
}


XS(boot_Win32__Pipe)
{
	dXSARGS;
	char* file = __FILE__;
	int i;

	giError = 0;
	memset((void *)gszError, 0, ERROR_TEXT_SIZE);

	newXS( EXTENSION_NAMESPACE "::constant",			XS_WIN32__Pipe_Constant, file);
	newXS( EXTENSION_NAMESPACE "::Create",			XS_WIN32__Pipe_Create,  file);
	newXS( EXTENSION_NAMESPACE "::Close",			XS_WIN32__Pipe_Close,  file);
	newXS( EXTENSION_NAMESPACE "::Write",			XS_WIN32__Pipe_Write,  file);
	newXS( EXTENSION_NAMESPACE "::Read",			XS_WIN32__Pipe_Read,  file);
	newXS( EXTENSION_NAMESPACE "::Connect",			XS_WIN32__Pipe_Connect,  file);
	newXS( EXTENSION_NAMESPACE "::Disconnect",		XS_WIN32__Pipe_Disconnect,  file);
	newXS( EXTENSION_NAMESPACE "::PipeError",			XS_WIN32__Pipe_Error,  file);
	newXS( EXTENSION_NAMESPACE "::ResizeBuffer",	XS_WIN32__Pipe_ResizeBuffer,  file);
	newXS( EXTENSION_NAMESPACE "::BufferSize",		XS_WIN32__Pipe_BufferSize,  file);
	newXS( EXTENSION_NAMESPACE "::Info",				XS_WIN32__Pipe_Info, file);
	newXS( EXTENSION_NAMESPACE "::Anonymous",			XS_WIN32__Pipe_Anonymous, file);
	newXS( EXTENSION_NAMESPACE "::ClosePipe",			XS_WIN32__Pipe_ClosePipe, file);
	newXS( EXTENSION_NAMESPACE "::ReOpen",				XS_WIN32__Pipe_ReOpen, file);
	newXS( EXTENSION_NAMESPACE "::SetStdHandle",		XS_WIN32__Pipe_StdHandle, file);
	newXS( EXTENSION_NAMESPACE "::GetStdHandle",		XS_WIN32__Pipe_StdHandle, file);
	newXS( EXTENSION_NAMESPACE "::StdHandle",			XS_WIN32__Pipe_StdHandle, file);
	newXS( EXTENSION_NAMESPACE "::GetHandle",			XS_WIN32__Pipe_GetHandle, file);
	newXS( EXTENSION_NAMESPACE "::CloseHandle",			XS_WIN32__Pipe_CloseHandle, file);
	newXS( EXTENSION_NAMESPACE "::PeekPipe",			XS_WIN32__Pipe_PeekPipe, file);
	newXS( EXTENSION_NAMESPACE "::GetInfo",			XS_WIN32__Pipe_GetPipeInfo, file);

	newXS( EXTENSION_NAMESPACE "::CallNamedPipe",		XS_WIN32__Pipe_CallNamedPipe, file);
	newXS( EXTENSION_NAMESPACE "::Transact",			XS_WIN32__Pipe_Transact, file);
	newXS( EXTENSION_NAMESPACE "::TransactNamedPipe",	XS_WIN32__Pipe_TransactNamedPipe, file);
	newXS( EXTENSION_NAMESPACE "::State",				XS_WIN32__Pipe_State, file);
	newXS( EXTENSION_NAMESPACE "::Peek",				XS_WIN32__Pipe_Peek, file);


	ST(0) = &sv_yes;
	XSRETURN(1);

}



