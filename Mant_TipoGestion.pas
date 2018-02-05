unit Mant_TipoGestion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Ventana3, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls, FireDAC.Stan.Async, FireDAC.DApt;

type
  TfrmTipoGestion = class(TfrmVentana)
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel17: TPanel;
    Image2: TImage;
    sb_gestion_nueva: TSpeedButton;
    sb_gestion_salvar: TSpeedButton;
    sb_gestion_unDo: TSpeedButton;
    sb_gestion_Editar: TSpeedButton;
    grp_gestion: TGroupBox;
    DBGrid1: TDBGrid;
    dts_tipoGestiones: TDataSource;
    mt_tipogestion: TFDMemTable;
    Descripcion: TDBEdit;
    dts_mtipogestion: TDataSource;
    Label2: TLabel;
    mt_tipogestionid_tipo: TFDAutoIncField;
    mt_tipogestiondescripcion: TStringField;
    mt_tipogestionarea: TIntegerField;
    mt_tipogestionguid: TStringField;
    mt_tipogestionactiva: TBooleanField;
    DBCheckBox1: TDBCheckBox;
    dts_areas: TDataSource;
    dbl_area: TDBLookupComboBox;
    Label4: TLabel;
    ActualizarGestion: TFDQuery;
    ActualizarGestionid_tipo: TFDAutoIncField;
    ActualizarGestiondescripcion: TStringField;
    ActualizarGestionactiva: TBooleanField;
    ActualizarGestionarea: TIntegerField;
    ActualizarGestionguid: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure cargargestion;
    Procedure CargarGestiones;
    procedure dts_tipoGestionesDataChange(Sender: TObject; Field: TField);
    procedure sb_gestion_nuevaClick(Sender: TObject);
    procedure sb_gestion_EditarClick(Sender: TObject);
    procedure sb_gestion_salvarClick(Sender: TObject);
    procedure sb_gestion_unDoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoGestion: TfrmTipoGestion;

implementation

{$R *.dfm}

uses dm;

procedure TfrmTipoGestion.cargargestion;
Var
i : integer;
begin
//---
 mt_tipoGestion.Close;
 mt_tipogestion.Open;
 mt_tipogestion.Append;

 for I := 0 to dm1.tipoGestiones.FieldCount -1 do
 begin
     mt_tipogestion.Fields[i].Value :=  dm1.tipoGestiones.fields[i].Value;
 end;

 sb_gestion_nueva.Enabled  := true;
 sb_gestion_Editar.Enabled := False;
 grp_gestion.Enabled       := false;
 mt_tipogestion .first;

 if not mt_tipogestion.Eof   then
  sb_gestion_Editar.Enabled  := true;

end;

procedure TfrmTipoGestion.CargarGestiones;
begin
  dm1.tipoGestiones.Close;
  dm1.tipoGestiones.Open();
end;

procedure TfrmTipoGestion.dts_tipoGestionesDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  cargargestion;

  sb_gestion_nueva.Enabled  := true;
  sb_gestion_Editar.Enabled := false;

  if not mt_tipogestion.eof then
    sb_gestion_Editar.Enabled := true;


  sb_gestion_salvar.Enabled := false;
  sb_gestion_unDo.Enabled:= false;
  grp_gestion.Enabled := false;

end;

procedure TfrmTipoGestion.FormShow(Sender: TObject);
begin
  inherited;
  cargarGestiones;
  //-- asi esta bien
  //--- ahora hace falta hacer el llamdo desde el menu ... que esta en el formulario principal (sIB)

  dm1.areas.Close;
  dm1.areas.Open();
  end;

procedure TfrmTipoGestion.sb_gestion_EditarClick(Sender: TObject);
begin
  inherited;
  sb_gestion_salvar.Enabled := true;
  sb_gestion_unDo.Enabled:= true;
  sb_gestion_Editar.Enabled:= false;
  sb_gestion_nueva.Enabled:= false;

  mt_tipogestion.First;
  if not mt_tipogestion.eof  then
  begin
    mt_tipogestion.Edit;
    grp_gestion.Enabled := True;
    Descripcion.SetFocus;
  end
  else
    grp_gestion.Enabled := False;

end;

procedure TfrmTipoGestion.sb_gestion_nuevaClick(Sender: TObject);
begin
  inherited;
  mt_tipogestion.Close;
  mt_tipogestion.Open;
  mt_tipogestion.Append;

  sb_gestion_salvar.Enabled := true;
  sb_gestion_unDo.Enabled:= true;
  sb_gestion_nueva.Enabled:= false;
  sb_gestion_Editar.Enabled := false;

  grp_gestion.Enabled := True;
  Descripcion.SetFocus;
end;

procedure TfrmTipoGestion.sb_gestion_salvarClick(Sender: TObject);
var
  i : integer;
  MyClass: TComponent;
  _continuar : Boolean;
  _guid      : String;
begin
  inherited;
  sb_gestion_Editar.Enabled := true;
  sb_gestion_nueva.Enabled:= true;
  sb_gestion_salvar.Enabled := false;
  sb_gestion_unDo.Enabled:= false;

  _Continuar := true;

  //--- Validacion de rol


  //----

  if not dm1.sib.InTransaction then
    dm1.sib.StartTransaction ;

  //---

  if mt_tipogestion.State = dsInsert then
  begin
    _guid := dm1._guid ;
    mt_tipogestion.Post;
    ActualizarGestion.Close;
    ActualizarGestion.Open;
    ActualizarGestion.Append;
  end
  Else
    if mt_tipoGestion.State = dsEdit then //---Modo de edicion
    Begin

      mt_tipogestion.Post;

      ActualizarGestion.Close;
      ActualizarGestion.Params [0].AsInteger := mt_tipogestionid_tipo.AsInteger ;
      ActualizarGestion.Open();
      ActualizarGestion.First;

      if ActualizarGestion.eof then
      Begin
        ActualizarGestion.close;
        _continuar := False;
      End
      Else
      Begin
        if ActualizarGestionguid.AsString = '' then
          _guid := dm1._guid
        else
          _guid :=  ActualizarGestionguid.AsString ;

        ActualizarGestion.edit;
      End;
    End
    Else
      _Continuar := False;

 if _Continuar then
 Begin
   try

     For I := 1 to mt_tipogestion.FieldCount -1 do
     Begin
       ActualizarGestion.Fields[i].Value := mt_tipogestion.Fields[i].Value ;
     End;

     ActualizarGestionguid.AsString := _guid ;

     ActualizarGestion.Post;
     dm1.sib.Commit;
     CargarGestiones;
     dm1.tipoGestiones.Locate('guid',_guid);
     cargarGestion;

   Except
     on e:exception do
     Begin
       ShowMessage('Error al insertar tipo de Gestion...'+e.Message );
       dm1.sib.Rollback ;
     End;
   end;
 End;

end;

procedure TfrmTipoGestion.sb_gestion_unDoClick(Sender: TObject);
begin
  inherited;
  cargargestion ;

  sb_gestion_Editar.Enabled := true;
  sb_gestion_nueva.Enabled:= true;
  sb_gestion_salvar.Enabled := false;
  sb_gestion_unDo.Enabled:= false;


end;

end.
