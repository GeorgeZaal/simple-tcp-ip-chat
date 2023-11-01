object Form1: TForm1
  Left = 496
  Top = 227
  Width = 623
  Height = 624
  Caption = 'Simple TCP/IP Chat'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 607
    Height = 554
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clBlack
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    OnClick = Memo1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 554
    Width = 607
    Height = 32
    Align = alBottom
    BevelOuter = bvNone
    Color = clBlack
    TabOrder = 1
    object Edit2: TEdit
      Left = 8
      Top = 4
      Width = 593
      Height = 21
      BorderStyle = bsNone
      Color = clBlack
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clYellow
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyDown = Edit2KeyDown
    end
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 1111
    Left = 624
    Top = 552
  end
  object ServerSocket1: TServerSocket
    Active = True
    Port = 1111
    ServerType = stNonBlocking
    OnClientConnect = ServerSocket1ClientConnect
    OnClientRead = ServerSocket1ClientRead
    Left = 696
    Top = 552
  end
  object IdIPWatch1: TIdIPWatch
    Active = False
    HistoryFilename = 'iphist.dat'
    Left = 768
    Top = 552
  end
end
