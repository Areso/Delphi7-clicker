unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    clicker: TTimer;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    Button3: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;

    procedure clickerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

    procedure Button3Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
                 numberofbutton: integer;
                 x: integer;
                 z: integer;
implementation

{$R *.dfm}
             procedure SimulateKeyDown(Key : byte);
begin
    keybd_event(Key, 0, 0, 0);
end;

procedure SimulateKeyUp(Key : byte);
begin
    keybd_event(Key, 0, KEYEVENTF_KEYUP, 0);
end;

procedure SimulateKeystroke(Key : byte; extra : DWORD);
begin
    keybd_event(Key,extra,0,0);
    keybd_event(Key,extra,KEYEVENTF_KEYUP,0);
end;


procedure SendKeys(s : string);
var
    i : integer;
    w : word;
begin

    SimulateKeystroke(numberofbutton, 0);
    showmessage('pyr');
end;






procedure TForm1.clickerTimer(Sender: TObject);
var
zna4: integer;
begin
SimulateKeystroke(numberofbutton, 0);

z:=z+1;
label5.caption :=  inttostr(z);
if z= 20 then
begin
z:=0;
clicker.Interval:= strtoint(Edit1.Text)*1000+100;
end;

    if x=0 then
    begin

    form1.Caption :='Clicker \';
    application.Title :='Clicker \';
    x:=1;
    end
    else
    begin

        form1.Caption :='Clicker /';
        application.Title :='Clicker /';
    x:=0;
    end;

    zna4 := random(2);
    if zna4=0 then
    begin
    clicker.Interval := clicker.Interval-100-random(150);
    end;
    if zna4=1 then
    begin
    clicker.Interval := clicker.Interval+100+random(150);
    end;


label3.caption:=IntToStr(clicker.Interval);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
numberofbutton:=118;
x:=0;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
clicker.Enabled:=true;
label3.Caption :=inttostr(strtoint(edit1.text)*1000+100);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
clicker.Enabled:=false;
end;




procedure TForm1.Button3Click(Sender: TObject);
begin
    if edit1.Text <> '' then
    clicker.Interval := strtoint(edit1.Text)*1000+100;

    if edit1.Text <> '' then
    numberofbutton:=111+StrToInt(edit2.text);
end;

end.


