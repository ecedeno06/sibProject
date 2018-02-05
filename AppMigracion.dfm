object DM: TDM
  OldCreateOrder = False
  Height = 367
  Width = 487
  object p: TFDConnection
    Params.Strings = (
      'DataSource=Pacto'
      'Database=D:\pacto\pacto.mdb'
      'ODBCAdvanced=DriverId=25;MaxBufferSize=2048;PageTimeout=5'
      'DriverID=ODBC')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 56
  end
  object socios: TFDQuery
    Connection = p
    SQL.Strings = (
      'select * from socios')
    Left = 56
    Top = 152
  end
end
