
#ifdef	PERL_OBJECT
#define		PERL_OBJECT_PROTO	CPerl *pPerl,
#define		PERL_OBJECT_ARG		pPerl,
#else	//	PERL_OBJECT
#define		PERL_OBJECT_PROTO	
#define		PERL_OBJECT_ARG		
#endif	//	PERL_OBJECT


#define	EXTENSION_NAMESPACE	"Win32::Pipe"

#define	SYNTAX_ERROR	999
#define CROAK(xxxx)													\
				PUSHMARK(sp);										\
				XPUSHs(sv_2mortal(newSVnv((double)SYNTAX_ERROR)));	\
				XPUSHs(sv_2mortal(newSVpv(xxxx, strlen(xxxx))));	\
				PUTBACK;											\
				return;												\

#define	PIPE_TIMEOUT	5000

#define	VERNAME		"Pipe extension for Win32 Perl"
#define VERSION		"980429"
#define VERDATE		__DATE__
#define VERAUTH     "Dave Roth <rothd@roth.net>"
#define VERCRED		"Copyright (c) 1996-1998 Dave Roth.\n"	
					 

#define	MAX_BUFFER_SIZE		10240

#define	CLASS_POINTER_MEMBER_NAME			"m_hPipe"

#define	GET_PIPE()					GetObjectPointer( PERL_OBJECT_ARG GetSelf( PERL_OBJECT_ARG (SV *) ST( 0 ) ) )

int	Error(int iErrorNum, char *szErrorText);
void FixPath( char *pszPath );
HV	*GetSelf( PERL_OBJECT_PROTO SV *svSelf );
CPipe *GetObjectPointer( PERL_OBJECT_PROTO HV *hv );