
#define WIN32_LEAN_AND_MEAN
#include <io.h>
#include <FCNTL.H>

#ifdef __BORLANDC__
typedef wchar_t wctype_t; /* in tchar.h, but unavailable unless _UNICODE */
#endif

#include <windows.h>
#include <stdio.h>		//	Gurusamy's right, Borland is brain damaged!
#include <math.h>		//	Gurusamy's right, MS is brain damaged!

#if defined(__cplusplus) && !defined(PERL_OBJECT)
extern "C" {
#endif

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#if defined(__cplusplus) && !defined(PERL_OBJECT)
}
#endif


#include "CPipe.hpp"
#include "pipe.h"


#ifdef __cplusplus
extern "C" {
#endif

#ifdef _open_osfhandle
#undef _open_osfhandle
#endif

#ifdef __cplusplus
}
#endif


CPipe::CPipe()
{
			              	
	ZeroMemory( m_szName, sizeof( m_szName ) );
	ZeroMemory( m_szError, sizeof( m_szError ) );
	ZeroMemory( (void *) &m_sPipeInfo, sizeof( sPipeInfo ) );

	m_pBuffer = NULL;
	m_dwBufferSize = 0;
	m_dwError = 0;
	
	m_hPipe = 0;
  	m_dwOpenMode = 0;
    m_dwPipeMode = 0;
    m_dwMaxInstances = 0;
    m_dwOutBufferSize = 0;
    m_dwInBufferSize = 0;
    m_dwDefaultTimeOut = 0;
	m_fdFile = 0;

	m_iPipeType = 0;
	m_bServerIsClient = 0;
	
	m_dwBytes = 0;

}

BOOL CPipe::Initialize(char *szName, DWORD dWait, DWORD dwType)
{
	BOOL bResult = TRUE;
	char *pszTemp = NULL;
	int	iTemp;
	int	iFlag = 1;
		
	m_dwBufferSize = BUFFER_SIZE;

		//	We use the dwType passed in to decide what kind of pipe
		//	this is (byte or message based)
	m_dwPipeMode = 	dwType | PIPE_WAIT;	
	m_dwOpenMode = PIPE_ACCESS_DUPLEX;		

	m_dwMaxInstances =	PIPE_UNLIMITED_INSTANCES;
	
	m_dwOutBufferSize = m_dwBufferSize;			
	m_dwInBufferSize  = m_dwBufferSize;
	m_dwDefaultTimeOut = PIPE_TIMEOUT;			

	m_bServerIsClient = FALSE;

	m_sPipeInfo.dwState = 0;
	m_sPipeInfo.dwInstances = 0;
	ZeroMemory( m_sPipeInfo.szUserName, 0 );
	m_sPipeInfo.cbUserName = sizeof( m_sPipeInfo.szUserName );
	m_sPipeInfo.dwMaxCollectionCount = 0;
	m_sPipeInfo.dwCollectDataTimeout = 0; 


	//	m_saSecAttrib = NULL;		
	m_saSecAttrib.nLength = sizeof(SECURITY_ATTRIBUTES);
	m_saSecAttrib.bInheritHandle = 1;
	m_saSecAttrib.lpSecurityDescriptor = NULL;	
	if (m_saSecAttrib.lpSecurityDescriptor = (PSECURITY_DESCRIPTOR) LocalAlloc(LPTR, SECURITY_DESCRIPTOR_MIN_LENGTH)){
		if (InitializeSecurityDescriptor(m_saSecAttrib.lpSecurityDescriptor, SECURITY_DESCRIPTOR_REVISION)) {
			SetSecurityDescriptorDacl(m_saSecAttrib.lpSecurityDescriptor, TRUE, NULL, FALSE);
		}
	}

	SetSecurity();

	m_dwError = 0;
	strcpy( (char *) m_szError, "" );
	
	AllocateBuffer( m_dwBufferSize );
	
		//	Fix any slashes to backslashes
	pszTemp = szName;
	while( 0 != *pszTemp )
	{
		if( '/' == *pszTemp )
		{
			*pszTemp = '\\';
		}
		pszTemp++;
	}

	if( strncmp( (char *) szName, "\\\\", 2 ) == 0)
	{
		char	szBuffer[ MAX_COMPUTERNAME_LENGTH + 1 ];
		DWORD	cbBuffer = sizeof( szBuffer );

		m_iPipeType = CLIENT;
		iTemp = 0;

		m_bServerIsClient = TRUE;
			
		if( GetComputerName( 
			szBuffer,
			&cbBuffer ) )
		{
			char szCopyOfName[256];
			char *szTemp;
		
			strcpy( szCopyOfName, szName );
			
			szTemp = &szCopyOfName[ strspn( szCopyOfName, "\\/" ) ];
			
			szTemp[ strcspn( szName, "\\/" ) ] = '\0';
			
			if( 0 != stricmp( szBuffer, szTemp ) )
			{
				m_bServerIsClient = FALSE;
			}
		}
	}else{
		m_iPipeType = SERVER;
		strcpy( (char *) m_szName, PIPE_NAME_PREFIX);
		iTemp = strlen(PIPE_NAME_PREFIX);
	}
	strncat((char *)m_szName, szName, PIPE_NAME_SIZE - iTemp);

	if(m_iPipeType == SERVER){
		m_hPipe = CreateNamedPipe((const char *) m_szName,
								m_dwOpenMode, 
								m_dwPipeMode, 
								m_dwMaxInstances, 
								m_dwOutBufferSize, 
								m_dwInBufferSize, 
								m_dwDefaultTimeOut,
								&m_saSecAttrib);
	}else{
		while(iFlag){
			m_hPipe = CreateFile((LPCTSTR) m_szName,
								GENERIC_READ | GENERIC_WRITE, 
								FILE_SHARE_READ	| FILE_SHARE_WRITE,
								NULL,
								OPEN_EXISTING,
								FILE_ATTRIBUTE_NORMAL | FILE_FLAG_WRITE_THROUGH,
								NULL);
			if (GetLastError() == ERROR_PIPE_BUSY){
				iFlag = WaitNamedPipe((LPCTSTR)m_szName, dWait);
			}else{
				iFlag = 0;
			}
		}
			//	Set the type (eg. PIPE_TYPE_MESSAGE ) because CreateFile will
			//	not do it.
		State( dwType );
	}
	if( NULL == m_pBuffer ){
		m_dwError = 998;
		strcpy((char *)m_szError, "Could not allocate a buffer for the pipe connection");
		bResult = FALSE;
	}
	if( INVALID_HANDLE_VALUE == m_hPipe )
	{
		m_dwError = 999;
		strcpy((char *)m_szError, "Could not connect");
		bResult = FALSE;
	}

	m_fdFile = _open_osfhandle( (long) m_hPipe, _O_TEXT );

	return( bResult );
}	

CPipe *CPipe::CreateInstance( char *szName, DWORD dwWait, DWORD dwType )
{
	CPipe * pPipe = NULL;

	pPipe = new CPipe();
	if( NULL != pPipe )
	{
		if( FALSE == pPipe->Initialize( szName, dwWait, dwType ) )
		{
			delete pPipe;
			pPipe = NULL;
		}
	}
	return( pPipe );
}

CPipe::~CPipe(){
	Disconnect( TRUE );
	if( m_hPipe )
	{
		CloseHandle( m_hPipe );
		m_hPipe = 0;
	}
	if( NULL != m_pBuffer )
	{
		delete [] m_pBuffer;
	}
	if( NULL != m_saSecAttrib.lpSecurityDescriptor )
	{
		LocalFree( m_saSecAttrib.lpSecurityDescriptor );
	}
}

HANDLE CPipe::GetHandle(){
	return m_hPipe;
}

sPipeInfo *CPipe::GetInfo()
{
	BOOL bResult;

	m_sPipeInfo.dwState = PIPE_NOWAIT; 
	m_sPipeInfo.dwInstances = 0;
	m_sPipeInfo.dwMaxCollectionCount = 0;
	m_sPipeInfo.dwCollectDataTimeout = 0;
	strcpy( m_sPipeInfo.szUserName, "" );

	bResult = GetNamedPipeHandleState( 
		m_hPipe,
		&m_sPipeInfo.dwState,
		&m_sPipeInfo.dwInstances,
		( m_iPipeType == SERVER && m_bServerIsClient )? &m_sPipeInfo.dwMaxCollectionCount:0,
		( m_iPipeType == SERVER && m_bServerIsClient )? &m_sPipeInfo.dwCollectDataTimeout:0, 
		m_sPipeInfo.szUserName, 
 		m_sPipeInfo.cbUserName );

	return( ( 0 != bResult )? &m_sPipeInfo:0 );
}

DWORD CPipe::BufferSize(){
	return m_dwBufferSize;
}

DWORD CPipe::ResizeBuffer(DWORD dNewSize){
	CHAR	*szNewBuffer;

	if (dNewSize > 0){
		if (szNewBuffer = new char [dNewSize]){
			memset((void *)szNewBuffer, 0, dNewSize);
			delete [] m_pBuffer;
			m_dwBufferSize = dNewSize;
			m_pBuffer = szNewBuffer;
		}
	}
	return m_dwBufferSize;
}

char *CPipe::Read(DWORD *dLen){                   
	BOOL bResult;
	DWORD	cbBytes = 0, cbReply = 0;

	bResult = ReadFile(m_hPipe, m_pBuffer, m_dwBufferSize, dLen, NULL); 
	m_dwBytes = *dLen;
	return (bResult)? m_pBuffer:0;
}

int	CPipe::Write(void *vBuffer, DWORD dSize){
	BOOL bResult;
	DWORD	cbBytes = 0, cbReply = 0;

	bResult = WriteFile(m_hPipe, vBuffer, dSize, &cbBytes, NULL);
	return bResult;
}

BOOL CPipe::Transact(void **pBuffer, DWORD *dwSize)
{
	BOOL bResult;
	DWORD	cbBytes = 0, cbReply = 0;

	ZeroMemory( m_pBuffer, m_dwBufferSize );

	bResult = TransactNamedPipe(
			m_hPipe,
			*pBuffer,
			*dwSize,
			m_pBuffer,
			m_dwBufferSize,
			&cbBytes,
			NULL );
	if( FALSE != bResult )
	{
		*dwSize = cbBytes;
		*pBuffer = m_pBuffer;
	}
	else
	{
		*dwSize = 0;
		*pBuffer = NULL;
	}
	return bResult;
}


int CPipe::Connect(){
	BOOL bResult;

	bResult = ConnectNamedPipe(m_hPipe, NULL);

		//	Just in case the pipe is already connected return TRUE even though
		//	ConnectNamedPipe() returned FALSE!
	if (!bResult && GetLastError() == ERROR_PIPE_CONNECTED){
		bResult = 1;
	}
		
	return bResult;
}

int CPipe::Disconnect(int iPurge){
	BOOL	bResult = 0;

	if (iPurge){
		FlushFileBuffers(m_hPipe);
	}
	if (m_iPipeType == SERVER){
		bResult = DisconnectNamedPipe(m_hPipe);
	}
	if (m_iPipeType == CLIENT){
		bResult = CloseHandle(m_hPipe);
		m_hPipe = 0;
	}
	
	return bResult;
}	


int	CPipe::Error(int m_dwErrorNum, char *m_szErrorText){
	strncpy((char *)m_szError, m_szErrorText, ERROR_TEXT_SIZE);
	m_szError[ERROR_TEXT_SIZE] = '\0';
	m_dwError = m_dwErrorNum;
	return m_dwError;
}

int	CPipe::EndOfFile(){
	return (m_dwBytes)? 1:0;
}

DWORD CPipe::State( DWORD dwState )
{
	SetNamedPipeHandleState(
			m_hPipe,
			&dwState,
			NULL,
			NULL );
	return( State() );
}

DWORD CPipe::State()
{
	DWORD dwState = 0;

	GetNamedPipeHandleState(
		m_hPipe,
		&dwState,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL );

	return( dwState );
}

DWORD CPipe::Peek( char **ppszBuffer )
{
	DWORD	dwSize = 0;
	DWORD	dwRemain = 0;

	if( FALSE != PeekNamedPipe( m_hPipe, m_pBuffer, m_dwBufferSize, &dwSize, &dwRemain, NULL ) )
	{
		*ppszBuffer = NULL;
		dwSize = 0;
	}
	else
	{
		*ppszBuffer = m_pBuffer;
	}

	return( dwSize );	
}

DWORD CPipe::GetError()
{
	return( m_dwError );
}

const char *CPipe::GetErrorText()
{
	return( (char *) m_szError );
}

DWORD CPipe::GetBufferSize()
{
	return( m_dwBufferSize );
}

const char *CPipe::GetBuffer()
{
	return( m_pBuffer );
}

DWORD CPipe::AllocateBuffer( DWORD dwSize )
{
	if( NULL != m_pBuffer )
	{
		delete [] m_pBuffer;
		m_pBuffer = NULL;
	}

	m_dwBufferSize = dwSize;
	
	m_pBuffer = new char [ m_dwBufferSize ];
	if( NULL == m_pBuffer )
	{
		m_dwBufferSize = 0;
	}
	else
	{
		ZeroMemory( m_pBuffer, m_dwBufferSize );
	}

	return( m_dwBufferSize );
}

BOOL CPipe::SetSecurity()
{
	BOOL bResult = FALSE;	
	PSECURITY_DESCRIPTOR pSD = NULL;

		// Allocate memory for the security descriptor.
	pSD = (PSECURITY_DESCRIPTOR) LocalAlloc(LPTR, SECURITY_DESCRIPTOR_MIN_LENGTH);
	if( NULL == pSD )
	{
		
			// Initialize the new security descriptor.
		InitializeSecurityDescriptor(pSD, SECURITY_DESCRIPTOR_REVISION);
			
			// Add a NULL descriptor ACL to the security descriptor.
		SetSecurityDescriptorDacl(pSD, TRUE, (PACL) NULL, FALSE);

		m_saSecAttrib.nLength = sizeof(m_saSecAttrib);
		m_saSecAttrib.lpSecurityDescriptor = pSD;
		m_saSecAttrib.bInheritHandle = TRUE;
		
		bResult = TRUE;
	}

	return( bResult );
}


/*
	//	
	//	Set the NULL security discriptor
	//

	{
		PSECURITY_DESCRIPTOR	pSD;
		PACL	pACLNew;
		DWORD	cbACL;
		PSID	pSID;
		DWORD	cbSID;
		LPSTR	lpszAccount;
		LPSTR	lpszDomain;
		DWORD	cchDomainName;
		DWORD	cbType;
		PSID_NAME_USE	psnuType;

			//	Just creating a shortcut! :) 
		pSD = &m_saSecAttrib.lpSecurityDescriptor;
		pACLNew = 0;                               
		cbACL = DEFAULT_ACL_SIZE;                  
		pSID = 0;                                  
		cbSID = DEFAULT_ACL_SIZE;                  
		lpszAccount = 0;                           
		lpszDomain  = 0;                           
		cchDomainName = 0;       
		cbType = 1024;                             
		psnuType = 0;
		pSID = (PSID) LocalAlloc(LPTR, cbSID);
			//	No error checking ... we are [stupidly] assuming all is well.
		LookupAccountName( 0, "Everyone", pSID, &cbSID, lpszDomain, &cchDomainName, psnuType);
		if (IsValidSid(pSID)){
			PACL	pACL;
			if(InitializeAcl(pACL, cbACL, ACL_REVISION2)){
				if(AddAccessAllowedAce(pAcl, ACL_REVISION2, GENERIC_ALL, pSID)){
					if(SetSecurityDescriptorDacl(pSD, TRUE, pACL, FALSE)){
						iResult = 1;
					}
				}
			}
		}
		if (!iResult){
			pSD = 0;
		}
			
	}
*/

