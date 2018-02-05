unit Mant_Areas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Ventana3, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls, FireDAC.Stan.Async, FireDAC.DApt;

type
  TfrmArea = class(TfrmVentana)
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel17: TPanel;
    Image2: TImage;
    sb_nueva: TSpeedButton;
    sb_salvar: TSpeedButton;
    sb_unDo: TSpeedButton;
    sb_Editar: TSpeedButton;
    grp_gestion: TGroupBox;
    DBGrid1: TDBGrid;
    dts_areas: TDataSource;
    mt_area: TFDMemTable;
    Descripcion: TDBEdit;
    dts_marea: TDataSource;
    DBCheckBox1: TDBCheckBox;
    Label4: TLabel;
    ActualizarArea: TFDQuery;
    mt_areaid_area: TFDAutoIncField;
    mt_areadescripcion: TStringField;
    mt_areaactiva: TBooleanField;
    mt_areaguid: TStringField;
    ActualizarAreaid_area: TFDAutoIncField;
    ActualizarAreadescripcion: TStringField;
    ActualizarAreaactiva: TBooleanField;
    ActualizarAreaguid: TStringField;
    procedure FormShow(Sender: TObject);
    procedure cargararea;
    Procedure CargarAreas;
    procedure dts_areasDataChange(Sender: TObject; Field: TField);
    procedure sb_nuevaClick(Sender: TObject);
    procedure sb_EditarClick(Sender: TObject);
    procedure sb_salvarClick(Sender: TObject);
    procedure sb_unDoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmArea: TfrmArea;

implementation

{$R *.dfm}

uses dm, SIB;

procedure TfrmArea.cargararea;
Var
i : integer;
begin
//---
 mt_area.Close;
 mt_area.Open;
 mt_area.Append;

 for I := 0 to dm1.areas.FieldCount -1 do
 begin
     mt_area.Fields[i].Value :=  dm1.areas.fields[i].Value;
 end;

 sb_nueva.Enabled  := true;
 sb_Editar.Enabled := False;
 grp_gestion.Enabled       := false;
 mt_area.first;

 if not mt_area.Eof   then
  sb_Editar.Enabled  := true;

end;

procedure TfrmArea.CargarAreas;
begin
  dm1.areas.Close;
  dm1.areas.Open();
end;

procedure TfrmArea.dts_areasDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  cargararea;

  sb_nueva.Enabled  := true;
  sb_Editar.Enabled := false;

  if not mt_area.eof then
    sb_Editar.Enabled := true;


  sb_salvar.Enabled := false;
  sb_unDo.Enabled:= false;
  grp_gestion.Enabled := false;

end;

procedure TfrmArea.FormShow(Sender: TObject);
begin
  inherited;
  cargarAreas;
  //-- asi esta bien
  //--- ahora hace falta hacer el llamdo desde el menu ... que esta en el formulario principal (sIB)

  end;

procedure TfrmArea.sb_EditarClick(Sender: TObject);
begin
  inherited;
  sb_salvar.Enabled := true;
  sb_unDo.Enabled:= true;
  sb_Editar.Enabled:= false;
  sb_nueva.Enabled:= false;

  mt_area.First;
  if not mt_area.eof  then
  begin
    mt_area.Edit;
    grp_gestion.Enabled := True;
    Descripcion.SetFocus;
  end
  else
    grp_gestion.Enabled := False;

end;

procedure TfrmArea.sb_nuevaClick(Sender: TObject);
begin
  inherited;
  mt_area.Close;
  mt_area.Open;
  mt_area.Append;

  sb_salvar.Enabled := true;
  sb_unDo.Enabled:= true;
  sb_nueva.Enabled:= false;
  sb_Editar.Enabled := false;

  grp_gestion.Enabled := True;
  Descripcion.SetFocus;
end;

procedure TfrmArea.sb_salvarClick(Sender: TObject);
var
  i : integer;
  MyClass: TComponent;
  _continuar : Boolean;
  _guid      : String;
begin
  inherited;
  sb_Editar.Enabled := true;
  sb_nueva.Enabled:= true;
  sb_salvar.Enabled := false;
  sb_unDo.Enabled:= false;

  _Continuar := true;

  //--- Validacion de rol


  //----

  if not dm1.sib.InTransaction then
    dm1.sib.StartTransaction ;

  //---

  if mt_area.State = dsInsert then
  begin
    _guid := dm1._guid ;
    mt_area.Post;
    ActualizarArea.Close;
    ActualizarArea.Open;
    ActualizarArea.Append;
  end
  Else
    if mt_area.State = dsEdit then //---Modo de edicion
    Begin

      mt_area.Post;

      ActualizarArea.Close;
      ActualizarArea.Params [0].AsInteger := mt_areaid_area.AsInteger ;
      ActualizarArea.Open();
      ActualizarArea.First;

      if ActualizarArea.eof then
      Begin
        ActualizarArea.close;
        _continuar := False;
      End
      Else
      Begin
        if ActualizarAreaguid.AsString = '' then
          _guid := dm1._guid
        else
          _guid :=  ActualizarAreaguid.AsString ;

        ActualizarArea.edit;
      End;
    End
    Else
      _Continuar := False;

 if _Continuar then
 Begin
   try

     For I := 1 to mt_area.FieldCount -1 do
     Begin
       ActualizarArea.Fields[i].Value := mt_area.Fields[i].Value ;
     End;

     ActualizarAreaguid.AsString := _guid ;

     ActualizarArea.Post;
     dm1.sib.Commit;
     CargarAreas;
     dm1.tipoGestiones.Locate('guid',_guid);
     cargararea;

   Except
     on e:exception do
     Begin
       ShowMessage('Error al insertar tipo de Gestion...'+e.Message );
       dm1.sib.Rollback ;
     End;
   end;
 End;

end;

procedure TfrmArea.sb_unDoClick(Sender: TObject);
begin
  inherited;
  cargararea ;

  sb_Editar.Enabled := true;
  sb_nueva.Enabled:= true;
  sb_salvar.Enabled := false;
  sb_unDo.Enabled:= false;


end;

end.
