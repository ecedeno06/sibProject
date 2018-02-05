unit Poliza;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Ventana3, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,clipbrd,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.Mask, DateUtils,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TfrmPoliza = class(TfrmVentana)
    ProgressBar1: TProgressBar;
    Panel1: TPanel;
    Splitter1: TSplitter;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    dbgPolizas: TDBGrid;
    Panel2: TPanel;
    dts_aseguradoPolizas: TDataSource;
    pc_poliza: TPageControl;
    ts_pol_Generales: TTabSheet;
    ts_pol_Detalle: TTabSheet;
    mpoliza: TFDMemTable;
    dtsmPoliza: TDataSource;
    mpolizaramo_subramo: TIntegerField;
    mpolizapoliza: TWideStringField;
    mpolizavigencia: TIntegerField;
    mpolizaanio: TIntegerField;
    mpolizaaseguradora: TIntegerField;
    mpolizaasegurado: TIntegerField;
    mpolizanombre: TWideStringField;
    mpolizaapellido: TWideStringField;
    mpolizainicio: TSQLTimeStampField;
    mpolizafin: TSQLTimeStampField;
    mpolizaprima_bruta: TFloatField;
    mpolizaimpuestos: TFloatField;
    mpolizaprima_Neta: TFloatField;
    mpolizaDirCobro: TWideMemoField;
    mpolizaestatus: TWideStringField;
    mpolizaactiva: TIntegerField;
    mpolizaFormapago: TWideStringField;
    mpolizanopagos: TIntegerField;
    mpolizafechaPago: TSQLTimeStampField;
    mpolizacomdescontada: TSmallintField;
    mpolizacomision: TFloatField;
    mpolizaSuma: TFloatField;
    mpolizapromotor: TWideStringField;
    mpolizasuscripcion: TSQLTimeStampField;
    mpolizarenueva: TWideStringField;
    mpolizarenovadacon: TWideStringField;
    mpolizaprimacomisionable: TFloatField;
    mpolizatipopro: TWideStringField;
    mpolizaguid: TStringField;
    mpolizaid_cia: TIntegerField;
    dts_Asegurados: TDataSource;
    dts_Ramos: TDataSource;
    dts_aseguradoras: TDataSource;
    PageControl1: TPageControl;
    Panel4: TPanel;
    Image1: TImage;
    btn_pol_new: TSpeedButton;
    btn_pol_salvar: TSpeedButton;
    btn_pol_Edit: TSpeedButton;
    btn_pol_UnDo: TSpeedButton;
    ScrollBox1: TScrollBox;
    grp_pol_Generales: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dbl_ramo: TDBLookupComboBox;
    dbl_Asegurado: TDBLookupComboBox;
    ed_Documento: TEdit;
    dbl_aseguradora: TDBLookupComboBox;
    dp_Desde: TDateTimePicker;
    dp_Hasta: TDateTimePicker;
    ed_direccion: TMemo;
    ed_poliza: TDBEdit;
    GroupBox2: TGroupBox;
    ed_telefonofijo: TEdit;
    ed_telefonoOficina: TEdit;
    ed_Celular: TEdit;
    ed_Correo: TEdit;
    Label6: TLabel;
    Label9: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBCheckBox1: TDBCheckBox;
    ed_nacionalidad: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    ed_ocupacion: TEdit;
    dp_fechanacimiento: TDateTimePicker;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit1: TDBEdit;
    Label15: TLabel;
    DBEdit2: TDBEdit;
    Label16: TLabel;
    DBEdit3: TDBEdit;
    dts_frecuenciapago: TDataSource;
    Label17: TLabel;
    dbl_frecuenciapagos: TDBLookupComboBox;
    Label18: TLabel;
    DBEdit4: TDBEdit;
    Label19: TLabel;
    mpolizaCuotas: TFloatField;
    DBEdit5: TDBEdit;
    Image3: TImage;
    lbFiltro: TLabel;
    edFiltro: TButtonedEdit;
    rbActivas: TRadioButton;
    rbInactivas: TRadioButton;
    rbAmbas: TRadioButton;
    ts_pol_adjuntos: TTabSheet;
    Panel12: TPanel;
    Image8: TImage;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    Label24: TLabel;
    ButtonedEdit5: TButtonedEdit;
    pc_Bien: TPageControl;
    ts_Auto: TTabSheet;
    ts_incendio: TTabSheet;
    ts_robo: TTabSheet;
    ts_vida: TTabSheet;
    TabSheet5: TTabSheet;
    Panel11: TPanel;
    Image7: TImage;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    Label23: TLabel;
    ButtonedEdit4: TButtonedEdit;
    pnl_bien: TPanel;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Panel6: TPanel;
    Panel7: TPanel;
    Splitter4: TSplitter;
    pc_auto: TPageControl;
    ts_Auto_DatosGenerales: TTabSheet;
    Panel5: TPanel;
    grp_item_auto: TGroupBox;
    ts_Auto_Reclamo: TTabSheet;
    DBLookupComboBox1: TDBLookupComboBox;
    Label26: TLabel;
    dts_Promotores: TDataSource;
    ts_Gestiones: TTabSheet;
    Panel15: TPanel;
    Splitter5: TSplitter;
    Panel16: TPanel;
    GroupBox5: TGroupBox;
    dp_gestion_desde: TDateTimePicker;
    dp_gestion_Hasta: TDateTimePicker;
    Label27: TLabel;
    Label28: TLabel;
    dbg_Gestiones: TDBGrid;
    mGestion: TFDMemTable;
    dts_Gestiones: TDataSource;
    grp_Gestion_Det: TGroupBox;
    dts_mGestion: TDataSource;
    mGestionidGestion: TIntegerField;
    mGestionfecha: TSQLTimeStampField;
    mGestionusuario: TStringField;
    mGestionasignado: TStringField;
    mGestionestado: TIntegerField;
    mGestionfechaInicio: TSQLTimeStampField;
    mGestionfechaCierre: TSQLTimeStampField;
    mGestionpoliza: TStringField;
    mGestionramo_Subramo: TIntegerField;
    mGestionvigencia: TIntegerField;
    mGestionid_cia: TIntegerField;
    mGestionaseguradora: TIntegerField;
    mGestionasegurado: TIntegerField;
    mGestionnota: TMemoField;
    mGestioncorreos: TStringField;
    mGestionusuario_anterior: TStringField;
    mGestionusuario_reasignado: TStringField;
    mGestiontipo_gestion: TIntegerField;
    mGestionfecha_aud: TSQLTimeStampField;
    mGestionusuario_aud: TStringField;
    mGestiontiempoGestion: TSQLTimeStampField;
    mGestionEstadoGestion: TStringField;
    DBEdit7: TDBEdit;
    Label30: TLabel;
    Label31: TLabel;
    Splitter6: TSplitter;
    dbl_tipoGestion: TDBLookupComboBox;
    mGestionreAsignado: TBooleanField;
    grp_asignar: TGroupBox;
    Label29: TLabel;
    Label32: TLabel;
    dp_Seguimiento: TDateTimePicker;
    dbl_asignado: TDBLookupComboBox;
    Panel17: TPanel;
    Image2: TImage;
    sb_gestion_nueva: TSpeedButton;
    sb_gestion_salvar: TSpeedButton;
    sb_gestion_unDo: TSpeedButton;
    mGestionguid: TStringField;
    Nota: TDBMemo;
    Label33: TLabel;
    dbl_EstadoGestion: TDBLookupComboBox;
    notatmp: TMemo;
    sb_gestion_Editar: TSpeedButton;
    caso: TFDQuery;
    casoramo_subramo: TIntegerField;
    casoPoliza: TWideStringField;
    casoVigencia: TIntegerField;
    AseguradoPolizas: TFDQuery;
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
    AseguradoPolizasguid: TStringField;
    AseguradoPolizasvigencia: TIntegerField;
    AseguradoPolizasrenueva: TWideStringField;
    AseguradoPolizastipopro: TWideStringField;
    AseguradoPolizassiglas: TWideStringField;
    Gestiones: TFDQuery;
    Gestionesfecha: TSQLTimeStampField;
    Gestionesusuario: TStringField;
    Gestionesasignado: TStringField;
    Gestionesestado: TIntegerField;
    GestionesfechaInicio: TSQLTimeStampField;
    GestionesfechaCierre: TSQLTimeStampField;
    Gestionespoliza: TStringField;
    Gestionesramo_Subramo: TIntegerField;
    Gestionesvigencia: TIntegerField;
    Gestionesid_cia: TIntegerField;
    Gestionesaseguradora: TIntegerField;
    Gestionesasegurado: TIntegerField;
    Gestionesnota: TMemoField;
    Gestionescorreos: TStringField;
    Gestionesusuario_anterior: TStringField;
    Gestionesusuario_reasignado: TStringField;
    Gestionestipo_gestion: TIntegerField;
    Gestionesfecha_aud: TSQLTimeStampField;
    Gestionesusuario_aud: TStringField;
    GestionestiempoGestion: TSQLTimeStampField;
    GestionesreAsignado: TBooleanField;
    Gestionesguid: TStringField;
    GestionesEstadoGestion: TStringField;
    GestionesidGestion: TIntegerField;
    pc_Incendio: TPageControl;
    ts_Incendio_DatosGenerales: TTabSheet;
    ts_Incendio_Reclamo: TTabSheet;
    grp_item_Incencio: TGroupBox;
    pc_robo: TPageControl;
    ts_generales_robo: TTabSheet;
    ts_Reclamos_robo: TTabSheet;
    Panel10: TPanel;
    Splitter7: TSplitter;
    pc_vida: TPageControl;
    TabSheet8: TTabSheet;
    ts_Coberturas_vida: TTabSheet;
    Items: TFDQuery;
    Itemsramo: TIntegerField;
    Itemspoliza: TWideStringField;
    Itemsvigencia: TIntegerField;
    Itemssec: TIntegerField;
    Itemsmarca: TWideStringField;
    Itemsmodelo: TWideStringField;
    Itemsanio: TIntegerField;
    Itemschasis: TWideStringField;
    Itemsmotor: TWideStringField;
    Itemstipo: TWideStringField;
    Itemscolor: TWideStringField;
    Itemsplaca: TWideStringField;
    ItemsConductor: TWideStringField;
    ItemsUbicacion: TWideMemoField;
    Itemsconstruccion: TWideStringField;
    Itemspisos: TIntegerField;
    Itemsarea: TWideStringField;
    Itemsfumador: TWideStringField;
    Itemsnacimiento: TSQLTimeStampField;
    Itemsrelacion: TWideStringField;
    Itemssuma: TFloatField;
    ItemsObs: TWideMemoField;
    Itemsasegurado: TWideStringField;
    Itemspbruta: TFloatField;
    Itemsimpuesto: TFloatField;
    Itemspneta: TFloatField;
    Itemsexonerado: TWideStringField;
    Itemsdescuento: TFloatField;
    Itemsporcentaje: TFloatField;
    Itemsuso: TWideStringField;
    Itemsimp: TFloatField;
    Itemsimpto: TFloatField;
    Itemsacreedor: TIntegerField;
    ItemsfehaInclusion: TSQLTimeStampField;
    ItemsfechaExclusion: TSQLTimeStampField;
    Itemsactivo: TIntegerField;
    Itemscontratante: TWideStringField;
    Itemsbeneficiario: TWideStringField;
    Itemsfiador: TWideStringField;
    Itemsprimacomision: TFloatField;
    dbg_autos: TDBGrid;
    dts_Items: TDataSource;
    Itemsguid: TStringField;
    dts_mBien: TDataSource;
    db_Ano: TDBEdit;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    db_Motor: TDBEdit;
    db_Chasis: TDBEdit;
    mBien: TFDMemTable;
    dbl_marca: TDBLookupComboBox;
    dbl_modelo: TDBLookupComboBox;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    db_Color: TDBEdit;
    db_Placa: TDBEdit;
    Label43: TLabel;
    Label44: TLabel;
    Itemsfecha_placa: TSQLTimeStampField;
    Label45: TLabel;
    Itemsid_municipio: TIntegerField;
    dbl_municipio: TDBLookupComboBox;
    dts_municipios: TDataSource;
    ItemsmesPlaca: TIntegerField;
    dbl_mesPlaca: TDBLookupComboBox;
    ActualizarBien: TFDQuery;
    dbg_incendio: TDBGrid;
    dbl_TipoVehiculo: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    mBienramo: TIntegerField;
    mBienpoliza: TWideStringField;
    mBienvigencia: TIntegerField;
    mBiensec: TIntegerField;
    mBienmarca: TWideStringField;
    mBienmodelo: TWideStringField;
    mBienanio: TIntegerField;
    mBienchasis: TWideStringField;
    mBienmotor: TWideStringField;
    mBientipo: TWideStringField;
    mBiencolor: TWideStringField;
    mBienplaca: TWideStringField;
    mBienConductor: TWideStringField;
    mBienUbicacion: TWideMemoField;
    mBienconstruccion: TWideStringField;
    mBienpisos: TIntegerField;
    mBienarea: TWideStringField;
    mBienfumador: TWideStringField;
    mBiennacimiento: TSQLTimeStampField;
    mBienrelacion: TWideStringField;
    mBiensuma: TFloatField;
    mBienObs: TWideMemoField;
    mBienasegurado: TWideStringField;
    mBienpbruta: TFloatField;
    mBienimpuesto: TFloatField;
    mBienpneta: TFloatField;
    mBienexonerado: TWideStringField;
    mBiendescuento: TFloatField;
    mBienporcentaje: TFloatField;
    mBienuso: TWideStringField;
    mBienimp: TFloatField;
    mBienimpto: TFloatField;
    mBienacreedor: TIntegerField;
    mBienfehaInclusion: TSQLTimeStampField;
    mBienfechaExclusion: TSQLTimeStampField;
    mBienactivo: TIntegerField;
    mBiencontratante: TWideStringField;
    mBienbeneficiario: TWideStringField;
    mBienfiador: TWideStringField;
    mBienprimacomision: TFloatField;
    mBienguid: TStringField;
    mBienfecha_placa: TSQLTimeStampField;
    mBienid_municipio: TIntegerField;
    mBienmesPlaca: TIntegerField;
    ts_Incendio_Coberturas: TTabSheet;
    ts_Auto_Coberturas: TTabSheet;
    ts_Auto_Adjuntos: TTabSheet;
    dts_TipoVehiculo: TDataSource;
    coberturas: TFDQuery;
    coberturasramo_subramo: TIntegerField;
    coberturaspoliza: TWideStringField;
    coberturasvigencia: TIntegerField;
    coberturasbien: TIntegerField;
    coberturascobertura: TIntegerField;
    coberturaslimites: TWideStringField;
    coberturassuma: TFloatField;
    coberturasdeducible: TFloatField;
    coberturasprima: TFloatField;
    coberturasbasica: TIntegerField;
    coberturasnombre: TWideStringField;
    dts_Coberturas: TDataSource;
    coberturas_Cobertura: TStringField;
    dts_CoberturasRamo: TDataSource;
    coberturas_Limites: TStringField;
    ToolBar1: TToolBar;
    btn_cob_insertar_auto: TToolButton;
    btn_cob_editar_auto: TToolButton;
    btn_cob_salvar_auto: TToolButton;
    btn_cob_undo_auto: TToolButton;
    ToolButton5: TToolButton;
    btn_cob_borrar_auto: TToolButton;
    pnl_Bien_Cobertura: TPanel;
    grp_cob_auto: TGroupBox;
    Label48: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    dbl_cobertura_auto: TDBLookupComboBox;
    dbl_Bien_Limites: TDBLookupComboBox;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Splitter8: TSplitter;
    Panel28: TPanel;
    dbg_Coberturas_Auto: TDBGrid;
    stb_Prima_Auto: TStatusBar;
    ToolBar2: TToolBar;
    btn_adj_insertar_auto: TToolButton;
    btn_adj_editar_auto: TToolButton;
    btn_adj_salvar_auto: TToolButton;
    btn_adj_undo_auto: TToolButton;
    ToolButton11: TToolButton;
    btn_adj_borrar_auto: TToolButton;
    ToolBar3: TToolBar;
    btn_rec_insertar_auto: TToolButton;
    btn_rec_editar_auto: TToolButton;
    btn_rec_salvar_auto: TToolButton;
    btn_rec_undo_auto: TToolButton;
    ToolButton17: TToolButton;
    btn_rec_borrar_auto: TToolButton;
    ToolBar4: TToolBar;
    btn_gen_insertar_auto: TToolButton;
    btn_gen_editar_auto: TToolButton;
    btn_gen_salvar_auto: TToolButton;
    btn_gen_undo_auto: TToolButton;
    ToolButton23: TToolButton;
    btn_gen_borrar_auto: TToolButton;
    ed_filtro_auto: TButtonedEdit;
    lbl_filtro_auto: TLabel;
    ToolButton19: TToolButton;
    ToolBar5: TToolBar;
    btn_cob_insertar_incendio: TToolButton;
    btn_cob_editar_incendio: TToolButton;
    btn_cob_salvar_incendio: TToolButton;
    btn_cob_UnDo_incendio: TToolButton;
    ToolButton6: TToolButton;
    btn_cob_Borrar_incendio: TToolButton;
    Panel13: TPanel;
    grp_cob_incendio: TGroupBox;
    Label25: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    dbl_cobertura_Incendio: TDBLookupComboBox;
    dbl_Limite_Incendio: TDBLookupComboBox;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit22: TDBEdit;
    Splitter9: TSplitter;
    Panel14: TPanel;
    dbg_Coberturas_incendio: TDBGrid;
    stb_Prima_incendio: TStatusBar;
    ItemsbienIncendio: TStringField;
    ToolBar6: TToolBar;
    btn_Gen_insertar_incendio: TToolButton;
    btn_Gen_editar_incendio: TToolButton;
    btn_Gen_Salvar_incendio: TToolButton;
    btn_Gen_UnDo_incendio: TToolButton;
    ToolButton20: TToolButton;
    btn_Gen_Borrar_incendio: TToolButton;
    grp_item_incendio: TGroupBox;
    ToolBar7: TToolBar;
    btn_Recl_insertar_incendio: TToolButton;
    btn_Recl_Editar_incendio: TToolButton;
    btn_Recl_Salvar_incendio: TToolButton;
    btn_Recl_UnDo_incendio: TToolButton;
    ToolButton27: TToolButton;
    btn_Recl_Borrar_incendio: TToolButton;
    ToolBar8: TToolBar;
    btn_gen_insertar_robo: TToolButton;
    btn_gen_editar_robo: TToolButton;
    btn_gen_salvar_robo: TToolButton;
    btn_gen_undo_robo: TToolButton;
    ToolButton21: TToolButton;
    btn_gen_borrar_robo: TToolButton;
    ts_coberturas_robo: TTabSheet;
    ToolBar9: TToolBar;
    btn_cob_insertar_robo: TToolButton;
    btn_cob_editar_robo: TToolButton;
    btn_cob_salvar_robo: TToolButton;
    btn_cob_undo_robo: TToolButton;
    ToolButton29: TToolButton;
    btn_cob_borrar_robo: TToolButton;
    ToolBar10: TToolBar;
    ToolButton31: TToolButton;
    ToolButton32: TToolButton;
    ToolButton33: TToolButton;
    ToolButton34: TToolButton;
    ToolButton35: TToolButton;
    ToolButton36: TToolButton;
    GroupBox4: TGroupBox;
    Panel18: TPanel;
    grp_cob_robo: TGroupBox;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    dbl_cobertura_robo: TDBLookupComboBox;
    dbl_Limite_robo: TDBLookupComboBox;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    Splitter11: TSplitter;
    Panel19: TPanel;
    dbg_Coberturas_robo: TDBGrid;
    stb_Prima_robo: TStatusBar;
    grp_item_robo: TGroupBox;
    ToolBar11: TToolBar;
    btn_gen_insertar_vida: TToolButton;
    btn_gen_editar_vida: TToolButton;
    btn_gen_salvar_vida: TToolButton;
    btn_gen_undo_vida: TToolButton;
    ToolButton41: TToolButton;
    btn_gen_borrar_vida: TToolButton;
    ToolBar12: TToolBar;
    btn_cob_insertar_vida: TToolButton;
    btn_cob_editar_vida: TToolButton;
    btn_cob_salvar_vida: TToolButton;
    btn_cob_undo_vida: TToolButton;
    ToolButton47: TToolButton;
    btn_cob_borrar_vida: TToolButton;
    grp_item_vida: TGroupBox;
    ts_reclamos_vida: TTabSheet;
    ToolBar13: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton22: TToolButton;
    ToolButton24: TToolButton;
    GroupBox9: TGroupBox;
    Panel8: TPanel;
    grp_cob_vida: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    dbl_cobertura_vida: TDBLookupComboBox;
    dbl_Limite_vida: TDBLookupComboBox;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    Splitter10: TSplitter;
    Panel9: TPanel;
    dbg_coberturas_vida: TDBGrid;
    stb_Prima_vida: TStatusBar;
    Label36: TLabel;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    dbl_usoAutos: TDBLookupComboBox;
    dbl_acreedores: TDBLookupComboBox;
    Label61: TLabel;
    Label62: TLabel;
    dts_usoAutos: TDataSource;
    dts_Acreedores: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure dbgPolizasCellClick(Column: TColumn);
    procedure edFiltroLeftButtonClick(Sender: TObject);
    procedure edFiltroRightButtonClick(Sender: TObject);
    procedure rbActivasClick(Sender: TObject);
    procedure rbInactivasClick(Sender: TObject);
    procedure rbAmbasClick(Sender: TObject);
    procedure btn_pol_newClick(Sender: TObject);
    procedure btn_pol_salvarClick(Sender: TObject);
    procedure btn_pol_EditClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    Procedure CargarGenerales;
    procedure dts_aseguradoPolizasDataChange(Sender: TObject; Field: TField);
    procedure dp_DesdeChange(Sender: TObject);
    procedure dp_HastaChange(Sender: TObject);
    procedure ts_pol_GeneralesExit(Sender: TObject);
    procedure btn_pol_UnDoClick(Sender: TObject);
    procedure ed_filtro_autoLeftButtonClick(Sender: TObject);
    procedure ed_filtro_autoRightButtonClick(Sender: TObject);
    procedure dtsmPolizaDataChange(Sender: TObject; Field: TField);
    procedure dbl_frecuenciapagosClick(Sender: TObject);
    procedure mpolizaCalcFields(DataSet: TDataSet);
    procedure DBEdit5Change(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure pnl_bienDblClick(Sender: TObject);
    procedure ed_polizaExit(Sender: TObject);
    Procedure BuscarPolizas ;
    Procedure RecuperaGestiones;
    Procedure CargarGestion;
    procedure sb_gestion_nuevaClick(Sender: TObject);
    procedure pc_polizaChange(Sender: TObject);
    procedure sb_gestion_salvarClick(Sender: TObject);
    Procedure CargarGestiones;
    procedure dts_GestionesDataChange(Sender: TObject; Field: TField);
    procedure NotaExit(Sender: TObject);
    procedure sb_gestion_EditarClick(Sender: TObject);
    procedure dbl_EstadoGestionClick(Sender: TObject);
    procedure dts_mGestionDataChange(Sender: TObject; Field: TField);
    //---
    Function CargarItems(): Boolean;
    Function CargarBien() : Boolean;
    procedure dts_mBienDataChange(Sender: TObject; Field: TField);
    procedure dts_ItemsDataChange(Sender: TObject; Field: TField);
    procedure dbg_autosCellClick(Column: TColumn);
    procedure dbl_marcaClick(Sender: TObject);
    Procedure CargarModelos;
    procedure sb_item_newClick(Sender: TObject);
    procedure sb_item_salvarClick(Sender: TObject);
    procedure sb_item_UnDoClick(Sender: TObject);

    //----
    Function Componentes(grp : TGroupBox ; valor : Boolean ) : Boolean;
    procedure dbl_marcaEnter(Sender: TObject);
    procedure dbl_modeloEnter(Sender: TObject);
    procedure db_AnoEnter(Sender: TObject);
    procedure db_MotorEnter(Sender: TObject);
    procedure db_ChasisEnter(Sender: TObject);
    procedure db_PlacaEnter(Sender: TObject);
    procedure dbl_TipoVehiculoEnter(Sender: TObject);
    procedure dbl_municipioEnter(Sender: TObject);
    procedure ItemsCalcFields(DataSet: TDataSet);

    //--- Procedumientos de usuario
    Procedure CargarCoberturas;
    Procedure FiltrarLimites;
    procedure coberturasCalcFields(DataSet: TDataSet);
    procedure dts_CoberturasDataChange(Sender: TObject; Field: TField);
    Procedure TotalCoberturas;
    procedure btn_gen_insertar_autoClick(Sender: TObject);
    procedure btn_gen_undo_autoClick(Sender: TObject);
    procedure btn_gen_editar_autoClick(Sender: TObject);
    procedure btn_gen_salvar_autoClick(Sender: TObject);
    procedure btn_cob_insertar_autoClick(Sender: TObject);
    procedure btn_cob_editar_autoClick(Sender: TObject);
    procedure btn_cob_undo_autoClick(Sender: TObject);
    procedure btn_cob_salvar_autoClick(Sender: TObject);
    procedure DBEdit9Change(Sender: TObject);
    procedure btn_cob_insertar_incendioClick(Sender: TObject);
    procedure btn_cob_editar_incendioClick(Sender: TObject);
    procedure btn_cob_salvar_incendioClick(Sender: TObject);
    procedure btn_cob_UnDo_incendioClick(Sender: TObject);

    //---

    Function Botones_Cobertura(nuevo,editar,salvar,Undo,Borrar : Boolean ; sigla : string;  habil : Boolean) : Boolean;
    Function Botones(prefijo : String ; n,e,s,u,b : Boolean ;
                     sigla : string;  habil : Boolean ;
                     grp : String) : Boolean;
    procedure btn_Gen_insertar_incendioClick(Sender: TObject);
    procedure btn_Gen_editar_incendioClick(Sender: TObject);
    procedure btn_Gen_Salvar_incendioClick(Sender: TObject);
    procedure btn_Gen_UnDo_incendioClick(Sender: TObject);
    procedure btn_Gen_Borrar_incendioClick(Sender: TObject);
//    procedure DBEdit9Exit(Sender: TObject);
    Procedure InsertarCobertura;
    Procedure EditarCobertura;
    procedure btn_cob_insertar_vidaClick(Sender: TObject);
    procedure btn_cob_editar_vidaClick(Sender: TObject);
    procedure btn_cob_salvar_vidaClick(Sender: TObject);
    procedure btn_cob_undo_vidaClick(Sender: TObject);
    procedure btn_cob_editar_roboClick(Sender: TObject);
    procedure dbl_usoAutosEnter(Sender: TObject);
    procedure dbl_acreedoresEnter(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }


  end;

  Type
    _pol = Record
      ramo        : integer;
      poliza      : String;
      vigencia    : integer;
      bien        : integer;
      asegurado   : Integer;
      cia         : integer;
      aseguradora : integer;
      siglas      : String;
    End;


var
  frmPoliza: TfrmPoliza;
  _campo,filtro2 : String;
  _TS   : TTabSheet;
  estadoGestion : integer;
  _poliza : _pol;

implementation

{$R *.dfm}

uses dm;

function TfrmPoliza.Botones(prefijo: String; n, e, s, u, b: Boolean;
  sigla: string; habil: Boolean; grp: String): Boolean;
Var
  _Nombre : String;
  _nuevo,_editar,_salvar,_undo,_borrar : TToolButton ;
  _Grp  : TGroupBox ;
begin

  if sigla <> ''  then
  Begin

    _Nombre    := prefijo + '_insertar_' + lowercase(sigla);
    _nuevo  := FindComponent(_Nombre) as TToolButton;
    _nuevo.Enabled := n;
    //---
    _Nombre    := prefijo + '_editar_' + lowercase(sigla);
    _editar := FindComponent(_Nombre) as TToolButton;
    _editar.Enabled := e;
    //---
    _Nombre    := prefijo + '_salvar_' + lowercase(sigla);
    _salvar := FindComponent(_Nombre) as TToolButton;
    _salvar.Enabled := s;
    //---
    _Nombre   := prefijo + '_UnDo_' + lowercase(sigla);
    _undo  := FindComponent(_Nombre) as TToolButton;
    _undo.Enabled := u;
    //---
    _Nombre    := prefijo + '_Borrar_' + lowercase(sigla);
    _borrar := FindComponent(_Nombre) as TToolButton;
    _borrar.Enabled := b;


    if grp <> '' then
    begin
      _Nombre      := grp + lowercase(sigla);
      _grp         := FindComponent(_Nombre) as TGroupBox;
      _grp.Enabled := habil;
    end;


  End;

end;

function TfrmPoliza.Botones_Cobertura(nuevo,editar,salvar,Undo,Borrar : Boolean ;
  sigla: string; habil : Boolean): Boolean;
Var
  _Nombre : String;
  _nuevo,_editar,_salvar,_undo,_borrar : TToolButton ;
  _Grp  : TGroupBox ;
begin
  //---
  if sigla <> ''  then
  Begin

    _Nombre    := 'btn_cob_insertar_' + lowercase(sigla);
    _nuevo  := FindComponent(_Nombre) as TToolButton;
    _nuevo.Enabled := nuevo;
    //---
    _Nombre    := 'btn_cob_editar_' + lowercase(sigla);
    _editar := FindComponent(_Nombre) as TToolButton;
    _editar.Enabled := editar;
    //---
    _Nombre    := 'btn_cob_salvar_' + lowercase(sigla);
    _salvar := FindComponent(_Nombre) as TToolButton;
    _salvar.Enabled := Salvar;
    //---
    _Nombre   := 'btn_cob_UnDo_' + lowercase(sigla);
    _undo  := FindComponent(_Nombre) as TToolButton;
    _undo.Enabled := undo;
    //---
    _Nombre    := 'btn_cob_Borrar_' + lowercase(sigla);
    _borrar := FindComponent(_Nombre) as TToolButton;
    _borrar.Enabled := Borrar;

    _Nombre   := 'grp_cobertura_' + lowercase(sigla);
    _grp := FindComponent(_Nombre) as TGroupBox;
    _grp.Enabled := habil;


  End;

end;

procedure TfrmPoliza.btn_cob_editar_autoClick(Sender: TObject);
//var
//  _nombre : String;
//  _foco   : TDBLookupComboBox ;
begin
  inherited;

   EditarCobertura;
//  _poliza.siglas := _poliza.siglas;
//  Botones('btn_cob',false,false,true,true,false,_poliza.siglas ,True,'grp_cob_') ;
//  _nombre := 'dbl_cobertura_' + _poliza.siglas ;
//  _foco   := FindComponent(_nombre) as TDBLookupComboBox ;
//  _foco.SetFocus;
end;
procedure TfrmPoliza.btn_cob_insertar_autoClick(Sender: TObject);
var
  _nombre : String;
  _foco   : TDBLookupComboBox ;
begin
  inherited;
  Botones('btn_cob',false,false,true,true,false,_poliza.siglas ,True,'grp_cob_') ;
  coberturas.Append;
  coberturasramo_subramo.AsInteger  := _poliza.ramo ;
  coberturaspoliza.AsString         := _poliza.poliza ;
  coberturasVigencia.AsInteger      := _poliza.vigencia ;
  coberturasbien.AsInteger          := _poliza.bien;

  _nombre := 'dbl_cobertura_' + _poliza.siglas ;
  _foco   := FindComponent(_nombre) as TDBLookupComboBox ;
  _foco.SetFocus;

end;

procedure TfrmPoliza.btn_cob_salvar_autoClick(Sender: TObject);
begin
  inherited;

  if coberturas.State in [dsInsert ,dsEdit ] then
  Begin
    coberturas.Edit;
  End
  Else
    exit;

  Try
    coberturas.Post;
  Except
    On e:exception Do
    Begin
      ShowMessage ('Fallo al Actualizar Cobertura : ' + e.Message);
    End;

  End;

  Botones_Cobertura(true,false,false,false,false,_poliza.siglas , false);
//  dbl_Bien_Cobertura.SetFocus ;

  if not coberturas.IsEmpty  then
  Begin
    Botones_Cobertura(true,true,false,false,true,_poliza.siglas , false);
  End;

  TotalCoberturas;

end;

procedure TfrmPoliza.btn_cob_undo_autoClick(Sender: TObject);
begin
  inherited;
  coberturas.Cancel;
  botones('btn_cob',true,false,false,false,false,_poliza.siglas , false,'grp_cob_');
  if not coberturas.IsEmpty  then
  Begin
    botones('btn_cob',true,true,false,false,true,_poliza.siglas , false,'grp_cob_');
  End;
end;

procedure TfrmPoliza.btn_cob_editar_incendioClick(Sender: TObject);
begin
  inherited;
   EditarCobertura;
  //Botones('btn_cob',false,false,true,true,false,_poliza.siglas ,false,'grp_cob_');
end;

procedure TfrmPoliza.btn_cob_editar_roboClick(Sender: TObject);
begin
  inherited;
   EditarCobertura;
end;

procedure TfrmPoliza.btn_cob_editar_vidaClick(Sender: TObject);
begin
  inherited;
  editarCobertura;
end;

procedure TfrmPoliza.btn_cob_insertar_incendioClick(Sender: TObject);
var
 _nombre : String;
 _foco   : TDBLookupComboBox ;
begin
  inherited;
  _poliza.siglas :=  _poliza.siglas;
  Botones('btn_cob',false,false,true,true,false,_poliza.siglas ,True,'grp_cob_');
  coberturas.Append;
  coberturasramo_subramo.AsInteger := _poliza.ramo;
  coberturaspoliza.AsString        := _poliza.poliza ;
  coberturasvigencia.AsInteger     := _poliza.vigencia;
  coberturasbien.AsInteger         := _poliza.bien;
  _nombre := 'dbl_cobertura_' + _poliza.siglas ;
  _foco   := FindComponent(_nombre) as TDBLookupComboBox ;
  _foco.SetFocus;

end;

procedure TfrmPoliza.btn_cob_insertar_vidaClick(Sender: TObject);
begin
  inherited;
  InsertarCobertura;
end;

procedure TfrmPoliza.btn_cob_salvar_incendioClick(Sender: TObject);
begin
  inherited;

  Botones('btn_cob',true,false,false,false,false,_poliza.siglas ,false,'grp_cob_');
  if Not coberturas.IsEmpty  then
  begin
    Botones('btn_cob',true,true,false,false,false,_poliza.siglas ,false,'grp_cob_');
  end;
end;

procedure TfrmPoliza.btn_cob_salvar_vidaClick(Sender: TObject);
begin
  inherited;
  //---

  botones('btn_cob',true,false,false,false,false,_poliza.siglas ,false,'grp_cob_');

  if Not coberturas.IsEmpty  then
  begin
    botones('btn_cob',true,true,false,false,true,_poliza.siglas ,false,'grp_cob_');
  end;
end;

procedure TfrmPoliza.btn_cob_UnDo_incendioClick(Sender: TObject);
begin
  inherited;
  coberturas.Cancel;
  botones('btn_cob',true,false,false,false,false,_poliza.siglas ,false,'grp_cob_');

  if Not coberturas.IsEmpty  then
  begin
    botones('btn_cob',true,true,false,false,true,_poliza.siglas ,false,'grp_cob_');
  end;
end;

procedure TfrmPoliza.btn_cob_undo_vidaClick(Sender: TObject);
begin
  inherited;
  coberturas.Cancel;
  botones('btn_cob',true,false,false,false,false,_poliza.siglas ,false,'grp_cob_');

  if Not coberturas.IsEmpty  then
  begin
    botones('btn_cob',true,true,false,false,true,_poliza.siglas ,false,'grp_cob_');
  end;
end;

procedure TfrmPoliza.btn_Gen_Borrar_incendioClick(Sender: TObject);
begin
  inherited;

  //--- al final del Evento
  botones('btn_gen',true,false,false,false,false,_poliza.siglas ,false,'');
  if not mbien.IsEmpty  then
  Begin
    botones('btn_gen',true,true,false,false,true,_poliza.siglas ,false,'');
  End;

end;

procedure TfrmPoliza.btn_gen_editar_autoClick(Sender: TObject);
begin
  inherited;
  botones('btn_gen',false,false,true,true,false,_poliza.siglas ,false,'');
  ed_filtro_auto.Enabled  := False;
  case pc_Bien.ActivePageIndex  of
    0 :
    Begin
      Componentes(grp_item_auto , false )
    End;
  end;

end;

procedure TfrmPoliza.btn_Gen_editar_incendioClick(Sender: TObject);
begin
  inherited;
  botones('btn_gen',false,false,true,true,false,_poliza.siglas ,false,'');
end;

procedure TfrmPoliza.btn_gen_insertar_autoClick(Sender: TObject);
begin
  inherited;
  Componentes(grp_item_auto , false );

  ed_filtro_auto.Enabled  := False;
//  btn_item_editar.Enabled := false ;
//  btn_gen_insertar_auto.Enabled    := false ;
//  btn_item_salvar.Enabled := true ;
//  btn_item_UnDo.Enabled   := true;
//  btn_item_Borrar.Enabled := False;
  botones('btn_gen',false,false,true,true,false,_poliza.siglas ,false,'');

  //---
  mBien.Close;
  mBien.Open;
  mbien.Append;

  mBienramo.AsInteger     := AseguradoPolizasramo_subramo.AsInteger;
  mBienpoliza.AsString    := AseguradoPolizaspoliza.AsString ;
  mBienvigencia.AsInteger := AseguradoPolizasvigencia.AsInteger ;
  mBienguid.AsString      := dm1._guid ;
end;

procedure TfrmPoliza.btn_Gen_insertar_incendioClick(Sender: TObject);
begin
  inherited;
  botones('btn_gen',false,false,true,true,false,_poliza.siglas ,false,'');
end;

procedure TfrmPoliza.btn_gen_salvar_autoClick(Sender: TObject);
var
 _commit,_continuar : boolean;
 _guid  : string;
 _sql   : string;
 i      : integer;
begin
  inherited;

  //  grp_item_auto.Enabled  := false;

  _commit    := true;
  _continuar := true;
  //--- Proceso de validacion de permisos
  //---

  //--- Inicia la transaccion

  if not dm1.sib.InTransaction  then
    dm1.sib.StartTransaction ;


  if mbien.State = dsinsert then
  Begin

     mBiensec.AsInteger := items.RecordCount +  1;

     mBien.Post;

     ActualizarBien.Close;
     ActualizarBien.open;
     ActualizarBien.Append;

  End
  Else
    if mbien.State = dsedit then
    Begin

      if mBienguid.AsString  = '' then
         mBienguid.AsString := dm1._guid ;

      mBien.Post;

      ActualizarBien.Close;
      ActualizarBien.Params [0].AsInteger := Itemsramo.AsInteger;
      ActualizarBien.Params [1].AsString  := Itemspoliza.AsString ;
      ActualizarBien.Params [2].AsInteger := Itemsvigencia.AsInteger ;
      ActualizarBien.Params [3].AsInteger := Itemssec.AsInteger ;
      ActualizarBien.open;
      ActualizarBien.edit;

    End
    Else
      _Continuar := False;

  if _continuar  then
  Begin

    For i := 0 to mBien.FieldCount - 1 do
    Begin
      ActualizarBien.Fields[i].Value := mbien.Fields[i].Value;
    End;

    _guid :=  mBienguid.AsString ;

    Try
      ActualizarBien.Post;
      dm1.sib.Commit;
      ActualizarBien.Close;
      CargarItems;
      items.Locate('guid',_guid,[]);
      CargarBien;
    Except
     on e:Exception do
     Begin
       showMessage('Fallo la actualizacion de Bien Asegurado '+e.Message );
       dm1.sib.Rollback ;
     End;

    End;
  End
  Else
  Begin
    ShowMessage('...');
  End;
  Componentes(grp_item_auto , True );

  ed_filtro_auto.Enabled  := True;
  botones('btn_gen',true,false,false,false,false,_poliza.siglas ,false,'');
//  btn_item_editar.Enabled := False ;
//  btn_gen_insertar_auto.Enabled    := true ;
//  btn_item_salvar.Enabled := False ;
//  btn_item_UnDo.Enabled   := False;
//  btn_item_Borrar.Enabled := False;

  if not mbien.IsEmpty  then
  Begin
    botones('btn_gen',true,true,false,false,true,_poliza.siglas ,false,'');
  End;

end;

procedure TfrmPoliza.btn_Gen_Salvar_incendioClick(Sender: TObject);
begin
  inherited;

  //--- al final del Evento
  botones('btn_gen',false,false,true,true,false,_poliza.siglas ,false,'');
  if not mbien.IsEmpty  then
  Begin
    botones('btn_gen',true,true,false,false,true,_poliza.siglas ,false,'');
  End;

end;

procedure TfrmPoliza.btn_gen_undo_autoClick(Sender: TObject);
begin
  inherited;
  mBien.Cancel;
  Componentes(grp_item_auto , True );

  ed_filtro_auto.Enabled  := True;
//  btn_gen_insertar_auto.Enabled    := true ;
//  btn_item_salvar.Enabled := False ;
//  btn_item_UnDo.Enabled   := False;
//  btn_item_editar.Enabled := False;
//  btn_item_Borrar.Enabled := False;

  botones('btn_gen',true,false,false,false,false,_poliza.siglas ,false,'');
  if not mBien.IsEmpty then
  Begin
    botones('btn_gen',true,true,false,false,true,_poliza.siglas ,false,'');
  End;
  CargarBien ;
end;

procedure TfrmPoliza.btn_Gen_UnDo_incendioClick(Sender: TObject);
begin
  inherited;
  //--- al final del Evento
  botones('btn_gen',false,false,true,true,false,_poliza.siglas ,false,'');
  if not mbien.IsEmpty  then
  Begin
    botones('btn_gen',true,true,false,false,true,_poliza.siglas ,false,'');
  End;

end;

procedure TfrmPoliza.btn_pol_EditClick(Sender: TObject);
begin
  inherited;

  if not mpoliza.eof then
  begin

    grp_pol_Generales.Enabled := true;
  //  grp_pol_Generales.SetFocus;
    btn_pol_new.Enabled       := False;
    btn_pol_Edit.Enabled      := false;
    btn_pol_salvar.Enabled    := True;
    mpoliza.Edit;  //--- mpoliza.state = dsedit
  end;
end;

procedure TfrmPoliza.btn_pol_newClick(Sender: TObject);
var
  _dia :  TdateTime;
begin

  inherited;

  btn_pol_salvar.Enabled := True;

  grp_pol_Generales.Enabled := True;

  dbl_Asegurado.SetFocus;

  btn_pol_new.Enabled := False;
  btn_pol_Edit.Enabled := False;
  ts_pol_Detalle.Enabled := False;
  ts_pol_adjuntos.Enabled := False;

  mpoliza.close;
  mpoliza.Open;
  mpoliza.Append;
  mpolizaid_cia.AsInteger := usuario.cia;
  mpolizaguid.AsString    := dm1._guid();
  ed_Documento.Clear;

  dp_Desde.DateTime := dm1.FechaSistema() ;
  dp_hasta.DateTime := IncYear (dp_desde.DateTime ,1);

  mpolizasuscripcion.AsDateTime := dm1.FechaSistema();
  mpolizavigencia.asinteger     := 1;
  mpolizaactiva.AsInteger       := 1;
  mpolizaestatus.AsString       := 'V';
  mpolizapromotor.AsString      := 'SLUVARO';

  _dia := dm1.FechaSistema();
  try
   // dp_Desde.MinDate  := IncDay(_dia, - 3);

  except

  end;
end;

procedure TfrmPoliza.btn_pol_salvarClick(Sender: TObject);
var
  i     : Integer;
  _guid : string;
  ABM   : String;
begin
  inherited;
  ABM := '';

  if mpoliza.State = dsInsert then
    ABM := 'A'
  Else
    if mpoliza.State = dsEdit then
      ABM := 'M'
    Else
      Exit;


  if not dm1.sib.InTransaction then
     dm1.sib.StartTransaction ;


  if mpolizaguid.AsString = '' then
     mpolizaguid.AsString := dm1._guid();

  _guid := mpolizaguid.AsString ;

  try

    mpolizainicio.AsDateTime := dp_Desde.DateTime ;
    mpolizafin.AsDateTime    := dp_Hasta.DateTime;

    mpoliza.Post;

    if ABM = 'A' then   // --- Insertar en tabla de Poliza
    Begin
      //---
      dm1.insertarPoliza.close;
      dm1.insertarPoliza.open;
      dm1.insertarPoliza.append;

      for i := 0 to mpoliza.FieldCount - 2 do
      begin
        dm1.insertarPoliza.Fields [i].Value := mpoliza.Fields[i].Value ;
      end;

      try
        dm1.insertarPoliza.Post;
        dm1.insertarPoliza.close;
        dm1.sib.commit;
        edFiltro.Clear;
        BuscarPolizas;
        AseguradoPolizas.Locate('guid',_guid,[]);

      Except
        on e:Exception do
        Begin
          Showmessage('error al salvar Poliza ...:' + e.Message);
          dm1.sib.Rollback;
        End;
      end;
    End;

   //--- Entra Por Actualizacion a los datos
    if ABM = 'M' then
    begin
      //(1) ubica la poliza a modificar ...


      dm1.ActualizarPoliza.Close;
      dm1.ActualizarPoliza.Params [0].AsInteger := dm1.AseguradoPolizasramo_subramo.AsInteger ;
      dm1.ActualizarPoliza.Params [1].AsString  := dm1.AseguradoPolizaspoliza.AsString ;
      dm1.ActualizarPoliza.Params [2].AsInteger := dm1.AseguradoPolizasvigencia.AsInteger ;
      dm1.ActualizarPoliza.Open;

      //(2) Actualiza los campos de la tabla poliza con la mpoliza
      if not dm1.ActualizarPoliza.eof then
      Begin
        dm1.ActualizarPoliza.edit;
        for i := 0 to mpoliza.FieldCount - 2 do
        begin
          dm1.ActualizarPoliza.Fields [i].Value := mpoliza.Fields[i].Value ;
        end;
      End;

      //(3) Apliza los cambios en la base de datos
      Try
          dm1.ActualizarPoliza.Post;
          dm1.sib.Commit ;
          dm1.RegistroLog(usuario.id ,'Actualiza Poliza',
              mpolizaramo_subramo.AsString  +
              mpolizapoliza.AsString        +
              '-' +
              mpolizavigencia.AsString);
          edFiltro.Clear;
          BuscarPolizas;
          AseguradoPolizas.Locate('guid',_guid,[]);

      Except
        on e:exception do
        Begin
          ShowMessage('Error al Actualizar Poliza...' +
             mpolizapoliza.AsString + ' ' +  e.Message );
          dm1.sib.Rollback ;
        End;

      End;

    end;
  except
    on e:Exception do
    Begin
      ShowMessage('Error en mPoliza...:' + e.Message);
    End;

  end;


  btn_pol_salvar.Enabled    := false;
  btn_pol_new.Enabled       := True;
  btn_pol_Edit.Enabled      := True;
//  grp_pol_Generales.Enabled := False;
  ts_pol_Detalle.Enabled    := true;
  ts_pol_adjuntos.Enabled   := true;

end;


procedure TfrmPoliza.btn_pol_UnDoClick(Sender: TObject);
var
  panel : TPanel;
begin
  inherited;
  grp_pol_Generales.Enabled := False;
  btn_pol_new.Enabled       := true;
  btn_pol_Edit.Enabled      := true;
  btn_pol_salvar.Enabled    := False;
  ts_pol_Detalle.Enabled := true;
  ts_pol_adjuntos.Enabled := true;
end;

procedure TfrmPoliza.BuscarPolizas;
var
 _Where  : string;
 _where0 : String;
 _where1 : string;
 _where2 : string;
begin
  inherited;

  _where0  := '';
  _where1  := '';
  _where2  := '';

  AseguradoPolizas.Close;
  AseguradoPolizas.SQL.Clear;

  AseguradoPolizas.SQL.add('Select * from vAseguradoPolizas ');

  if usuario.Rol = 'P' then
  Begin
    _where := 'Where xuser = ' + quotedStr(usuario.id);
  End Else
  Begin
    _where := 'Where 1 = 1 ';
  End;

  if rbActivas.Checked  then
    _where1 := _where1 + ' activa = 1 ';

  if rbInactivas.Checked then
    _where1 := _where1 + ' activa = 0 ';

  if rbAmbas .Checked then
    _where1 := '';

  if (_campo = '') or varisnull(_campo) then
    _where2 :=  ''
  else
  Begin
    _where2 := _campo + ' Like ' +
        QuotedStr('%' + edFiltro.Text + '%') ;
  End;

  if _where1 <> '' then
    _where := _where + ' and ' + _where1;

  if _where2 <> '' then
    _where := _where + ' and ' + _where2;


  AseguradoPolizas.sql.add(_where) ;
  AseguradoPolizas.SQL.add('Order by  nombre , apellido , ramo_subramo, poliza');

  Clipboard.AsText := AseguradoPolizas.SQL.Text ;

  AseguradoPolizas.open;
  _poliza.ramo     := AseguradoPolizasramo_subramo.AsInteger ;
  _poliza.poliza   := AseguradoPolizasapellido.AsString ;
  _poliza.vigencia := AseguradoPolizasvigencia.AsInteger ;
  _poliza.siglas   := AseguradoPolizassiglas.AsString ;

  dbgPolizas.Height :=  dbgPolizas.Height + 1;
  dbgPolizas.Height :=  dbgPolizas.Height - 1;

end;

procedure TfrmPoliza.CargarCoberturas;

var
  _dbgName : String;
  _dbgrid  : TDBGrid ;

begin
//--- Cargar Coberturas


  coberturas.Close;
  coberturas.Params[0].AsInteger :=  _poliza.ramo;
  coberturas.Params[1].AsString  :=  _poliza.poliza ;
  coberturas.Params[2].AsInteger :=  _poliza.vigencia ;
  coberturas.Params[3].AsInteger :=  _poliza.bien ;
  coberturas.Open();

//  Botones_Cobertura(true,false,false,false,false,_poliza.siglas ,False);
  Botones('btn_cob',true,false,false,false,false,_poliza.siglas , false,'grp_cob_');

  if  coberturas.IsEmpty then
  Begin
    TotalCoberturas;
    coberturas.Close;
    coberturas.open;
  End
  Else
  Begin

    Botones('btn_cob',true,true,false,false,true,_poliza.siglas , false,'grp_cob_');
    _dbgName := 'dbg_Coberturas_' + lowercase(AseguradoPolizassiglas.AsString );
    _dbgrid := FindComponent(_dbgName) as TDBGrid;

    TotalCoberturas;

    _dbgrid.Height :=  _dbgrid.Height + 1;
    _dbgrid.Height :=  _dbgrid.Height - 1;

  End;


end;

procedure TfrmPoliza.CargarGenerales;
var
  y,m,d,h,n,s,z : word;
  panel : TPanel;
  _var  : integer;
  i : Integer;
  _nombreTS : String;
begin

  //--- Recuperacion del registro de poliza...

  dm1.Poliza.close;
  dm1.Poliza.Params [0].AsInteger := 1;       //--- Compania = 1 (Seguros Luvaro)
  dm1.Poliza.Params [1].AsInteger := AseguradoPolizasramo_subramo.AsInteger;  //--- Ramo_subramo
  dm1.Poliza.Params [2].Asstring  := AseguradoPolizaspoliza.AsString  ;       //--- Poliza
  dm1.Poliza.Params [3].AsInteger := AseguradoPolizasVigencia.AsInteger ;     //--- Voigencia
  dm1.Poliza.Open();

  dm1.poliza.FetchAll;

  mpoliza.Cancel;
  mpoliza.Close;
  mpoliza.Data := dm1.poliza.Data;
  dm1.Poliza.close;
  mpoliza.edit;

  decodeDateTime(dm1.aseguradosfecha_nacimiento.AsDateTime,y,m,d,h,n,s,z);

  dp_Desde.DateTime := mpolizainicio.AsDateTime;
  dp_Hasta.DateTime := mpolizafin.AsDateTime ;

  ed_ocupacion.Text := dm1.aseguradosocupacion.AsString ;
  grp_pol_Generales.Enabled := False;
  btn_pol_new.Enabled       := true;
  btn_pol_salvar.Enabled    := False;
  btn_pol_Edit.Enabled      := True;

  if y = 1899 then
  Begin
    dp_fechanacimiento.Format :=  '''No Aplica''';
  End
  else
  begin
    dp_fechanacimiento.Format := '';
    dp_fechanacimiento.DateTime := dm1.aseguradosfecha_nacimiento.AsDateTime ;
  end;

  pc_poliza.Visible := true;

  ts_robo.TabVisible     := False;
  ts_Auto.TabVisible     := false;
  ts_incendio.TabVisible := False;
  ts_Vida.TabVisible     := False;

  _nombreTS := 'ts_' + LowerCase(aseguradoPolizasSiglas.AsString);

   _ts := FindComponent(_nombreTS) as TTabSheet;
  if not _ts.TabVisible then
  Begin
    _TS.TabVisible := true;
    _ts.Caption    := Uppercase(AseguradoPolizasDescripcion.AsString) ;
    pc_Bien.ActivePage :=_TS;
  End;

  if not CargarItems then
    items.Close;

End;




procedure TfrmPoliza.CargarGestion;
Var
  i:Integer;
begin

  if Gestiones.RecNo > 0 then //--- Esto me indica que estoy parado en un registro real
  begin
     //--- Inicio un ciclo for que me recorre todos los campos de la tabla fisica
     // y los pasa a la tabla de memoria.
     mGestion.Close;
     mGestion.Open;
     mGestion.Append;
     for i := 0 to Gestiones.FieldCount  - 2 do
     Begin
        //--- Por que -2 .. porque siempre es -1 porque arranca en cero
        //--  pero en este caso como el ultimo campo pertenece a otra tabla no lo cuento
        mGestion.Fields[i].Value := Gestiones.Fields[i].Value;
     End;
     mGestion.Post;
     notatmp.Clear;

  end
  Else
  Begin
    mGestion.Close;
  End;

  dbl_tipoGestion.ReadOnly   := True;
  dbl_EstadoGestion.ReadOnly := True;
  dbl_asignado.ReadOnly      := True;
  Nota.ReadOnly              := True;


end;

procedure TfrmPoliza.CargarGestiones;
begin
    Gestiones.Close;
    Gestiones.Params [0].AsInteger := mpolizaramo_subramo.AsInteger ;
    Gestiones.Params [1].AsString  := mpolizapoliza.AsString ;
    Gestiones.Params [2].Asinteger := mpolizavigencia.AsInteger ;
    Gestiones.Open();
end;

function TfrmPoliza.CargarBien: Boolean;
Var
 I : Integer;
begin
  mBien.Close;
  mBien.Open;
  mBien.Append;
//
  for I := 0 to items.FieldCount - 2 do
  Begin
    mBien.fields[i].value := items.Fields[i].Value;
  End;

  mBien.First;
  _poliza.ramo     := mBienramo.AsInteger ;
  _poliza.poliza   := mBienpoliza.AsString;
  _poliza.vigencia := mBienvigencia.AsInteger;
  _poliza.bien     := mBiensec.AsInteger ;

  botones('btn_gen',true,false,false,false,false,_poliza.siglas ,false,'');
  Result := True;

  if not mBien.IsEmpty then
  Begin
    botones('btn_gen',true,true,false,false,true,_poliza.siglas ,false,'');
  End;


end;

function TfrmPoliza.CargarItems: Boolean;
begin

  Items.Close;
  items.Params [0].AsInteger := mpolizaramo_subramo.AsInteger ;
  Items.Params [1].AsString  := mpolizapoliza.AsString ;
  items.Params [2].AsInteger := mpolizavigencia.AsInteger ;

  items.Open();
  items.First;

  if items.IsEmpty then
  begin
    Result := False
  end
  else
  Begin
    _poliza.bien := Itemssec.AsInteger ;
    Result := True;
  End;

end;

procedure TfrmPoliza.FiltrarLimites;
begin
  if coberturascobertura.AsInteger > 0  then
  Begin
    dm1.limites.Close;
    dm1.limites.sql.Clear ;
    dm1.limites.SQL.Add('Select * from Limites');
    dm1.limites.SQL.Add('where not descripcion is null and len(ltrim(rtrim(descripcion))) > 0');
    dm1.limites.SQL.Add(' and ramo  = ' + intToStr(_poliza.ramo));
    dm1.limites.SQL.Add(' and cober = ' + coberturascobertura.AsString );
    dm1.limites.Open();
  End;
end;

procedure TfrmPoliza.CargarModelos;
begin

  if dm1.marcasid_marca_model.AsInteger > 0 then
  Begin
    dm1.modelos.Close;
    dm1.modelos.SQL.Clear;
    dm1.modelos.SQL.Add('Select * from vModelos');
    dm1.modelos.SQL.Add('Where id_marca = ' + dm1.marcasid_marca_model.AsString );
    dm1.modelos.SQL.Add('Order by Marca_modelo');
    dm1.modelos.Open();
  End
  Else
  Begin
    dm1.modelos.close;
  End;
end;

procedure TfrmPoliza.coberturasCalcFields(DataSet: TDataSet);
begin
  inherited;
  //--- Cobertura Ramo
  dm1.CoberturaBien.Close;
  dm1.CoberturaBien.Params [0].AsInteger := _poliza.ramo ;
  dm1.CoberturaBien.Params [1].AsInteger := coberturascobertura.AsInteger;
  dm1.CoberturaBien.Open();

  if not dm1.CoberturaBien.IsEmpty  then
  begin
    coberturas_Cobertura.AsString := dm1.coberturaBiendescripcion.AsString ;
  end;
  dm1.CoberturaBien.Close;

  dm1.LimitesBien.Close;
  dm1.limitesBien.Params [0].AsInteger := _poliza.ramo ;
  dm1.LimitesBien.Params [1].AsInteger := coberturascobertura.AsInteger;
  dm1.LimitesBien.Params [2].AsString  := coberturaslimites.AsString ;
  dm1.LimitesBien.open;

  if not dm1.LimitesBien.IsEmpty then
  Begin
    coberturas_Limites.AsString := dm1.LimitesBiendescripcion.AsString ;
  End;
  dm1.LimitesBien.Close;
 // FiltrarLimites;
end;

function TfrmPoliza.Componentes(grp: TGroupBox; valor: Boolean): Boolean;
var
 i : Integer;
begin
 i:=i;
 for i:=0 to grp.ControlCount-1 do
 begin

   if grp.Controls[i] is TDBedit then
      TDBEdit(grp.Controls[i]).ReadOnly := valor;

   if grp.Controls[i] is TDBLookupComboBox then
      TDBLookupComboBox(grp.Controls[i]).ReadOnly := valor;

 end;
end;

procedure TfrmPoliza.DBEdit1Change(Sender: TObject);
begin
  inherited;
  if mpoliza.State in [dsedit,dsinsert] then
     mpolizaprima_Neta.AsFloat := mpolizaprima_bruta.AsFloat + mpolizaimpuestos.AsFloat ;
end;

procedure TfrmPoliza.DBEdit2Change(Sender: TObject);
begin
  inherited;
  if mpoliza.State in [dsedit,dsinsert] then
     mpolizaprima_Neta.AsFloat := mpolizaprima_bruta.AsFloat + mpolizaimpuestos.AsFloat ;
end;

procedure TfrmPoliza.DBEdit5Change(Sender: TObject);
begin
  inherited;
  //---
end;

procedure TfrmPoliza.DBEdit9Change(Sender: TObject);
begin
  inherited;
  if coberturas.State in [dsInsert,dsEdit] then
     TotalCoberturas;
end;

procedure TfrmPoliza.dbgPolizasCellClick(Column: TColumn);
begin
  inherited;

  lbFiltro.Caption :=  Column.Title.Caption ;

  _campo := dbgPolizas.SelectedField.FieldName;

  CargarGestiones;

end;

procedure TfrmPoliza.dbg_autosCellClick(Column: TColumn);
begin
  inherited;
//  CargarItem ;
//  CargarModelos;
end;

procedure TfrmPoliza.dbl_acreedoresEnter(Sender: TObject);
begin
  inherited;
  dm1.Acreedores.refresh;
end;

procedure TfrmPoliza.dbl_EstadoGestionClick(Sender: TObject);
begin
  inherited;
  notatmp.Text := mGestionnota.AsString ;
  notatmp.Text := notatmp.Text + #13 + '...' +
  #13 + '-------------------------------------------------------------------------------------------------------------------------------------------------'+ #13 +
  FormatDateTime('dd-mmm-yyyy hh:nn:ss',now) + ' - ' +
  'Usuario ' + UpperCase(usuario.nombre) + ' Cambio estado a : '
             + dm1.GestionEstadoDescripcion.AsString +
  #13 + '-------------------------------------------------------------------------------------------------------------------------------------------------'+ #13 ;
  nota.Clear;
  Nota.ReadOnly  := False;

  if dm1.GestionEstadoreasigna.AsBoolean  then
  begin
    grp_asignar.Enabled    := true;
    dp_Seguimiento.MinDate := Now;
    dp_Seguimiento.Format  := 'MMMM dd, yyyy - dddd HH:mm tt';
  end
  Else
  Begin
    grp_asignar.Enabled := False;
  End;
end;

procedure TfrmPoliza.dbl_frecuenciapagosClick(Sender: TObject);
begin
  inherited;
  dm1.FrecuenciaPagos.Refresh;
end;

procedure TfrmPoliza.dbl_marcaClick(Sender: TObject);
begin
  inherited;
  CargarModelos;
end;

procedure TfrmPoliza.dbl_marcaEnter(Sender: TObject);
begin
  inherited;
    ed_filtro_auto.TextHint  := 'Marca...';
    lbl_filtro_auto.Caption  := '   Marca:';
    filtro2 := 'Marca';
end;

procedure TfrmPoliza.dbl_modeloEnter(Sender: TObject);
begin
  inherited;
    ed_filtro_auto.TextHint  := 'Modelo...';
    lbl_filtro_auto.Caption  := '   Modelo:';
    filtro2 := 'Modelo';
end;

procedure TfrmPoliza.dbl_municipioEnter(Sender: TObject);
begin
  inherited;
  dm1.municipios.Refresh;
end;

procedure TfrmPoliza.dbl_TipoVehiculoEnter(Sender: TObject);
begin
  inherited;
//  dm1.tipoVehiculo.Close;
//  dm1.tipoVehiculo.Open();
  dm1.tipoVehiculo.refresh;
end;

procedure TfrmPoliza.dbl_usoAutosEnter(Sender: TObject);
begin
  inherited;
  dm1.usoAutos.refresh;
end;

procedure TfrmPoliza.db_AnoEnter(Sender: TObject);
begin
  inherited;
    ed_filtro_auto.TextHint  := 'Año...';
    lbl_filtro_auto.Caption  := '   Año:';
    filtro2 := 'anio';
end;

procedure TfrmPoliza.db_ChasisEnter(Sender: TObject);
begin
  inherited;
    ed_filtro_auto.TextHint  := 'No. de Chasis...';
    lbl_filtro_auto.Caption  := '   Chasis:';
    filtro2 := 'chasis';
end;

procedure TfrmPoliza.db_MotorEnter(Sender: TObject);
begin
  inherited;
    ed_filtro_auto.TextHint  := 'No. de motor...';
    lbl_filtro_auto.Caption  := '   Motor:';
    filtro2 := 'motor';
end;

procedure TfrmPoliza.db_PlacaEnter(Sender: TObject);
begin
  inherited;
    ed_filtro_auto.TextHint  := 'No. de Placa...';
    lbl_filtro_auto.Caption  := '   No. Placa:';
    filtro2 := 'placa';
end;

procedure TfrmPoliza.dp_DesdeChange(Sender: TObject);
begin
  inherited;

  if not (mpoliza.State in [dsinsert,dsEdit]) then
    mpoliza.Edit;

  mpolizainicio.AsDateTime := dp_Desde.DateTime ;
  mpolizafin.AsDateTime    := IncYear(dp_desde.datetime,1);
  dp_Hasta.DateTime        :=  mpolizafin.AsDateTime;
end;

procedure TfrmPoliza.dp_HastaChange(Sender: TObject);
begin
  inherited;

  if not (mpoliza.State in [dsinsert,dsEdit]) then
    mpoliza.Edit;

  mpolizaFin.AsDateTime := dp_Desde.DateTime ;
end;

procedure TfrmPoliza.dtsmPolizaDataChange(Sender: TObject; Field: TField);
begin
  inherited;
 //---

 ed_Documento.Text       := dm1.aseguradosdocumento.AsString ;
 ed_direccion.Text       := dm1.aseguradosdireccion.AsString ;
 ed_telefonofijo.Text    := dm1.aseguradostelefono.AsString ;
 ed_telefonoOficina.Text := dm1.aseguradostelefonoficina.AsString;
 ed_Celular.text         := dm1.aseguradoscelular.AsString;
 ed_Correo.Text          := dm1.aseguradosemail.AsString ;
 ed_nacionalidad.Text    := dm1.aseguradosnacionalidad.AsString;

end;

procedure TfrmPoliza.dts_aseguradoPolizasDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if not AseguradoPolizas.IsEmpty then
  Begin
    CargarGenerales;
    CargarGestiones;

    //--- Cargar Coberturas
//
    _poliza.ramo      := AseguradoPolizasramo_subramo.AsInteger ;
    _poliza.poliza    := AseguradoPolizaspoliza.AsString ;
    _poliza.vigencia  := AseguradoPolizasvigencia.AsInteger ;
    _Poliza.siglas    := AseguradoPolizassiglas.AsString ;
//
    dm1.coberturasRamo.Close;
    dm1.coberturasRamo.Params [0].AsInteger := _poliza.ramo;
    dm1.coberturasRamo.Open();
//

  End
  else
  Begin
    mpoliza.Close; //---Limpia la tabla de memoria si no encuetra nada en polizas
    mpoliza.Open;
    ed_Documento.Clear ;
    ed_direccion.Clear ;
    ed_telefonofijo.Clear ;
    ed_telefonoOficina.Clear ;
    ed_Celular.Clear ;
    ed_Correo.Clear ;
    ed_nacionalidad.Clear ;
  End;
end;

procedure TfrmPoliza.dts_CoberturasDataChange(Sender: TObject; Field: TField);
//var
// _Prima : Double;
// _pos   : integer;
begin
  inherited;
  FiltrarLimites;
end;

procedure TfrmPoliza.dts_GestionesDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  cargarGestion;
end;

procedure TfrmPoliza.dts_mBienDataChange(Sender: TObject; Field: TField);
begin
  inherited;

  CargarModelos;

//  btn_item_editar.Enabled := true;
    botones('btn_gen',true,true,false,false,true,_poliza.siglas ,false,'')  ;

  if mBien.eof then
  begin
    botones('btn_gen',true,false,false,false,false,_poliza.siglas ,false,'')  ;
  end;

end;

procedure TfrmPoliza.dts_ItemsDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  CargarBien;
  CargarCoberturas;

 // FiltrarLimites;
end;

procedure TfrmPoliza.dts_mGestionDataChange(Sender: TObject; Field: TField);
begin
  inherited;

  if (mGestion.State in [dsinsert,dsedit]) then
  begin

  end
  else
    grp_asignar.Enabled := false;

end;

procedure TfrmPoliza.edFiltroLeftButtonClick(Sender: TObject);

begin
  BuscarPolizas;
end;

procedure TfrmPoliza.edFiltroRightButtonClick(Sender: TObject);
var
  _Where : String;
begin
  inherited;

  edFiltro.Clear;

  AseguradoPolizas.Close;
  AseguradoPolizas.SQL.Clear;

  AseguradoPolizas.SQL.add('Select * from vAseguradoPolizas ');

  if usuario.Rol = 'P' then
  Begin
    _where := 'Where xuser = ' + quotedStr(usuario.id) ;
  End Else
  Begin
    _where := 'Where 1 = 1';
  End;


  AseguradoPolizas.sql.add(_where ) ;
  AseguradoPolizas.SQL.add('Order by  nombre , apellido , ramo_subramo, poliza');
  AseguradoPolizas.open;

  dbgPolizas.Height :=  dbgPolizas.Height + 1;
  dbgPolizas.Height :=  dbgPolizas.Height - 1;
end;

procedure TfrmPoliza.EditarCobertura;
var
  _nombre : String;
  _foco   : TDBLookupComboBox ;
begin
  _poliza.siglas :=  _poliza.siglas;

  Botones('btn_cob',false,false,true,true,false,_poliza.siglas ,true,'grp_cob_');
  coberturas.edit;
  coberturasramo_subramo.AsInteger := _poliza.ramo;
  coberturaspoliza.AsString        := _poliza.poliza ;
  coberturasvigencia.AsInteger     := _poliza.vigencia;
  coberturasbien.AsInteger         := _poliza.bien;

  _nombre := 'dbl_cobertura_' + _poliza.siglas ;
  _foco := FindComponent(_Nombre) as TDBLookupComboBox ;
  _foco.SetFocus;

end;

procedure TfrmPoliza.ed_filtro_autoLeftButtonClick(Sender: TObject);
begin
  inherited;
 // ed_det_filtro.Text := 'Cualquier Cosa...';
  AseguradoPolizas.Close;
  AseguradoPolizas.SQL.Clear;
  AseguradoPolizas.SQL.add('Select * from vAseguradoPolizas P ');
  AseguradoPolizas.SQL.add('left Join bien_asegurado b on ');
  AseguradoPolizas.SQL.add('p.ramo_subramo = b.ramo    and');
  AseguradoPolizas.SQL.add('p.poliza       = b.poliza  and');
  AseguradoPolizas.SQL.add('p.vigencia     = b.vigencia');
  AseguradoPolizas.SQL.add('where ' + Filtro2 + ' like ' + quotedStr('%'+ed_filtro_auto.Text+'%'));
  AseguradoPolizas.Open;
end;

procedure TfrmPoliza.ed_filtro_autoRightButtonClick(Sender: TObject);
begin
  inherited;
  ed_filtro_auto.Clear;
end;

procedure TfrmPoliza.ed_polizaExit(Sender: TObject);
begin
  inherited;
  dm1.fdq_PolizaVigencia.Close;
  dm1.fdq_PolizaVigencia.Params [0].AsInteger := mpolizaramo_subramo.AsInteger ;
  dm1.fdq_PolizaVigencia.Params [1].AsString  := mpolizapoliza.AsString ;
  dm1.fdq_PolizaVigencia.Open();

  if not dm1.fdq_PolizaVigencia.eof then
  begin
    mpolizavigencia.AsInteger := dm1.fdq_PolizaVigenciavigencia.AsInteger + 1 ;
  end
  Else
  begin
    mpolizavigencia.AsInteger := 1;
  end;

end;

procedure TfrmPoliza.FormActivate(Sender: TObject);
begin
  inherited;

  dm1.asegurados.close;
  dm1.asegurados.Open();

  dm1.ramos.close;
  dm1.ramos.Open();

  dm1.Aseguradoras.Close;
  dm1.Aseguradoras.Open();

  ScrollBox1.VertScrollBar.Position := 0;
  dm1.FrecuenciaPagos.Close;
  dm1.FrecuenciaPagos.Open();

  dm1.promotor.Close;
  dm1.promotor.Open();

  //--- Fecha de Gestiones
  dp_gestion_desde.DateTime := Now;
  dp_gestion_Hasta.DateTime := Now;

  //---
  dm1.tipoGestion.close;
  dm1.tipoGestion.Open();

  //--- DLB Asignados
  dm1.asignados.Close;
  dm1.asignados.Open();

  //---
  Gestiones.Open();

  //--- DBL Estado de la Gestion
  dm1.GestionEstado.Close;
  dm1.GestionEstado.Open();

  //--- dbl Marcas / Modelos

  dm1.marcas.Open();
  dm1.modelos.Open();

  //--- dbl municipio
  dm1.municipios.Close;
  dm1.municipios.open;

  //--- dbl Meses
  dm1.meses.Close;
  dm1.meses.open;

  //--- Dbl_ TipoVehiculo
  dm1.tipoVehiculo.Close;
  dm1.tipoVehiculo.Open();

  //---Dbl_uso
  dm1.usoAutos.Close;
  dm1.usoAutos.Open();

  //--- dbl_acreedor
  dm1.Acreedores.Close;
  dm1.Acreedores.Open();

end;


procedure TfrmPoliza.FormShow(Sender: TObject);
var
 _Where  : String;
 _poliza : String;
begin
  inherited;
  _campo := '';

  AseguradoPolizas.Close;
  AseguradoPolizas.SQL.Clear;

  AseguradoPolizas.SQL.add('Select * from vAseguradoPolizas ');

  if usuario.Rol = 'P' then
  Begin
    _where := 'Where promotor = ' + quotedStr(usuario.id) ;
  End else
  Begin
    _where := 'Where 1=1 ';
  End;

  AseguradoPolizas.sql.add(_where);

  if usuario.caso <> '' then
  Begin

    caso.Close;
    caso.Params [0].AsString := usuario.caso ;
    caso.Open();
    if not caso.IsEmpty  then
    Begin
      AseguradoPolizas.sql.add('and ramo_subramo  = ' + casoramo_subramo.AsString);
      AseguradoPolizas.sql.add('and poliza = '        + quotedStr(casopoliza.AsString)) ;
      AseguradoPolizas.SQL.Add('and vigencia = '      + casovigencia.AsString);
      caso.Close;
    End
    Else
    Begin
      caso.Close;
    End;

  End;

  AseguradoPolizas.SQL.add('Order by  nombre , apellido , ramo_subramo, poliza');

  AseguradoPolizas.open;
  pc_poliza.ActivePageIndex := 3; //'ts_Gestiones';
  ts_Gestiones.SetFocus;

  dbgPolizas.Height :=  dbgPolizas.Height + 1;
  dbgPolizas.Height :=  dbgPolizas.Height - 1;

end;

procedure TfrmPoliza.InsertarCobertura;
var
  _nombre : String;
  _foco   : TDBLookupComboBox ;
begin
  _poliza.siglas :=  _poliza.siglas;

  Botones('btn_cob',false,false,true,true,false,_poliza.siglas ,false,'');
  coberturas.Append;
  coberturasramo_subramo.AsInteger := _poliza.ramo;
  coberturaspoliza.AsString        := _poliza.poliza ;
  coberturasvigencia.AsInteger     := _poliza.vigencia;
  coberturasbien.AsInteger         := _poliza.bien;

  _nombre := 'dbl_cobertura_' + _poliza.siglas ;
  _foco := FindComponent(_Nombre) as TDBLookupComboBox ;
  _foco.SetFocus;

end;

procedure TfrmPoliza.ItemsCalcFields(DataSet: TDataSet);
var
  _bien : String;
begin
  inherited;
  _bien := copy(ItemsUbicacion.AsString,1,100);
   ItemsbienIncendio.AsString :=_bien;
end;

procedure TfrmPoliza.mpolizaCalcFields(DataSet: TDataSet);
begin
  inherited;

  if ( mpolizaprima_Neta.AsFloat > 0 ) and  (mpolizanopagos.AsInteger > 0) then
    mpolizaCuotas.AsFloat  := mpolizaprima_Neta.AsFloat / (mpolizanopagos.AsInteger );

end;

procedure TfrmPoliza.NotaExit(Sender: TObject);
begin
  inherited;
//  if notatmp.Text  <> '' then

end;

procedure TfrmPoliza.pc_polizaChange(Sender: TObject);
begin
  inherited;
  if pc_poliza.ActivePage.Name = 'ts_Gestiones'  then
  begin
    //--- recupera los datos de Gestiones
    CargarGestiones;
  end;

end;

procedure TfrmPoliza.pnl_bienDblClick(Sender: TObject);
begin
  inherited;
  pnl_Bien.Width := 260;
end;

procedure TfrmPoliza.rbActivasClick(Sender: TObject);
begin
  inherited;
  if rbActivas.Checked  then
    edFiltroLeftButtonClick(sender);
    dbgPolizas.SetFocus;
end;

procedure TfrmPoliza.rbAmbasClick(Sender: TObject);
begin
  inherited;
  if rbAmbas.Checked  then
    edFiltroLeftButtonClick(sender);
  dbgPolizas.SetFocus;
end;

procedure TfrmPoliza.rbInactivasClick(Sender: TObject);
begin
  inherited;
  if rbInactivas.Checked  then
    edFiltroLeftButtonClick(sender);
  dbgPolizas.SetFocus;
end;

procedure TfrmPoliza.RecuperaGestiones;
begin
  Gestiones.Close;
  Gestiones.params [0].AsInteger := mpolizaramo_subramo.AsInteger ;
  Gestiones.params [1].AsString  := mpolizapoliza.AsString ;
  Gestiones.params [2].AsInteger := mpolizavigencia.AsInteger ;
  Gestiones.Open();

  if not Gestiones.eof  then
  Begin
    Gestiones.FetchAll;

    mpoliza.Cancel;
    mpoliza.Close;
    mpoliza.Data := dm1.poliza.Data;
    dm1.Poliza.close;
    mpoliza.edit;

  End
  Else
  Begin

  End;


end;

procedure TfrmPoliza.sb_gestion_EditarClick(Sender: TObject);
begin
  inherited;
  mGestion.Edit;
  dbl_tipoGestion.ReadOnly   := True;
  dbl_asignado.ReadOnly      := False;
  dbl_EstadoGestion.ReadOnly := False;
  Nota.ReadOnly              := True;
end;

procedure TfrmPoliza.sb_gestion_nuevaClick(Sender: TObject);
begin
  inherited;

  mGestion.Close;
  mGestion.Open;
  mGestion.Append;
  mGestionfecha.AsDateTime        := dm1.FechaSistema();
  mGestionpoliza.AsString         := mpolizapoliza.AsString ;
  mGestionramo_Subramo.AsInteger  := mpolizaramo_subramo.AsInteger ;
  mGestionvigencia.AsInteger      := mpolizavigencia.AsInteger ;
  mGestionid_cia.AsInteger        := usuario.cia;
  mGestionaseguradora.AsInteger   := mpolizaaseguradora.AsInteger ;
  mGestionasegurado.AsInteger     := mpolizaasegurado.AsInteger;
  mGestionusuario.AsString        := usuario.id ;
  mGestionguid.AsString           := dm1._guid();
  mGestionestado.AsInteger        := 1;  //--- Estado Abierta

  grp_Gestion_Det.Enabled := True;

  dbl_tipoGestion.ReadOnly   := false;
  dbl_asignado.ReadOnly      := False;
  dbl_EstadoGestion.ReadOnly := False;
  Nota.ReadOnly              := False;
  nota.Clear;

  //---
  dp_Seguimiento.MinDate  := Now;
  dp_Seguimiento.Format   := 'MMMM dd, yyyy - dddd HH:mm tt';
  dp_Seguimiento.DateTime := now;

end;

procedure TfrmPoliza.sb_gestion_salvarClick(Sender: TObject);
var
  i      : integer;
  _guid  : string;
  ABM    : String;
  fecha1 : TDateTime;
begin
  inherited;

  ABM := '';
  //--- Validacion de permisos

  //--- Inicio de proceso de Salvado

  _guid := mGestionGuid.AsString ;

  mGestionfecha.AsDateTime := dp_Seguimiento.DateTime;
  mGestionnota.AsString    := notatmp.Text + nota.Text ;

  if mGestion.State in [dsinsert] then
  begin
    //--- Inserte en gestion_enc
    mGestion.Post;
    dm1.insertarGestion.Close;
    dm1.insertarGestion.Open();
    dm1.insertarGestion.Append;
    for i := 0 to dm1.insertarGestion.FieldCount - 1 do
    begin
      dm1.insertarGestion.Fields[i].Value := mgestion.fields[i].Value ;
    end;

    try
      dm1.insertarGestion.Post;
      CargarGestiones;
      Gestiones.Locate('guid',_guid,[]);
      cargarGestion;
      dm1.insertarGestion.Close;
    except
      on e:exception do
      Begin
        ShowMessage('Fallo la insersion de Gestion ....'+e.Message );
      End;
    end;
  end;

  //---Edicion
  if mGestion.State in [dsEdit] then
  Begin


    mGestion.Post;
    //--- Actuliza el re-asignado ...falta la actualizacion ...  !!! :)
    dm1.ActualizarGestion.Close;
    dm1.ActualizarGestion.Params [0].AsString  := mGestionnota.AsString ;
    dm1.ActualizarGestion.Params [1].AsInteger := mGestionestado.AsInteger ;
    dm1.ActualizarGestion.Params [2].AsString  := mGestionasignado.AsString ;
    dm1.ActualizarGestion.Params [3].asDateTime:= mGestionfecha.AsDateTime ;
    dm1.ActualizarGestion.Params [4].AsString  := mGestionguid.AsString ;

    Try
      dm1.ActualizarGestion.ExecSQL ;
      CargarGestiones;
      Gestiones.Locate('guid',_guid,[]);
      cargarGestion;
      dm1.insertarGestion.Close;
    except
      on e:exception do
      Begin
        ShowMessage('Fallo la actualizacion de Gestion ' + e.Message );
      End;

    End;
  End;

end;

procedure TfrmPoliza.sb_item_newClick(Sender: TObject);
begin
//  inherited;
//  Componentes(grp_item_auto , false );
//  ed_filtro_auto.Enabled := False;
//  sb_item_editar.Enabled := false ;
//  sb_item_new.Enabled    := false ;
//  sb_item_salvar.Enabled := true ;
//  sb_item_UnDo.Enabled   := true;
//
//  //---
//  mBien.Close;
//  mBien.Open;
//  mbien.Append;
//
//  mBienramo.AsInteger     := AseguradoPolizasramo_subramo.AsInteger;
//  mBienpoliza.AsString    := AseguradoPolizaspoliza.AsString ;
//  mBienvigencia.AsInteger := AseguradoPolizasvigencia.AsInteger ;
//  mBienguid.AsString      := dm1._guid ;

end;

procedure TfrmPoliza.sb_item_salvarClick(Sender: TObject);
var
 _commit,_continuar : boolean;
 _guid  : string;
 _sql   : string;
 i      : integer;
begin
//  inherited;
//
//  //  grp_item_auto.Enabled  := false;
//
//  ed_filtro_auto.Enabled := True;
//  sb_item_editar.Enabled := true ;
//  sb_item_new.Enabled    := true ;
//  sb_item_salvar.Enabled := False ;
//  sb_item_UnDo.Enabled   := False;
//
//  _commit    := true;
//  _continuar := true;
//  //--- Proceso de validacion de permisos
//  //---
//
//  //--- Inicia la transaccion
//
//  if not dm1.sib.InTransaction  then
//    dm1.sib.StartTransaction ;
//
//
//  if mbien.State = dsinsert then
//  Begin
//
//     mBiensec.AsInteger := items.RecordCount +  1;
//
//     mBien.Post;
//
//     ActualizarBien.Close;
//     ActualizarBien.open;
//     ActualizarBien.Append;
//
//  End
//  Else
//    if mbien.State = dsedit then
//    Begin
//
//      if mBienguid.AsString  = '' then
//         mBienguid.AsString := dm1._guid ;
//
//      mBien.Post;
//
//      ActualizarBien.Close;
//      ActualizarBien.Params [0].AsInteger := Itemsramo.AsInteger;
//      ActualizarBien.Params [1].AsString  := Itemspoliza.AsString ;
//      ActualizarBien.Params [2].AsInteger := Itemsvigencia.AsInteger ;
//      ActualizarBien.Params [3].AsInteger := Itemssec.AsInteger ;
//      ActualizarBien.open;
//      ActualizarBien.edit;
//
//    End
//    Else
//      _Continuar := False;
//
//  if _continuar  then
//  Begin
//
//    For i := 0 to mBien.FieldCount - 1 do
//    Begin
//      ActualizarBien.Fields[i].Value := mbien.Fields[i].Value;
//    End;
//
//    _guid :=  mBienguid.AsString ;
//
//    Try
//      ActualizarBien.Post;
//      dm1.sib.Commit;
//      ActualizarBien.Close;
//      CargarItems;
//      items.Locate('guid',_guid,[]);
//      CargarBien;
//    Except
//     on e:Exception do
//     Begin
//       showMessage('Fallo la actualizacion de Bien Asegurado '+e.Message );
//       dm1.sib.Rollback ;
//     End;
//
//    End;
//  End
//  Else
//  Begin
//    ShowMessage('...');
//  End;
//  Componentes(grp_item_auto , True );
end;

procedure TfrmPoliza.sb_item_UnDoClick(Sender: TObject);
begin
  inherited;
//  mBien.Cancel;
//  Componentes(grp_item_auto , True );
//  ed_filtro_auto.Enabled := True;
//  sb_item_editar.Enabled := true ;
//  sb_item_new.Enabled    := true ;
//  sb_item_salvar.Enabled := False ;
//  sb_item_UnDo.Enabled   := False;
//  CargarBien ;
end;

procedure TfrmPoliza.TotalCoberturas;
var
 _Prima : Double;
 _pos   : integer;
 _Stb   : String;
 _statusBar : TStatusBar;
begin
  inherited;
  _pos := coberturascobertura.AsInteger  ;
  coberturas.First;
  _Prima := 0.00;

  while not coberturas.eof  do
  Begin
    _prima := _prima + coberturasprima.AsFloat ;
    coberturas.Next;
  End;


  _Stb := 'stb_Prima_' + LowerCase(aseguradoPolizasSiglas.AsString);
  _statusBar := FindComponent(_Stb) as TStatusBar;


  coberturas.Locate('cobertura',_pos,[]);

  if _prima > 0.00 then
    _statusBar.Panels[1].Text := formatFloat('$#,##0.00',_prima)
  Else
    _statusBar.Panels[1].Text := '...';


end;

procedure TfrmPoliza.ts_pol_GeneralesExit(Sender: TObject);
begin
  inherited;
  if mpoliza.State in [dsedit,dsinsert] then
  begin
//    showmessage('Debe Salvar los Cambios Primero');
//    ts_pol_Generales.SetFocus;
  end;

end;

end.
