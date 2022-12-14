unit ufVarSelect;

// Contains a plot

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.Controls, WEBLib.ExtCtrls, Vcl.StdCtrls,
  WEBLib.StdCtrls, Types, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes;

type
  TVarSelectForm = class(TWebForm)
    okButton1: TWebButton;
    SpPlotCG: TWebCheckGroup;

    procedure plotFormCreate(Sender: TObject);
  //  procedure WebFormShow(Sender: TObject);
    procedure okButton1Click(Sender: TObject);
    procedure SpPlotCGCheckClick(Sender: TObject; AIndex: Integer);
    procedure setSpPlotCGFontColor( newColor: TColor);
    function  setChkGrpWidth(): integer; // adjusts width based on longest string in speciesList
    procedure unCheckGroup();
    procedure checkGroup();
  //
  private
    { Private declarations }
  public
    { Public declarations }
     speciesList: array of String;
     PlotWForm: TVarSelectForm;
     procedure fillSpeciesCG();
     procedure chkSpecies(index: integer);
     procedure unChkSpecies(index: integer);
  end;

implementation

{$R *.dfm}


// Close Plot:
procedure TVarSelectForm.okButton1Click(Sender: TObject);
var lForm: TWebForm;
begin
  lForm := TWebForm((Sender as TWebButton).Parent);
  lForm.Close;
  lForm.Free;
end;

procedure TVarSelectForm.plotFormCreate(Sender: TObject);
begin
  //console.log('Species select form created');
end;


procedure TVarSelectForm.SpPlotCGCheckClick(Sender: TObject; AIndex: Integer);
begin
// TODO ??
end;


function  TVarSelectForm.setChkGrpWidth(): integer;
var i, maxLength: integer;
begin
  maxLength := 0;
  for i := 0 to length(self.speciesList) -1 do
    begin
    if length(self.speciesList[i]) > maxLength then
      maxLength := length(self.speciesList[i]);
    end;
  if maxLength < 10 then
    maxLength := 10;
  result := maxLength * 10;
end;

procedure TVarSelectForm.fillSpeciesCG();
var i : integer;
begin
  if length(speciesList) > 10 then
    self.Height := 20*length(speciesList);  //15

  // Adjust chkgrp height as List may not fit with default height:
  self.SpPlotCG.height := round(2.7 * self.SpPlotCG.Font.Size * length(speciesList));

  self.SpPlotCG.Width := self.setChkGrpWidth ;// Adjust chkgrp width to fit longest string

  for i := 0 to length(speciesList)-1 do
    SpPlotCG.Items.Add ('&nbsp; ' + speciesList[i]);
end;

procedure TVarSelectForm.unCheckGroup();
var i: integer;
begin
  for i := 0 to length(speciesList)-1 do
    SpPlotCG.Checked[i] := false;
end;

procedure TVarSelectForm.checkGroup();
var i: integer;
begin
  for i := 0 to length(speciesList)-1 do
    SpPlotCG.Checked[i] := true;
end;

procedure TVarSelectForm.chkSpecies(index: integer);
begin
  if index < self.SpPlotCG.Items.Count then
    self.SpPlotCG.Checked[index] := true;
end;
procedure TVarSelectForm.unChkSpecies(index: integer);
begin
  if index < self.SpPlotCG.Items.Count then
    self.SpPlotCG.Checked[index] := false;
end;

procedure TVarSelectForm.setSpPlotCGFontColor(newColor: TColor);
begin
  self.SpPlotCG.font.color := newColor;
end;

end.
