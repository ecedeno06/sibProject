unit mapa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Ventana3, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls,clipbrd,
  Vcl.StdCtrls,
  Vcl.ExtDlgs  ;

type
  Tfrmmapa2 = class(TfrmVentana)
    Panel1: TPanel;
    Splitter1: TSplitter;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
 //   WebGMaps1: TWebGMaps;
    ed_Direccion: TButtonedEdit;
 //   WebGMapsGeocoding1: TWebGMapsGeocoding;
    ed_Map: TEdit;
//    WebGMapsReverseGeocoding1: TWebGMapsReverseGeocoding;
    Button1: TButton;
    Button2: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    OpenTextFileDialog1: TOpenTextFileDialog;
    Label1: TLabel;
//    procedure SpeedButton1Click(Sender: TObject);
    procedure ed_DireccionLeftButtonClick(Sender: TObject);
    procedure WebGMaps1MapClick(Sender: TObject; Latitude, Longitude: Double; X,
      Y: Integer; Button: TMouseButton);

    function BinToStr(Binary: PByte; Len: Cardinal): String;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure WriteString(Stream: TFileStream; var SourceBuffer: PChar; s: string);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  CRYPT_STRING_BASE64 = 1;

var
  frmmapa2: Tfrmmapa2;
  Texto: String;

implementation

{$R *.dfm}

function CryptBinaryToString(pbBinary: PByte; cbBinary: DWORD; dwFlags: DWORD;
  pszString: PChar; var pcchString: DWORD): BOOL; stdcall;
  external 'Crypt32.dll' name 'CryptBinaryToStringA';

function CryptStringToBinary(pszString: PChar; cchString: DWORD; dwFlags: DWORD;
  pbBinary: PByte; var pcbBinary: DWORD; pdwSkip: PDWORD;
  pdwFlags: PDWORD): BOOL; stdcall;
  external 'Crypt32.dll' name 'CryptStringToBinaryA';

procedure StrToStream(Str: String; Stream: TStream);
var
  Buffer: PByte;
  Count: DWORD;
begin
  Count:= 0;
  if CryptStringToBinary(PChar(Str),Length(Str),CRYPT_STRING_BASE64,nil,Count,
    nil,nil) then
  begin
    GetMem(Buffer,Count);
    try
      if CryptStringToBinary(PChar(Str),Length(Str),CRYPT_STRING_BASE64,Buffer,
        Count,nil,nil) then
        Stream.WriteBuffer(Buffer^,Count);
    finally
      FreeMem(Buffer);
    end;
  end;
end;


function Tfrmmapa2.BinToStr(Binary: PByte; Len: Cardinal): String;
var
  Count: DWORD;
begin
  Count:= 0;
  if CryptBinaryToString(Binary,Len,CRYPT_STRING_BASE64,nil,Count) then
  begin
    SetLength(Result,Count);
    if not CryptBinaryToString(Binary,Len,CRYPT_STRING_BASE64,PChar(Result),
      Count) then
      Result:= EmptyStr;
  end;
end;

procedure Tfrmmapa2.Button1Click(Sender: TObject);
var
  Stream: TMemoryStream;
  FileName : String;
  SourceBuffer : PChar;
  MyFile: TFileStream;
  Writer: TStreamWriter;
begin
  inherited;

  Stream:= TMemoryStream.Create;
  OpenPictureDialog1.Filter := 'Archivo de Imagen(*.jpg) |*.jpg';
  if OpenPictureDialog1.Execute then
  begin

    try

// { Close and Free the writer. }
//      Writer.Free();
////      Stream.LoadFromFile('imagen.jpg');
     Stream.LoadFromFile(OpenPictureDialog1.filename);
     Texto:= BinToStr(Stream.Memory,Stream.Size);

     Writer := TStreamWriter.Create('c:\borrame\local_file.txt',
             false, TEncoding.UTF8);
     Writer.WriteLine(Texto);
     Writer.Write(Texto);
     Writer.Free();

////      Clipboard.AsText := texto;

    finally
      Stream.Free;
    end;
  end;
end;

procedure Tfrmmapa2.Button2Click(Sender: TObject);
var
 Stream: TFileStream;
 Texto : TStrings;
begin
  inherited;
  if OpenTextFileDialog1.Execute then
  Begin
  //  Texto := texto.LoadFromFile(OpenTextFileDialog1.FileName);
  End;

  Stream:= TFileStream.Create('c:\edwin2.jpg',fmCreate);
  try
  //  StrToStream(Texto,Stream);
  finally
    Stream.Free;
   end;
end;

procedure Tfrmmapa2.ed_DireccionLeftButtonClick(Sender: TObject);
begin
  inherited;
//  WebGMapsGeocoding1.Address := ed_Direccion.Text ;
//
//  WebGMapsGeocoding1.LaunchGeocoding;
//  WebGMaps1.MapPanTo(WebGMapsGeocoding1.ResultLatitude,
//  WebGMapsGeocoding1.ResultLongitude);//  // set coordinates of location to see with street view
////  WebGMaps1.StreetViewOptions.DefaultLatitude :=
////  WebGMapsGeocoding1.ResultLatitude;
////  WebGMaps1.StreetViewOptions.DefaultLongitude :=
////  WebGMapsGeocoding1.ResultLongitude;
//  WebGMaps1.MapPanTo(WebGMapsGeocoding1.ResultLatitude,WebGMapsGeocoding1.ResultLongitude);
//  WebGMaps1.MapOptions.ZoomMap := 20;
//  WebGMaps1.SetFocus;
// // let the map switch to streetview
// // webgmaps1.StreetViewOptions.Visible := true;
end;

//procedure Tfrmmapa2.SpeedButton1Click(Sender: TObject);
//var
//  bm: TBitmap;
//begin
//  inherited;
//
//  bm := TBitmap.Create;
//  try
//    bm.SetSize(ClientWidth, ClientHeight);
//    BitBlt(bm.Canvas.Handle, 0, 0, ClientWidth, ClientHeight, Canvas.Handle, 0, 0, SRCCOPY);
//    Clipboard.Assign(bm);
//  finally
//    bm.Free;
//  end;
//end;

procedure Tfrmmapa2.WebGMaps1MapClick(Sender: TObject; Latitude,
  Longitude: Double; X, Y: Integer; Button: TMouseButton);
begin
  inherited;
    ed_Map.Text :=  formatFloat('###.#######',Latitude) +
  ',' + formatFloat('###.#######,####',Longitude) ;



end;

procedure Tfrmmapa2.WriteString(Stream: TFileStream; var SourceBuffer: PChar;
  s: string);
begin
  StrPCopy(SourceBuffer,s);
  Stream.Write(SourceBuffer[0], StrLen(SourceBuffer));
end;

end.


{https://mzemaitis.wordpress.com/tag/save-string-unicode-textfile-delphi/}
//http://www.clubdelphi.com/foros/archive/index.php?t-37802.html
