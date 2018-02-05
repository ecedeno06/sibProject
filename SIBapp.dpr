program SIBapp;

uses
  Vcl.Forms,
  SIB in 'SIB.pas' {frmSIB},
  dm in 'dm.pas' {dm1: TDataModule},
  login in 'login.pas' {frmLogin},
  Ventana3 in 'Ventana3.pas' {frmVentana},
  Poliza in 'Poliza.pas' {frmPoliza},
  Mant_TipoGestion in 'Mant_TipoGestion.pas' {frmTipoGestion},
  Mant_Areas in 'Mant_Areas.pas' {frmArea};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm1, dm1);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
