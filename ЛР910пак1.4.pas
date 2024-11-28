function InitializeArray(size: integer; minValue: integer; maxValue: integer): array of integer; // формальные и по значению
var
  arr: array of integer;
  i: integer;
begin
  SetLength(arr, size);
  Randomize; 
  for i := 0 to size - 1 do
    arr[i] := Random(maxValue - minValue + 1) + minValue; 
  Result := arr; 
end;
// локальные переменные arr i
function SumPositive(arr: array of integer; size: integer): integer; // формальные и по значению
var
  i: integer;
begin
  Result := 0; 
  for i := 0 to size - 1 do
  begin
    if arr[i] > 0 then 
      Result := Result + arr[i]; 
  end;
end;
// локальные переменные i
procedure PrintArray(arr: array of integer; size: integer); // формальные и по значению
var
  i: integer;
begin
  for i := 0 to size - 1 do
    Write(arr[i], ' ');
  Writeln;
end;
// локальные переменные arr i
var //вот тут все глоб. переменные
  myArray1, myArray2: array of integer;
  size1, minValue1, maxValue1, size2, minValue2, maxValue2, sum1, sum2: integer;

begin
  writeln('Введите размер первого массива: ');
  readln(size1);
  
  writeln('Введите минимальное значение для первого массива: ');
  readln(minValue1);
  
  writeln('Введите максимальное значение для первого массива: ');
  readln(maxValue1);
  
  writeln('Введите размер вторго массива: ');
  readln(size2);
  
  writeln('Введите минимальное значение для второго массива: ');
  readln(minValue2);
  
  writeln('Введите максимальное значение для второго массива: ');
  readln(maxValue2);
  

  myArray1 := InitializeArray(size1, minValue1, maxValue1); // фактические  
  myArray2 := InitializeArray(size2, minValue2, maxValue2); // фактические 
  
  writeln('Сгенерированный первый массив: ');
  PrintArray(myArray1, size1);
  writeln('Сгенерированный второй массив: ');
  PrintArray(myArray2, size2);
  
  sum1 := SumPositive(myArray1, size1); // фактические 
  sum2 := SumPositive(myArray2, size2); // фактические 
  
  writeln('Сумма положительных элементов первого массива: ', sum1);
  writeln('Сумма положительных элементов второго массива: ', sum2);
  if sum1 < sum2 then
    for var i := 0 to size1 - 1 do
    begin
      write(myArray1[i]*10, ' ')
    end
  else
    for var i := 0 to size2 - 1 do
    begin
      write(myArray2[i]*10, ' ')
    end;
      
end.
