program AppMigracion;

uses
  Vcl.Forms,
  Migracion in 'Migracion.pas' {Form1},
  DataModulo in 'DataModulo.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
