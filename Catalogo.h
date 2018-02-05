//---------------------------------------------------------------------------

#ifndef CatalogoH
#define CatalogoH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ComCtrls.hpp>
//---------------------------------------------------------------------------
class TfrmCatalogo : public TForm
{
__published:	// IDE-managed Components
	TStatusBar *StatusBar1;
private:	// User declarations
public:		// User declarations
	__fastcall TfrmCatalogo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmCatalogo *frmCatalogo;
//---------------------------------------------------------------------------
#endif
