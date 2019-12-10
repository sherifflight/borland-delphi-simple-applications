unit Lab3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ActnList, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    DateTimePicker1: TDateTimePicker;
    ComboBox1: TComboBox;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit11: TEdit;
    ComboBox2: TComboBox;
    DateTimePicker2: TDateTimePicker;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit12: TEdit;
    ComboBox3: TComboBox;
    DateTimePicker3: TDateTimePicker;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SetData(blockNumber: integer; data: TStringList);
    procedure SaveDataToFile();
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form1.SaveDataToFile();
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  F: TextFile;
  s: String;
  result: TStringList;
begin
  result := TStringList.Create;
  result.Delimiter := ';';

  try
  {$I-}
  if FileExists('C:\Users\Public\Documents\db.txt') then
    AssignFile(F, 'C:\Users\Public\Documents\db.txt');
  {$I-}
  Reset(F);
  Readln(F, s);
  if (Length(s) > 0) then
    begin
      result.DelimitedText := s;
      Form1.SetData(0, result);
      Readln(F, s);
      result.DelimitedText := s;
      Form1.SetData(1, result);
      Readln(F, s);
      result.DelimitedText := s;
      Form1.SetData(2, result);
    end;
  CloseFile(F);
  finally
    result.Free;
  end;
end;

procedure TForm1.SaveDataToFile();
var
  F: TextFile;
begin
  if FileExists('C:\Users\Public\Documents\db.txt') then
    AssignFile(F, 'C:\Users\Public\Documents\db.txt');
  Rewrite(F);
  Writeln(F,
    Form1.Edit1.Text+';'
    +Form1.Edit2.Text+';'
    +Form1.Edit2.Text+';'
    +DateToStr(Form1.DateTimePicker1.Date)+';'
    +Form1.ComboBox1.Text+';'
    +Form1.Edit4.Text
  );

  Writeln(F,
    Form1.Edit8.Text+';'
    +Form1.Edit9.Text+';'
    +Form1.Edit10.Text+';'
    +DateToStr(Form1.DateTimePicker2.Date)+';'
    +Form1.ComboBox2.Text+';'
    +Form1.Edit11.Text
  );

  Writeln(F,
    Form1.Edit5.Text+';'
    +Form1.Edit6.Text+';'
    +Form1.Edit7.Text+';'
    +DateToStr(Form1.DateTimePicker3.Date)+';'
    +Form1.ComboBox3.Text+';'
    +Form1.Edit12.Text
  );

  CloseFile(F);
end;

procedure TForm1.SetData(blockNumber: integer; data: TStringList);
begin
  if blockNumber = 0 then
    begin
      Form1.Edit1.Text := data[0];
      Form1.Edit2.Text := data[1];
      Form1.Edit2.Text := data[2];

      Form1.DateTimePicker1.Date := StrToDate(data[3]);
      Form1.ComboBox1.Text := data[4];
      Form1.Edit4.Text := data[5];
    end;
  if blockNumber = 1 then
    begin
      Form1.Edit8.Text := data[0];
      Form1.Edit9.Text := data[1];
      Form1.Edit10.Text := data[2];

      Form1.DateTimePicker2.Date := StrToDate(data[3]);
      Form1.ComboBox2.Text := data[4];
      Form1.Edit11.Text := data[5];
    end;
  if blockNumber = 2 then
    begin
      Form1.Edit5.Text := data[0];
      Form1.Edit6.Text := data[1];
      Form1.Edit7.Text := data[2];

      Form1.DateTimePicker3.Date := StrToDate(data[3]);
      Form1.ComboBox3.Text := data[4];
      Form1.Edit12.Text := data[5];
    end;  
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Application.Terminate;
  Exit;
end;

end.
