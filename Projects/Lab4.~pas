unit Lab4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label4: TLabel;
    Edit3: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TEnterprise = class
    fname: String[30];
    fowner: String[20];
    constructor Create(name: String; owner: String);
    destructor Destroy;
  end;

  TFactory = class (TEnterprise)
    fworkplace_count: integer;
    constructor Create (name: string; owner: string; workplace_count: integer);
    destructor Destroy;
    procedure Show(Memo: TMemo);
  end;

const
  count=5;

var
  Form1: TForm1;
  Factory:array [1..count] of TFactory;
  i,n:integer;

implementation

{$R *.dfm}

constructor TEnterprise.Create (name: string; owner: string);
begin
  fname:=name;
  fowner:=owner;
end;

constructor TFactory.Create(name:string; owner: string; workplace_count: integer);
begin
  inherited Create(name, owner);
  fworkplace_count:=workplace_count;
end;

destructor TEnterprise.Destroy;
begin
end;

destructor TFactory.Destroy;
begin
inherited;
end;

procedure TFactory.Show(Memo:TMemo);
begin
  Memo.Lines.Add(
    IntToStr(i)+') Название: '+fname+' Директор: '
    +fowner+' Рабочих мест: '+IntToStr(fworkplace_count)
  );
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  n:=1;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if n<=count then
    begin
      Factory[n] := TFactory.Create(Edit1.Text, Edit2.Text, StrToInt(Edit3.Text));
      n:=n+1;
    end
    else ShowMessage('Список заполнен!');
      Edit1.Text:='';
      Edit2.Text:='';
      Edit3.Text:='0';
    //end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  for i:=1 to count do
  begin
    if Factory[i] <> NIL then
      Factory[i].Show(Memo1);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  for i:=1 to count do
  begin
    if Factory[i] <> NIL then
      begin
        Factory[i].Destroy;
        Factory[i]:=NIL;
      end;
    Memo1.Lines.Clear;
    n:=1;
  end;
end;

end.
