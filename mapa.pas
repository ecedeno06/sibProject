unit mapa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Ventana3, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Buttons,clipbrd, Vcl.StdCtrls,Vcl.ToolWin;

type
  TfrmMapa = class(TfrmVentana)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    btn_pol_new: TSpeedButton;
    ed_Map: TEdit;
    ed_Direccion: TButtonedEdit;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    procedure btn_pol_newClick(Sender: TObject);
    procedure WebGMaps1MapDblClick(Sender: TObject; Latitude, Longitude: Double;
      X, Y: Integer);
    procedure WebGMaps1MapClick(Sender: TObject; Latitude, Longitude: Double; X,
      Y: Integer; Button: TMouseButton);
    procedure WebGMaps1MarkerClick(Sender: TObject; MarkerTitle: string;
      IdMarker: Integer; Latitude, Longitude: Double; Button: TMouseButton);
    procedure ed_DireccionLeftButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMapa: TfrmMapa;

implementation

{$R *.dfm}

uses dm;

procedure TfrmMapa.btn_pol_newClick(Sender: TObject);
var
  bm: TBitmap;
begin
  inherited;

  bm := TBitmap.Create;
  try
    bm.SetSize(ClientWidth, ClientHeight);
    BitBlt(bm.Canvas.Handle, 0, 0, ClientWidth, ClientHeight, Canvas.Handle, 0, 0, SRCCOPY);
    Clipboard.Assign(bm);
  finally
    bm.Free;
  end;




end;

procedure TfrmMapa.ed_DireccionLeftButtonClick(Sender: TObject);
begin
  inherited;

//

end;


procedure TfrmMapa.WebGMaps1MapClick(Sender: TObject; Latitude,
  Longitude: Double; X, Y: Integer; Button: TMouseButton);
begin
  inherited;
  ed_Map.Text :=  formatFloat('###.#######',Latitude) +
  ',' + formatFloat('###.#######,####',Longitude) ;
end;

procedure TfrmMapa.WebGMaps1MapDblClick(Sender: TObject; Latitude,
  Longitude: Double; X, Y: Integer);
begin
  inherited;
  //WebGMaps1.Markers.Add(Latitude,Longitude,'Direccion');
end;

procedure TfrmMapa.WebGMaps1MarkerClick(Sender: TObject; MarkerTitle: string;
  IdMarker: Integer; Latitude, Longitude: Double; Button: TMouseButton);
begin
  inherited;
  //WebGMaps1.Markers.Delete(IdMarker) ;
end;



end.
