unit Lab5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TFauna = class
    Name: String;
    function GetInfo: String;virtual;
    Constructor Create(FName: String);
  end;

  TReptilia = class(TFauna)
    Age: real;
    function GetInfo: String;override;
    Constructor Create(FName: String; FAge: real);
  end;

  TAmphibia = class(TFauna)
    RespiratoryOrgan: String;
    function GetInfo: String;override;
    Constructor Create(FName: String; FRespiratoryOrgan: String);
  end;

  TPisces = class(TFauna)
    Length: integer;
    function GetInfo: String;override;
    Constructor Create(FName: String; FLength: integer);
  end;

const
  listSize=10;

var
  Form1: TForm1;
  FaunaArray: array[1..listSize] of TFauna;
  n: integer;

implementation

{$R *.dfm}

Constructor TFauna.Create(FName: String);
begin
  Name:=FName;
end;

function TFauna.GetInfo: String;
begin
  Result:=Name;
end;

Constructor TReptilia.Create(FName: String; FAge: real);
begin
  inherited Create(FName);
  Age:=FAge;
end;

function TReptilia.GetInfo: String;
begin
  Result:='Название: '+Name+' Возраст: '+FloatToStr(Age);
end;

Constructor TAmphibia.Create(FName: String; FRespiratoryOrgan: String);
begin
  inherited Create(FName);
  RespiratoryOrgan:=FRespiratoryOrgan;
end;

function TAmphibia.GetInfo: String;
begin
  Result:='Название: '+Name+' Орган дыхания: '+RespiratoryOrgan;
end;

Constructor TPisces.Create(FName: String; FLength: integer);
begin
  inherited Create(FName);
  Length:=FLength;
end;

function TPisces.GetInfo: String;
begin
  Result:='Название: '+Name+' Длина особи: '+IntToStr(Length);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  IF n<=listSize then
  begin
    if RadioGroup1.ItemIndex=0 then
      FaunaArray[n]:=TReptilia.Create(Edit1.Text, StrToFloat(Edit2.Text));
    if RadioGroup1.ItemIndex=1 then
      FaunaArray[n]:=TAmphibia.Create(Edit1.Text, Edit2.Text);
    if RadioGroup1.ItemIndex=2 then
      FaunaArray[n]:=TPisces.Create(Edit1.Text, StrToInt(Edit2.Text));
    n:=n+1;
  end
  ELSE ShowMessage('Список заполнен!');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i: integer;
  s: string;
begin
  for i:=1 to listSize do
    if FaunaArray[i] <> NIL then s:=s+FaunaArray[i].GetInfo+#13;
  ShowMessage('Фауна реки Лимпопо: '+#13+s);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  n:=1;
  if RadioGroup1.ItemIndex=0 then Label2.Caption:='Возраст животных';
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex=0 then Label2.Caption:='Возраст животных';
  if RadioGroup1.ItemIndex=1 then Label2.Caption:='Орган дыхания';
  if RadioGroup1.ItemIndex=2 then Label2.Caption:='Длина особи';
end;

end.
 