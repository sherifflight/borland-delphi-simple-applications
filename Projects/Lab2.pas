unit Lab2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Label2: TLabel;
    //procedure Button1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ShowMessage(word: String);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    //procedure FormCreate(Sender: TObject);
    //procedure FormKeyUp(Sender: TObject; var Key: Word;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  moveToPixels: Integer;

implementation

{$R *.dfm}

procedure TForm1.ShowMessage(word: String);
begin
  Label1.Caption := word;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then
    begin
      Form1.ShowMessage('�� ������ �� ������� UP.');
      Form1.Top := Form1.Top - moveToPixels;
    end;
  if Key = VK_LEFT then
    begin
      Form1.ShowMessage('�� ������ �� ������� LEFT.');
      Form1.Left := Form1.Left - moveToPixels;
    end;
  if Key = VK_RIGHT then
    begin
      Form1.ShowMessage('�� ������ �� ������� RIGHT.');
      Form1.Left := Form1.Left + moveToPixels;
    end;
  if Key = VK_DOWN then
    begin
      Form1.ShowMessage('�� ������ �� ������� DOWN.');
      Form1.Top := Form1.Top + moveToPixels;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  moveToPixels := 10;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  message: String;
begin
  moveToPixels := StrToInt(Edit1.Text);
  message := '������� ����� �� ' + IntToStr(moveToPixels);
  Form1.ShowMessage(message);
  Form1.SetFocus;
  Label2.Hide;
  Edit1.Hide;
  Button1.Hide;
end;

end.
