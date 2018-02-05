unit Ventana3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls;

type
  TfrmVentana = class(TForm)
    StatusBar1: TStatusBar;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVentana: TfrmVentana;

implementation

{$R *.dfm}

procedure TfrmVentana.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    action := cafree;
end;

procedure TfrmVentana.FormDestroy(Sender: TObject);
begin
  self := nil;
end;

end.
