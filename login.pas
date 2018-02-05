unit login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  Data.Bind.Components, System.ImageList, Vcl.ImgList, Vcl.ExtCtrls,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdServerIOHandler, IdServerIOHandlerSocket, IdServerIOHandlerStack,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP, IdBaseComponent, IdMessage, Vcl.ComCtrls,
  Vcl.ToolWin, Vcl.StdCtrls, Vcl.Samples.Spin, Vcl.Imaging.jpeg,
  IdGlobal, IdHash, IdHashMessageDigest, Data.DB, Vcl.DBCtrls, Vcl.Mask;

type
  TfrmLogin = class(TForm)
    Splitter1: TSplitter;
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    CategoryPanelGroup1: TCategoryPanelGroup;
    ctMision: TCategoryPanel;
    mMision: TMemo;
    ctVision: TCategoryPanel;
    mVision: TMemo;
    CategoryPanel2: TCategoryPanel;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    ToolBar2: TToolBar;
    btnGeneralesSalvar1: TToolButton;
    stbLogin: TStatusBar;
    mensaje: TIdMessage;
    SMTP: TIdSMTP;
    IdServerIOHandlerStack1: TIdServerIOHandlerStack;
    SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
    Timer1: TTimer;
    ImageList1: TImageList;
    BindingsList1: TBindingsList;
    BalloonHint1: TBalloonHint;
    Image2: TImage;
    Panel3: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    btnEntrar: TButton;
    Label2: TLabel;
    cxbCambiar: TCheckBox;
    dts_ciaUsuario: TDataSource;
    dts_usuario: TDataSource;
    edUsuario: TDBEdit;
    edClave: TDBEdit;
    Splitter2: TSplitter;
    dbl_compania: TDBLookupComboBox;
    PageControl2: TPageControl;
    ts_log_Cambio: TTabSheet;
    gbCambio: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edClaveNueva: TEdit;
    edClaveConfirmacion: TEdit;
    Button1: TButton;
    pb1: TProgressBar;
    edRespuesta2: TEdit;
    sbCambio: TStatusBar;
    ts_log_Bloqueo: TTabSheet;
    SolicitarClave: TGroupBox;
    lblMensaje1: TLabel;
    cxbOlvidoClave: TCheckBox;
    btnGenerarClave: TButton;
    gbSecreta: TGroupBox;
    lbPregunta: TLabel;
    edRespuesta: TEdit;
    procedure edUsuarioEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edUsuarioExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edClaveChange(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure dbl_companiaExit(Sender: TObject);
  private
    { Private declarations }
    Function ValidarClave(Usuario,Clave : String ; cia : integer) :Boolean;
  public
    { Public declarations }
    Function MD5(S : String):String ;
  end;

const
  Codes64 = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz+/';
var
  frmLogin: TfrmLogin;
  compEnvioEmail : TIdSMTP;
  _bloqueado     : boolean;
  _activo        : boolean;
  _cambioPass    : boolean;
  _mensaje       : string;
  _claveVence    : int16;

implementation

{$R *.dfm}

uses dm, SIB;

procedure TfrmLogin.edUsuarioExit(Sender: TObject);
begin
  dm1.ciaUsuario.Close;
  dm1.ciaUsuario.Params [0].AsString := edUsuario.Text ;
  dm1.ciaUsuario.Open();

  if not  dm1.ciaUsuario.eof  then
  Begin
     dbl_compania.SetFocus;
  End Else
  Begin
    edUsuario.Clear;
    edUsuario.SetFocus;
  End;

end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
   dm1._usuario.Close;
   dm1._usuario.Open;
   dm1._usuario.Append;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin

   dm1.ciaUsuario.Close;
   dm1.ciaUsuario.Open;
   edUsuario.SetFocus;
end;

function TfrmLogin.MD5(S: String): String;
begin
   with TIdHashMessageDigest5.Create do
   begin
      Result := HashStringAsHex(S);
    end;

end;


function TfrmLogin.ValidarClave(Usuario, Clave: String ; Cia : Integer): Boolean;
var
  sfecha : string;
  dFecha : TDateTime;
  Continuar : boolean;

begin
  Result := False;
  dm1.usuario.Close;
  dm1.usuario.SQL.Clear;
  dm1.usuario.SQL.Add (' Select * from users where ' );
  dm1.usuario.SQL.Add (' xuser     = ' + quotedStr(upperCase(usuario)));
  dm1.usuario.SQL.Add (' and passw = ' + quotedStr(edclave.text));//+ quotedStr(MD5(clave)));
  dm1.usuario.SQL.Add (' and id_centro = ' + dm1._usuarioid_centro.AsString );
  dm1.usuario.Open;
  dm1.usuario.First;

  if Not dm1.usuario.eof  then
  begin
    Continuar := true;
    if Continuar then
    Begin
      Result:= true;
    end else
    Begin
      Result  := false;
      ShowMessage('Usuario no Valido...');
    End;

  end
  Else
  Begin
    Result := false;
  End;
end;

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
var
 panel_Bienes : Tpanel;
begin
  if ValidarClave (edUsuario.Text , edClave.Text , dm1._usuarioid_centro.AsInteger) then
  Begin

    usuario.id     := dm1.usuarioxuser.AsString ;
    usuario.nombre := dm1.usuarionombre.AsString + ' ' + dm1.usuarioapellido.AsString ;
    usuario.cia    := dm1._usuarioid_centro.AsInteger ;
    usuario.ciaNombre := dm1.ciaUsuarionombre.AsString ;
    dm1.usuario.close;
    dm1.RegistroLog(usuario.id ,'Acceso al Sistema ' , 'Accedio a ' + dbl_compania.Text);
    frmLogin.Free;
    application.CreateForm(TfrmSIB , frmSIB);
    frmSIB.Show;



  End;
end;

procedure TfrmLogin.dbl_companiaExit(Sender: TObject);
begin
  edClave.SetFocus;
end;

procedure TfrmLogin.edClaveChange(Sender: TObject);
begin
  if length(trim(edClave.Text)) > 0 then
  Begin
    btnEntrar.Enabled := True;
  End;

end;

procedure TfrmLogin.edUsuarioEnter(Sender: TObject);
begin
 edClave.Text            := '';

 gbCambio.Visible        := False;
 SolicitarClave.Visible  := false;
 cxbCambiar.Visible      := false;
 cxbCambiar.Checked      := false;
 gbSecreta.Visible       := False;

   _bloqueado     := false;
   _activo        := false;
   _cambioPass    := false;

end;

end.
