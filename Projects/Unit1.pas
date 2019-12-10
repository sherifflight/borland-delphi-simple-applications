unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    procedure Draw(cl:TColor);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ImageCanvas: TCanvas;
  size: integer;

implementation

{$R *.dfm}
procedure TForm1.Draw(cl:TColor);
begin
  size:= 3;
  ImageCanvas := Form1.Image1.Canvas;
  ImageCanvas.Pen.Color := cl;

  //top
  ImageCanvas.MoveTo(30*size, 0*size);
  ImageCanvas.LineTo(80*size, 0*size);
  ImageCanvas.LineTo(60*size, 40*size);
  ImageCanvas.LineTo(60*size, 40*size);
  ImageCanvas.LineTo(10*size, 40*size);
  ImageCanvas.LineTo(30*size, 0*size);

  //front
  ImageCanvas.Rectangle(10*size, 40*size, 60*size, 120*size);

  //right
  ImageCanvas.MoveTo(60*size, 120*size);
  ImageCanvas.LineTo(80*size, 80*size);
  ImageCanvas.LineTo(80*size, 0*size);

  //back
  ImageCanvas.Pen.Style := psDot;
  ImageCanvas.MoveTo(10*size, 120*size);
  ImageCanvas.LineTo(30*size, 80*size);
  ImageCanvas.LineTo(30*size, 0*size);
  ImageCanvas.MoveTo(30*size, 80*size);
  ImageCanvas.LineTo(80*size, 80*size);

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form1.Draw(clRed);
end;

end.
