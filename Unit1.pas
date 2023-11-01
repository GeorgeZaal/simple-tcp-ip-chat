unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ScktComp, IdBaseComponent, IdComponent, IdIPWatch,
  ExtCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    ClientSocket1: TClientSocket;
    ServerSocket1: TServerSocket;
    IdIPWatch1: TIdIPWatch;
    Panel1: TPanel;
    Edit2: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure FormShow(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure Memo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  hlp = 'connect [ip] - соединиться' +#13#10+ 'reconnect - переподключиться' +#13#10+ 'disconnect - отключиться' +#13#10+ 'exit - выход';

var
  Form1: TForm1;
  my_addr, hst : string;

implementation

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
begin
  ClientSocket1.Active := false;
  memo1.Lines.Add('Отключение прошло успешно');
end;

procedure TForm1.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  memo1.Lines.Add('Подключился ' + Socket.RemoteAddress);
end;

procedure TForm1.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  memo1.Lines.Add(Socket.ReceiveText);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  my_addr := IdIPWatch1.LocalIP;
  hst := '';
  edit2.SetFocus;
end;

procedure TForm1.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then
  begin
    if LowerCase(Edit2.Text) = 'exit' then
      close else
    if LowerCase(Edit2.Text) = 'help' then
      memo1.Lines.Add(hlp) else
    if LowerCase(Edit2.Text) = 'disconnect' then
      begin
        ClientSocket1.Active := false;
        memo1.Lines.Add('Отключение прошло успешно');
        hst := '';
      end else
    if LowerCase(Edit2.Text) = 'reconnect' then
      begin
        ClientSocket1.Host := hst;
        ClientSocket1.Active := false;
        ClientSocket1.Active := true;
        memo1.Lines.Add('Переподключение прошло успешно');
      end else
    if LowerCase(copy(edit2.Text, 1, 8)) = 'connect ' then
      begin
        hst := copy(edit2.Text, 9, length(edit2.Text)-8);
        ClientSocket1.Host := hst;
        ClientSocket1.Active := true;
      end else
      begin
        ClientSocket1.Socket.SendText(my_addr + ': ' + edit2.Text);
        memo1.Lines.Add(my_addr + ': ' + Edit2.Text);
      end;
    Edit2.Text := '';
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClientSocket1.Active := false;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  edit2.Width := panel1.Width - 14;
end;

procedure TForm1.Memo1Click(Sender: TObject);
begin
  Edit2.SetFocus;
end;

end.
