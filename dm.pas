unit dm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.ODBC, FireDAC.Phys.ODBCDef, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.Phys.ODBCBase, System.ImageList, Vcl.ImgList,
  Vcl.Controls, Vcl.Menus;


type
  Tdm1 = class(TDataModule)
    AseguradoPolizas: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    sib: TFDConnection;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    usuario: TFDQuery;
    ciaUsuario: TFDQuery;
    _usuario: TFDMemTable;
    usuarioid_centro: TIntegerField;
    usuarioxuser: TWideStringField;
    usuarioid_user: TIntegerField;
    usuarionombre: TWideStringField;
    usuarioapellido: TWideStringField;
    usuariocedula: TWideStringField;
    usuarioTipo: TWideStringField;
    usuarionacimiento: TSQLTimeStampField;
    usuariotelefono: TWideStringField;
    usuariofax: TWideStringField;
    usuarioemail: TWideStringField;
    usuariocelular: TWideStringField;
    usuarioDireccion: TWideMemoField;
    usuarioDireccionCobro: TWideMemoField;
    usuarioadmin: TWideStringField;
    usuarionivel: TIntegerField;
    usuariovista: TIntegerField;
    usuariopassw: TWideStringField;
    usuariorol: TWideStringField;
    usuarioactivo: TSmallintField;
    usuariofoto: TWideStringField;
    usuariosexo: TWideStringField;
    usuarioesCliente: TBooleanField;
    usuarioesAcreedor: TBooleanField;
    usuarioesBanco: TBooleanField;
    usuarioesEmpleado: TBooleanField;
    usuarioesGerente: TBooleanField;
    usuarioesProveedor: TBooleanField;
    _usuarioid_centro: TIntegerField;
    _usuarioxuser: TWideStringField;
    _usuarioid_user: TIntegerField;
    _usuarionombre: TWideStringField;
    _usuarioapellido: TWideStringField;
    _usuariocedula: TWideStringField;
    _usuarioTipo: TWideStringField;
    _usuarionacimiento: TSQLTimeStampField;
    _usuariotelefono: TWideStringField;
    _usuariofax: TWideStringField;
    _usuarioemail: TWideStringField;
    _usuariocelular: TWideStringField;
    _usuarioDireccion: TWideMemoField;
    _usuarioDireccionCobro: TWideMemoField;
    _usuarioadmin: TWideStringField;
    _usuarionivel: TIntegerField;
    _usuariovista: TIntegerField;
    _usuariopassw: TWideStringField;
    _usuariorol: TWideStringField;
    _usuarioactivo: TSmallintField;
    _usuariofoto: TWideStringField;
    _usuariosexo: TWideStringField;
    _usuarioesCliente: TBooleanField;
    _usuarioesAcreedor: TBooleanField;
    _usuarioesBanco: TBooleanField;
    _usuarioesEmpleado: TBooleanField;
    _usuarioesGerente: TBooleanField;
    _usuarioesProveedor: TBooleanField;
    ciaUsuarioxuser: TWideStringField;
    ciaUsuarioid: TFDAutoIncField;
    ciaUsuarionombre: TWideStringField;
    cumpleanos: TFDQuery;
    cumpleanosnombre: TWideStringField;
    cumpleanosapellido: TWideStringField;
    cumpleanostelefono: TWideStringField;
    cumpleanoscelular: TWideStringField;
    cumpleanosfecha_nacimiento: TSQLTimeStampField;
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList3: TImageList;
    ArchivoLog: TFDQuery;
    fechadelSistema: TFDQuery;
    fechadelSistemaFechaSistema: TSQLTimeStampField;
    AseguradoPolizasdescripcion: TWideStringField;
    AseguradoPolizaspoliza: TWideStringField;
    AseguradoPolizasnombre: TWideStringField;
    AseguradoPolizasapellido: TWideStringField;
    AseguradoPolizasramo_subramo: TIntegerField;
    AseguradoPolizaspromotor: TWideStringField;
    AseguradoPolizasPromotorNombre: TWideStringField;
    AseguradoPolizasaseguradora: TWideStringField;
    AseguradoPolizasHasta: TStringField;
    AseguradoPolizasactiva: TIntegerField;
    Poliza: TFDQuery;
    Polizaramo_subramo: TIntegerField;
    Polizapoliza: TWideStringField;
    Polizavigencia: TIntegerField;
    Polizaanio: TIntegerField;
    Polizaaseguradora: TIntegerField;
    Polizaasegurado: TIntegerField;
    Polizanombre: TWideStringField;
    Polizaapellido: TWideStringField;
    Polizainicio: TSQLTimeStampField;
    Polizafin: TSQLTimeStampField;
    Polizaprima_bruta: TFloatField;
    Polizaimpuestos: TFloatField;
    Polizaprima_Neta: TFloatField;
    PolizaDirCobro: TWideMemoField;
    Polizaestatus: TWideStringField;
    Polizaactiva: TIntegerField;
    PolizaFormapago: TWideStringField;
    Polizanopagos: TIntegerField;
    PolizafechaPago: TSQLTimeStampField;
    Polizacomdescontada: TSmallintField;
    Polizacomision: TFloatField;
    PolizaSuma: TFloatField;
    Polizapromotor: TWideStringField;
    Polizasuscripcion: TSQLTimeStampField;
    Polizarenueva: TWideStringField;
    Polizarenovadacon: TWideStringField;
    Polizaprimacomisionable: TFloatField;
    Polizatipopro: TWideStringField;
    Polizaguid: TStringField;
    Polizaid_cia: TIntegerField;
    AseguradoPolizasguid: TStringField;
    AseguradoPolizasvigencia: TIntegerField;
    AseguradoPolizasrenueva: TWideStringField;
    AseguradoPolizastipopro: TWideStringField;
    asegurados: TFDQuery;
    aseguradosasegurado: TIntegerField;
    aseguradosnombre: TWideStringField;
    aseguradosapellido: TWideStringField;
    aseguradosdocumento: TWideStringField;
    aseguradosfecha_nacimiento: TSQLTimeStampField;
    aseguradossexo: TWideStringField;
    aseguradostelefono: TWideStringField;
    aseguradoscelular: TWideStringField;
    aseguradosemail: TWideStringField;
    aseguradosdireccion: TWideMemoField;
    aseguradosnacionalidad: TWideStringField;
    aseguradosextrangero: TWideStringField;
    aseguradosocupacion: TWideStringField;
    aseguradostelefonoficina: TWideStringField;
    aseguradosfax: TWideStringField;
    aseguradosdireccionoficina: TWideMemoField;
    aseguradostiposangre: TWideStringField;
    aseguradosreferido: TWideStringField;
    aseguradostipo: TWideStringField;
    aseguradoscontacto_nombre: TWideStringField;
    aseguradoscontacto_telefono: TWideStringField;
    aseguradoscontacto_email: TWideStringField;
    aseguradospadre: TIntegerField;
    aseguradostratamiento: TWideStringField;
    aseguradosesgrupo: TIntegerField;
    aseguradosgrupoe: TIntegerField;
    aseguradosguid: TStringField;
    aseguradosnombreCompleto: TWideStringField;
    ramos: TFDQuery;
    ramosramo_subramo: TIntegerField;
    ramosramo: TIntegerField;
    ramosdescripcion: TWideStringField;
    ramoscomision: TFloatField;
    ramoses_subramo: TIntegerField;
    ramossiglas: TWideStringField;
    ramosimpuesto: TFloatField;
    ramosvisible: TSmallintField;
    ramosBeneficiarios: TIntegerField;
    ramosSSMA_TimeStamp: TBytesField;
    Aseguradoras: TFDQuery;
    aseguradosid_ocupacion: TIntegerField;
    aseguradosid_profecion: TIntegerField;
    aseguradosid_lugarTrabajo: TIntegerField;
    FrecuenciaPagos: TFDQuery;
    AseguradoPolizassiglas: TWideStringField;
    insertarPoliza: TFDQuery;
    insertarPolizaramo_subramo: TIntegerField;
    insertarPolizapoliza: TWideStringField;
    insertarPolizavigencia: TIntegerField;
    insertarPolizaanio: TIntegerField;
    insertarPolizaaseguradora: TIntegerField;
    insertarPolizaasegurado: TIntegerField;
    insertarPolizanombre: TWideStringField;
    insertarPolizaapellido: TWideStringField;
    insertarPolizainicio: TSQLTimeStampField;
    insertarPolizafin: TSQLTimeStampField;
    insertarPolizaprima_bruta: TFloatField;
    insertarPolizaimpuestos: TFloatField;
    insertarPolizaprima_Neta: TFloatField;
    insertarPolizaDirCobro: TWideMemoField;
    insertarPolizaestatus: TWideStringField;
    insertarPolizaactiva: TIntegerField;
    insertarPolizaFormapago: TWideStringField;
    insertarPolizanopagos: TIntegerField;
    insertarPolizafechaPago: TSQLTimeStampField;
    insertarPolizacomdescontada: TSmallintField;
    insertarPolizacomision: TFloatField;
    insertarPolizaSuma: TFloatField;
    insertarPolizapromotor: TWideStringField;
    insertarPolizasuscripcion: TSQLTimeStampField;
    insertarPolizarenueva: TWideStringField;
    insertarPolizarenovadacon: TWideStringField;
    insertarPolizaprimacomisionable: TFloatField;
    insertarPolizatipopro: TWideStringField;
    insertarPolizaguid: TStringField;
    insertarPolizaid_cia: TIntegerField;
    fdq_PolizaVigencia: TFDQuery;
    fdq_PolizaVigenciavigencia: TIntegerField;
    ActualizarPoliza: TFDQuery;
    promotor: TFDQuery;
    promotorid_centro: TIntegerField;
    promotorxuser: TWideStringField;
    promotornombre: TWideStringField;
    promotorapellido: TWideStringField;
    promotorcedula: TWideStringField;
    promotorTipo: TWideStringField;
    promotornacimiento: TSQLTimeStampField;
    promotortelefono: TWideStringField;
    promotorfax: TWideStringField;
    promotoremail: TWideStringField;
    promotorcelular: TWideStringField;
    promotornombreCompleto: TWideStringField;
    GestionEstado: TFDQuery;
    dts_GestionEstado: TDataSource;
    GestionEstadoid: TFDAutoIncField;
    GestionEstadocodigo: TStringField;
    GestionEstadoDescripcion: TStringField;
    tipoGestion: TFDQuery;
    tipoGestionid_tipo: TFDAutoIncField;
    tipoGestiondescripcion: TStringField;
    tipoGestionarea: TIntegerField;
    tipoGestionareaNombre: TStringField;
    dts_tipoGestion: TDataSource;
    asignados: TFDQuery;
    asignadosid_centro: TIntegerField;
    asignadosxuser: TWideStringField;
    asignadosid_user: TIntegerField;
    asignadosnombre: TWideStringField;
    asignadosapellido: TWideStringField;
    asignadoscedula: TWideStringField;
    asignadosTipo: TWideStringField;
    asignadosnacimiento: TSQLTimeStampField;
    asignadostelefono: TWideStringField;
    asignadosfax: TWideStringField;
    asignadosemail: TWideStringField;
    asignadoscelular: TWideStringField;
    asignadosDireccion: TWideMemoField;
    asignadosDireccionCobro: TWideMemoField;
    asignadosadmin: TWideStringField;
    asignadosnivel: TIntegerField;
    asignadosvista: TIntegerField;
    asignadospassw: TWideStringField;
    asignadosrol: TWideStringField;
    asignadosactivo: TSmallintField;
    asignadosfoto: TWideStringField;
    asignadossexo: TWideStringField;
    asignadosesCliente: TBooleanField;
    asignadosesAcreedor: TBooleanField;
    asignadosesBanco: TBooleanField;
    asignadosesEmpleado: TBooleanField;
    asignadosesGerente: TBooleanField;
    asignadosesProveedor: TBooleanField;
    asignadosnombreCompleto: TWideStringField;
    dts_Asignados: TDataSource;
    insertarGestion: TFDQuery;
    insertarGestionfecha: TSQLTimeStampField;
    insertarGestionusuario: TStringField;
    insertarGestionasignado: TStringField;
    insertarGestionestado: TIntegerField;
    insertarGestionfechaInicio: TSQLTimeStampField;
    insertarGestionfechaCierre: TSQLTimeStampField;
    insertarGestionpoliza: TStringField;
    insertarGestionramo_Subramo: TIntegerField;
    insertarGestionvigencia: TIntegerField;
    insertarGestionid_cia: TIntegerField;
    insertarGestionaseguradora: TIntegerField;
    insertarGestionasegurado: TIntegerField;
    insertarGestionnota: TMemoField;
    insertarGestioncorreos: TStringField;
    insertarGestionusuario_anterior: TStringField;
    insertarGestionusuario_reasignado: TStringField;
    insertarGestiontipo_gestion: TIntegerField;
    insertarGestionfecha_aud: TSQLTimeStampField;
    insertarGestionusuario_aud: TStringField;
    insertarGestiontiempoGestion: TSQLTimeStampField;
    insertarGestionreAsignado: TBooleanField;
    insertarGestionguid: TStringField;
    GestionEstadoreasigna: TBooleanField;
    GestionEstadocierra: TBooleanField;
    GestionEstadoabre: TBooleanField;
    ActualizarGestion: TFDQuery;
    marcas: TFDQuery;
    dts_marcas: TDataSource;
    modelos: TFDQuery;
    modelosid_marca_model: TFDAutoIncField;
    modelosmarca_modelo: TWideStringField;
    modelosid_tipo: TWideStringField;
    modelosid_marca: TIntegerField;
    modelosfabricante: TWideStringField;
    modelosOrigen: TWideStringField;
    modelosTipo: TWideStringField;
    modelosocupantes: TSmallintField;
    modelospuertas: TSmallintField;
    modelosespecificacion: TWideStringField;
    modelosdistribuidor: TWideStringField;
    modelosdireccion: TWideStringField;
    modelostelefono_fax: TWideStringField;
    marcasid_marca_model: TFDAutoIncField;
    marcasmarca_modelo: TWideStringField;
    marcasid_tipo: TWideStringField;
    marcasid_marca: TIntegerField;
    marcasfabricante: TWideStringField;
    marcasOrigen: TWideStringField;
    marcasTipo: TWideStringField;
    marcasocupantes: TSmallintField;
    marcaspuertas: TSmallintField;
    marcasespecificacion: TWideStringField;
    marcasdistribuidor: TWideStringField;
    marcasdireccion: TWideStringField;
    marcastelefono_fax: TWideStringField;
    dts_modelos: TDataSource;
    municipios: TFDQuery;
    municipiosidPais: TStringField;
    municipiosNombre: TStringField;
    municipiosidDistrito: TFDAutoIncField;
    municipiosidProvincia: TIntegerField;
    meses: TFDQuery;
    dts_meses: TDataSource;
    areas: TFDQuery;
    areasid_area: TFDAutoIncField;
    areasdescripcion: TStringField;
    areasactiva: TBooleanField;
    areasguid: TStringField;
    tipoGestiones: TFDQuery;
    tipoGestionesid_tipo: TFDAutoIncField;
    tipoGestionesdescripcion: TStringField;
    tipoGestionesarea: TIntegerField;
    tipoGestionesactiva: TBooleanField;
    tipoGestionesguid: TStringField;
    tipoGestionactiva: TBooleanField;
    tipoGestionguid: TStringField;
    tipoVehiculo: TFDQuery;
    coberturasRamo: TFDQuery;
    limites: TFDQuery;
    limitesramo: TIntegerField;
    limitescober: TIntegerField;
    limitesid: TIntegerField;
    limitesdescripcion: TWideStringField;
    coberturasRamoramo_subramo: TIntegerField;
    coberturasRamocobertura: TIntegerField;
    coberturasRamodescripcion: TWideStringField;
    coberturasRamomonto: TFloatField;
    coberturasRamodeducible: TFloatField;
    coberturasRamolimites: TWideStringField;
    coberturasRamoprima: TFloatField;
    coberturasRamobasica: TWideStringField;
    coberturasRamoramo: TIntegerField;
    coberturasRamoporcentaje: TFloatField;
    coberturasRamoinicio: TSQLTimeStampField;
    coberturasRamofin: TSQLTimeStampField;
    coberturasRamoactiva: TSmallintField;
    coberturasRamoSSMA_TimeStamp: TBytesField;
    coberturaBien: TFDQuery;
    coberturaBienramo_subramo: TIntegerField;
    coberturaBiencobertura: TIntegerField;
    coberturaBiendescripcion: TWideStringField;
    coberturaBienmonto: TFloatField;
    coberturaBiendeducible: TFloatField;
    coberturaBienlimites: TWideStringField;
    coberturaBienprima: TFloatField;
    coberturaBienbasica: TWideStringField;
    coberturaBienramo: TIntegerField;
    coberturaBienporcentaje: TFloatField;
    coberturaBieninicio: TSQLTimeStampField;
    coberturaBienfin: TSQLTimeStampField;
    coberturaBienactiva: TSmallintField;
    coberturaBienSSMA_TimeStamp: TBytesField;
    LimitesBien: TFDQuery;
    LimitesBienid: TIntegerField;
    LimitesBiendescripcion: TWideStringField;
    dts_Limites: TDataSource;
    dts_LimitesBien: TDataSource;
    usoAutos: TFDQuery;
    Acreedores: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    Function FechaSistema(): tDateTime;
    Function RegistroLog(_logusuario : String; _logaccion : string ; _logDetalle : string) : boolean;
    function _guid() : String;
  end;

  type
    _usuario = Record
    id        : String;
    nombre    : string;
    clave     : string;
    cia       : integer;
    ciaNombre : string;
    Ok        : Boolean;
    Rol       : String;
    caso      : String;
  End;

var
  dm1: Tdm1;
  usuario : _usuario;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses login;

{$R *.dfm}

{ Tdata }


{ Tdm1 }

function Tdm1.FechaSistema: tDateTime;
begin
  fechadelSistema.Close;
  fechadelSistema.Open;

  if not fechadelSistema.eof then
    FechaSistema := fechadelSistemaFechaSistema.AsDateTime ;


end;

function Tdm1.RegistroLog(_logusuario, _logaccion,
  _logDetalle: string): boolean;
begin
 result:= True;

 ArchivoLog.Close;
 ArchivoLog.SQL.Clear;
 ArchivoLog.SQL.add('Insert into archivoLog (');
 ArchivoLog.SQL.add(' fecha');
 ArchivoLog.SQL.add(',usuario');
 ArchivoLog.SQL.add(',accion');
 ArchivoLog.SQL.add(',Detalle )');
 //-- Seccion de Valores
 ArchivoLog.SQL.add( ' Values (');
 ArchivoLog.SQL.add(QuotedStr(formatdatetime('yyyy-mm-dd hh:nn:ss',FechaSistema())));
 ArchivoLog.SQL.add(',' + quotedStr(_logusuario));
 ArchivoLog.SQL.add(',' + QuotedStr(_logaccion));
 ArchivoLog.SQL.add(',' + QuotedStr(_logDetalle));
 ArchivoLog.SQL.add(' )');

 try
   ArchivoLog.ExecSQL;
 except
  on E : Exception do
  begin
  //  ShowMessage(E.ClassName+' Error al actulizar log : '+E.Message);
    result := false;
  end;

 end;
end;

function Tdm1._guid: String;
var
 MyGuid1 : TGUID;
 _guid         : string;
begin
  CreateGUID(MyGUID1);
  GUIDToString(MyGuid1);
  _guid := GUIDToString(MyGuid1);
  result := _guid;

end;

end.
