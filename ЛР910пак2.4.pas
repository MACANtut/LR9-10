uses crt;

const
  Rows = 8;
  Cols = 8;

var
  twoDArray: array[1..Rows, 1..Cols] of Integer;
  minElements: array[1..Rows] of Integer;
  average, i, j: Integer;

procedure Create2DArray; //создание двумерного массива
begin
  for var i := 1 to Rows do
    for var j := 1 to Cols do
      twoDArray[i, j] := Random(100); 
end;

procedure GetMinElements; //поиск минимальных элементов в каждой строке 
begin
  for var i := 1 to Rows do
  begin
    minElements[i] := twoDArray[i, 1]; 
    for var j := 2 to Cols do
      if twoDArray[i, j] < minElements[i] then
        minElements[i] := twoDArray[i, j]; 
  end;
end;

function CalculateAverage: Integer; //вычисление среднего арифметического 
var
  sum: Integer;
begin
  sum := 0;
  for var i := 1 to Rows do
    sum := sum + minElements[i]; 
  CalculateAverage := Round(sum / Rows); 
end;

function CheckAverageInArray(average: Integer): Boolean; //проверка на содержание мреднего арифметического в строке с минимальными значениями
var
  found: Boolean;
begin
  found := False;
  for var i := 1 to Rows do
    if minElements[i] = average then
    begin
      found := True; 
      Break;
    end;
  CheckAverageInArray := found;
end;

begin
  Create2DArray;

  writeln('Двумерный массив:');
  for i := 1 to Rows do
  begin
    for j := 1 to Cols do
      write(twoDArray[i, j]:4);
    writeln;
  end;

  GetMinElements;

  writeln('Одномерный массив минимальных элементов:');
  for i := 1 to Rows do
    write(minElements[i]:4);
  
  average := CalculateAverage;
  writeln;
  writeln('Среднее арифметическое минимальных элементов: ', average);

  if CheckAverageInArray(average) then
    writeln('Среднее арифметическое ', average, ' содержится в одномерном массиве.')
  else
    writeln('Среднее арифметическое ', average, ' не содержится в одномерном массиве.');
end.
