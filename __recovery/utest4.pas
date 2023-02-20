unit utest4;

// 순서 interface implementation initialization finalization
// type, const, var, procedure, function 선언
// 다른 유니트에서 이곳에 정의된 var, procedure, function 사용 가능 단 uses 절에 utest4 추가해야함
// 인터페이스 타입
interface
uses Vcl.Dialogs;

type
  Country = array [0..2] of string; // 여러개의 자료형은 불가

  // 구조체 선언
  Person = record
    Name:string;
    Age:Byte;
    Address:string;
  end;

  // 구조체 포인터
  p_person = ^Person;

// 변수 선언
var
  s : string; // unicodString;
{ 버전에 따라 다름
1.0 : shortstring
2.0 ~ 2009 이전 : Ansistring
2009 ~ 현재 : UNICODESTRING
}
  i : integer = 100; // 숫자형
  t : tdatetime;
  b : boolean;
  Countries : Country;
  a : array of string; // 미할당
  a2 : array of array of string; // 2차원 배열

  p:p_person;
  ps:pchar; // pansichar, pwidechar, punicodechar

//procedrue Test;
function Add(x, y : integer):integer;

// inetface 에서 선언된 루틴(procedure, function) 들을 구현하는 곳
// type, var, const 역시 선언할 수 있다 : 다른 유니트에서는 사용할 수 없으며 해당 유니트의 구현 부분에서만 사용 가능
implementation

var
  j : integer;

procedure Test;
var
  k : integer;
begin
  ShowMessage('test called');
end;

function Add(x, y : integer):integer;
begin
//  Add := x + y;
  Result := x + y;
// exit(x + y);
end;

// uses 절을 만나면 실행 : 초기처리 : 변수 default 값 지정, 메모리 할당
initialization
begin
  Countries[0] := '한국';
  Countries[1] := '미국';
  Countries[2] := '영국';

  SetLength(a, 4);
  a[0] := 'a';
  a[1] := 'b';
  a[2] := 'c';
  a[3] := 'd';

  SetLength(a2, 4, 4);
  a2[0,0] := '1';
  a2[0,1] := '2';
  a2[0,2] := '3';
  a2[0,3] := '4';


end;

finalization

end.
