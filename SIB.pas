unit SIB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ToolWin, Vcl.Menus,DateUtils, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,clipbrd;

type
  TfrmSIB = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    CategoryPanelGroup1: TCategoryPanelGroup;
    CategoryPanel1: TCategoryPanel;
    CategoryPanel2: TCategoryPanel;
    Image1: TImage;
    Splitter1: TSplitter;
    dp_cumpleanos: TDateTimePicker;
    mnu_SIB: TMainMenu;
    ParametrosSistema1: TMenuItem;
    consultas1: TMenuItem;
    Administracion1: TMenuItem;
    Polizas1: TMenuItem;
    Renovaciones1: TMenuItem;
    Endosos1: TMenuItem;
    Reportes1: TMenuItem;
    Produccion1: TMenuItem;
    Renovaciones2: TMenuItem;
    tb_SIB: TToolBar;
    dts_cumpleanos: TDataSource;
    DBGrid2: TDBGrid;
    ToolButton3: TToolButton;
    sb_Sib_Salir: TSpeedButton;
    sb_Sib_Poliza: TSpeedButton;
    Mapa1: TMenuItem;
    ToolButton1: TToolButton;
    sb_sib_Mapa: TSpeedButton;
    Timer1: TTimer;
    Pendientes: TFDQuery;
    dts_Pendientes: TDataSource;
    PendientesidGestion: TFDAutoIncField;
    Pendientesfecha: TSQLTimeStampField;
    Pendientesusuario: TStringField;
    Pendientesasignado: TStringField;
    Pendientesestado: TIntegerField;
    PendientesfechaInicio: TSQLTimeStampField;
    PendientesfechaCierre: TSQLTimeStampField;
    Pendientespoliza: TStringField;
    Pendientesramo_Subramo: TIntegerField;
    Pendientesvigencia: TIntegerField;
    Pendientesid_cia: TIntegerField;
    Pendientesaseguradora: TIntegerField;
    Pendientesasegurado: TIntegerField;
    Pendientesnota: TMemoField;
    Pendientescorreos: TStringField;
    Pendientesusuario_anterior: TStringField;
    Pendientesusuario_reasignado: TStringField;
    Pendientestipo_gestion: TIntegerField;
    Pendientesfecha_aud: TSQLTimeStampField;
    Pendientesusuario_aud: TStringField;
    PendientestiempoGestion: TSQLTimeStampField;
    PendientesreAsignado: TBooleanField;
    Pendientesguid: TStringField;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    sb_CargarPendientes: TSpeedButton;
    Archivos1: TMenuItem;
    MantTipoGestion1: TMenuItem;
    mnu_Man_Areas: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure dp_cumpleanosChange(Sender: TObject);
    procedure sb_Sib_SalirClick(Sender: TObject);
    procedure Polizas1Click(Sender: TObject);
    procedure Mapa1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sb_CargarPendientesClick(Sender: TObject);
    Procedure CargarPendientes;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure MantTipoGestion1Click(Sender: TObject);
    procedure mnu_Man_AreasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSIB: TfrmSIB;

implementation

{$R *.dfm}

uses dm, Poliza, Mant_TipoGestion, Mant_Areas;

procedure TfrmSIB.CargarPendientes;
begin
 Pendientes.Close;
  Pendientes.Params [0].AsString := usuario.id;
  Pendientes.Open()
end;

procedure TfrmSIB.DBGrid1DblClick(Sender: TObject);
begin
  usuario.caso := Pendientesguid.AsString ;
//  ShowMessage(usuario.caso);
  application.CreateForm(TfrmPoliza , frmPoliza);
  Clipboard.AsText := usuario.caso;
  frmPoliza.Show;
end;

procedure TfrmSIB.dp_cumpleanosChange(Sender: TObject);
var
  d,m,a : word;
  hh,mm,ss,zz : word;
begin
  decodeDateTime(dp_cumpleanos.Datetime,a,m,d,hh,mm,ss,zz);
  dm1.cumpleanos.Close;
  dm1.cumpleanos.params [0].asinteger := d;
  dm1.cumpleanos.params [1].asinteger := m;
  dm1.cumpleanos.Open();
end;

procedure TfrmSIB.FormShow(Sender: TObject);
begin
  frmSIB.Caption := frmSib.Caption + ' - ' + usuario.id;
  dp_cumpleanos.Datetime := now;
  dp_cumpleanosChange(sender);

  Pendientes.Close;
  Pendientes.Params [0].AsString := usuario.id;
  Pendientes.Open()

end;

procedure TfrmSIB.MantTipoGestion1Click(Sender: TObject);
begin
  application.CreateForm(TfrmTipoGestion  , frmTipoGestion);
  frmTipoGestion.Show;
end;

procedure TfrmSIB.Mapa1Click(Sender: TObject);
begin
//
end;

procedure TfrmSIB.mnu_Man_AreasClick(Sender: TObject);
begin
  application.CreateForm(TfrmArea , frmArea);
  usuario.caso := '';
  frmArea.Show;
end;

procedure TfrmSIB.Polizas1Click(Sender: TObject);
begin
  application.CreateForm(TfrmPoliza , frmPoliza);
  usuario.caso := '';
  frmPoliza.Show;
end;

procedure TfrmSIB.sb_Sib_SalirClick(Sender: TObject);
begin
  case MessageDlg('Esta Seguro de SALIR del Sistema...?',
          mtConfirmation, [mbOK, mbCancel], 0,mbCancel) of
    mrOk:
    begin

      dm1.RegistroLog(usuario.id,'Salida del Sistema','Salida del sistema...');
      Application.Terminate;
    end;
    mrCancel:
     exit;
  end;
end;

procedure TfrmSIB.sb_CargarPendientesClick(Sender: TObject);
begin
  CargarPendientes;
end;

procedure TfrmSIB.Timer1Timer(Sender: TObject);
begin
  CargarPendientes;
end;

end.
