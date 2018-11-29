program project2D;
uses GraphABC,System.Windows.Forms;
Type
TArray=array[1..100,1..100] of integer;
const
Step=25;//переместится на координат при одном шаге
VisPl=20;//высота модельки игрока
ShirPl=35;//ширина модельки игрока
VisObj=45;//высота  объектов карты
ShirObj=40; //ширина объектов карты
VisTile=100;//высота тайла земли
ShirTile=100; //ширина тайла земли
var
QQ1,QQ2:integer;// ПАРАЛЛЕЛЬ!
do1,do2,dob1,dob2:integer;//направление модели 
FileNameFon:string;//почтиненужное
PFon,l1,p1,v1,n1,l2,p2,v2,n2,pb,lb,vb,nb,ImFire :Picture;
VisSc{высота},ShirSc{ширина}:integer;
VisSum,ShirSum:integer;//{количество плиток по высоте,ширине}
X2,Y2:integer;
X1,Y1:integer;
xb1,yb1,xb2,yb2:integer;
matrixTile,matrixObj: TArray;

procedure player(a:integer);
begin
  case a of
      1:l1.Draw(x1,y1,ShirPl,VisPl);
      2:p1.Draw(x1,y1,ShirPl,VisPl);
      3:v1.Draw(x1,y1,ShirPl,VisPl);
      4:n1.Draw(x1,y1,ShirPl,VisPl);
      11:l2.Draw(x2,y2,ShirPl,VisPl);
      22:p2.Draw(x2,y2,ShirPl,VisPl);
      33:v2.Draw(x2,y2,ShirPl,VisPl);
      44:n2.Draw(x2,y2,ShirPl,VisPl);
      111:lb.Draw(xb1,yb1,ShirPl,VisPl);
      222:pb.Draw(xb1,yb1,ShirPl,VisPl);
      333:vb.Draw(xb1,yb1,ShirPl,VisPl);
      444:nb.Draw(xb1,yb1,ShirPl,VisPl);
      1111:lb.Draw(xb2,yb2,ShirPl,VisPl);
      2222:pb.Draw(xb2,yb2,ShirPl,VisPl);
      3333:vb.Draw(xb2,yb2,ShirPl,VisPl);
      4444:nb.Draw(xb2,yb2,ShirPl,VisPl);
  end;
end;   

procedure Rndworld(const VisSc,ShirSc,VisObj,ShirObj,VisTile,ShirTile: integer; var VisSum,ShirSum:integer; matrixTile,matrixObj:TArray);  
  var
  {Log}
  f1,f2: text;
  i, j: integer;
  {EndLog}
  RndTile,RndObj:integer;
  VisCord,VisHt:integer;
  ShirCord, ShirHt:integer;
  dirt,grass,sand,water,tree1,tree2,tree3,Boat: Picture;
  begin
  
  TextOut(ShirSc div 2 - 100,VisSc div 2,'Загрузка...'); 
  //LockDrawing;
  //load
  dirt:=Picture.Create('texture/dirt.png');
  grass:=Picture.Create('texture/grass.png');
  sand:=Picture.Create('texture/sand.png');
  water:=Picture.Create('texture/water.png');
  tree1:=Picture.Create('texture/tree1.png');
  tree2:=Picture.Create('texture/tree2.png');
  tree3:=Picture.Create('texture/tree3.png');
  Boat:=Picture.Create('texture/Boat.png');
  //считаем кол-во тайлов
  VisSum:=(VisSc div VisTile) + 1;
  ShirSum:=(ShirSc div ShirTile) +1;
  //заполняем
  VisHt:=1;
  VisCord:=1;
    While VisHt<>VisSum do
    begin
    ShirCord:=1;
    for ShirHt:=1 to ShirSum do
      begin
      RndTile:=random(1,4);
      RndObj:=random(1,6);
      matrixTile[ShirHt,VisHt]:=RndTile;
      matrixObj[ShirHt,VisHt]:=RndObj;
        case RndTile of
          1://земля
          begin
          dirt.Draw(ShirCord,VisCord,ShirTile,VisTile); //Выводит рисунок в позиции (x,y), масштабируя его к размеру (w,h) 
          if RndObj=1 then tree1.Draw(ShirCord + (ShirObj div 2),VisCord + (VisObj div 2),ShirObj,VisObj); //Выводит рисунок в позиции (x,y), масштабируя его к размеру (w,h)
          if RndObj=2 then tree2.Draw(ShirCord + (ShirObj div 2),VisCord + (VisObj div 2),ShirObj-10,VisObj-10); //Выводит рисунок в позиции (x,y), масштабируя его к размеру (w,h)
          end;
          2://трава
          begin
          grass.Draw(ShirCord,VisCord,ShirTile,VisTile); //Выводит рисунок в позиции (x,y), масштабируя его к размеру (w,h) 
          if RndObj=1 then tree1.Draw(ShirCord + (ShirObj div 2),VisCord + (VisObj div 2),ShirObj,VisObj); //Выводит рисунок в позиции (x,y), масштабируя его к размеру (w,h)
          if RndObj=2 then tree2.Draw(ShirCord + (ShirObj div 2),VisCord + (VisObj div 2),ShirObj-10,VisObj-10); //Выводит рисунок в позиции (x,y), масштабируя его к размеру (w,h)
          end;
          3://песок
          begin
          sand.Draw(ShirCord,VisCord,ShirTile,VisTile); //Выводит рисунок в позиции (x,y), масштабируя его к размеру (w,h) 
          if RndObj=3 then tree3.Draw(ShirCord + (ShirObj div 2),VisCord + (VisObj div 2),ShirObj-10,VisObj-10); //Выводит рисунок в позиции (x,y), масштабируя его к размеру (w,h)
          end;
          4://вода
          begin
          water.Draw(ShirCord,VisCord,ShirTile,VisTile); //Выводит рисунок в позиции (x,y), масштабируя его к размеру (w,h) 
          if RndObj=4 then boat.Draw(ShirCord + (ShirObj div 2),VisCord + (VisObj div 2),ShirObj,VisObj); //Выводит рисунок в позиции (x,y), масштабируя его к размеру (w,h)
          end;
        end;
      ShirCord:=ShirCord+ShirTile;
      end;
    VisHt:=VisHt+1;
    VisCord:=VisCord+VisTile;
    end;
  {Log}
  assign(f1,'LogTile.txt');
  assign(f2,'LogObj.txt');
  rewrite(f1);
  rewrite(f2);
  for j:=1 to VisSum  do
  begin
  for i:=1 to ShirSum do
  begin
  write(f1,matrixTile[i,j]);
  write(f1,' ');
  write(f2,matrixObj[i,j]);
  write(f2,' ');
  end;
  write(f1,#13#10);
  write(f2,#13#10);
  end;
  close(f1);
  close(f2);
  {EndLog}
  FileNameFon:=('fon.bmp');
  SaveWindow(FileNameFon);// Сохраняет содержимое графического окна в файл с именем fname
  PFon:=Picture.Create('fon.bmp');
  PFon.Draw(1,1);
  player(Do1);
  player(Do2);
  Redraw
  end;

procedure fire(StartX,StartY,FinX,FinY:integer);
begin
  While StartX<>FinX do
  if StartX<FinX then StartX:=StartX+10 else StartX:=StartX-10;
  ImFire.Draw(StartX,StartY,ShirPl,VisPl);
end;
  
procedure bot1;
begin
  if x1<xb1 then 
    begin
    xb1:=xb1-step;
    dob1:=111;
    end
  else  
  if x1>xb1 then 
    begin
    xb1:=xb1+step;
    dob1:=222;
    end
  else 
  if y1<yb1 then 
    begin
    yb1:=yb1-step;
    dob1:=333;
    end
  else  
  if y1>yb1 then 
    begin
    yb1:=yb1+step;
    dob1:=444;
    end;
  If (x1=xb1) and (y1=yb1) and (do1<>dob1) then 
  begin
    case do1 of
    1: dob1:=111;
    2: dob1:=222;
    3: dob1:=333;
    4: dob1:=444;
    end;
  end;
end;

procedure bot2;
begin
  if x2<xb2 then 
    begin
    xb2:=xb2-step;
    dob2:=1111;
    end
  else 
  if x2>xb2 then 
    begin
    xb2:=xb2+step;
    dob2:=2222;
    end
  else  
  if y2<yb2 then 
    begin
    yb2:=yb2-step;
    dob2:=3333;
    end
  else  
  if y2>yb2 then 
    begin
    yb2:=yb2+step;
    dob2:=4444;
    end;
  If (x2=xb2) and (y2=yb2) and (do2<>dob2) then 
  begin
    case do2 of
    11: dob1:=1111;
    22: dob1:=2222;
    33: dob1:=3333;
    44: dob1:=4444;
    end;
  end;
end;

procedure Detected(Key: integer);
begin
  case Key of
    VK_Left://лево
      begin
      x1:=x1-Step;   
      do1:=1;
      end;
    VK_Right://право
      begin
      x1:=x1+Step;
      do1:=2;
      end;
    VK_Up://верх
    begin
      y1:=y1-Step;
      do1:=3;
      end;
    VK_Down://низ   
    begin
      y1:=y1+Step;
      do1:=4;
      end;
    VK_A://лево2
      begin
      x2:=x2-Step;   
      do2:=11;
      end;
    VK_D://право2
      begin
      x2:=x2+Step;
      do2:=22;
      end;
    VK_W://верх2
      begin
      y2:=y2-Step;
      do2:=33;
      end;
    VK_S://низ2
      begin
      y2:=y2+Step;
      do2:=44;
      end;
  end;
end;


begin
  MaximizeWindow;//задаем макс разрешение 
  VisSc:=Screen.PrimaryScreen.Bounds.Height;//Возвращает высоту
  ShirSc:=Screen.PrimaryScreen.Bounds.Width;//Возвращает ширину 
  rndworld(VisSc,ShirSc,VisObj,ShirObj,VisTile,ShirTile,VisSum,ShirSum,matrixTile,matrixObj);
  x1:=10;   y1:=20;
  x2:=x1;   y2:=y1+step*5;
  xb1:=x1+step*random(1,ShirSc div step);   yb1:=y1+step*random(1,VisSc div step);
  xb2:=x2+step*random(1,ShirSc div step);   yb2:=y2+step*random(1,VisSc div step);
  do1:=2;
  do2:=22;
  ImFire:=Picture.Create('texture/Fire.png');
  l1:=Picture.Create('texture/l1.png');
  p1:=Picture.Create('texture/p1.png');
  v1:=Picture.Create('texture/v1.png');
  n1:=Picture.Create('texture/n1.png');
  l2:=Picture.Create('texture/l2.png');
  p2:=Picture.Create('texture/p2.png');
  v2:=Picture.Create('texture/v2.png');
  n2:=Picture.Create('texture/n2.png');
  lb:=Picture.Create('texture/l.png');
  pb:=Picture.Create('texture/p.png');
  vb:=Picture.Create('texture/v.png');
  nb:=Picture.Create('texture/n.png');
OnKeyUp:=Detected;
repeat
inc(QQ1);
inc(QQ2);
if QQ1 = 500 then 
  begin
  QQ1:=0;
  bot1;
  bot2;
  end;
If QQ2=100 then
  begin 
  LockDrawing; //ВК/Выкл, чтобы видеть прорисовку перемещения ботов
  QQ2:=0;
  PFon.Draw(1,1);
  player(Do1);
  player(Do2);
  player(dob1);
  player(dob2);
  Redraw; 
  end;
until false;
end.
