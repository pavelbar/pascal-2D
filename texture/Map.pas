unit Map;         {заголовок модуля}

interface
uses GraphAbc;
     { описание видимых программных элементов модуля }
  Type
  TArray=array[1..100,1..100] of integer;
  procedure Rndworld(const VisSc,ShirSc,VisObj,ShirObj,VisTile,ShirTile: integer; var VisSum,ShirSum:integer{; matrixTile,matrixObj:TArray});
 
implementation
     { операторы инициализации элементов модуля }
  procedure Rndworld(const VisSc,ShirSc,VisObj,ShirObj,VisTile,ShirTile: integer; var VisSum,ShirSum:integer{; matrixTile,matrixObj:TArray});
  
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
    LockDrawing;
    for ShirHt:=1 to ShirSum do
      begin
      RndTile:=random(1,4);
      RndObj:=random(1,6);
      {matrixTile[ShirHt,VisHt]:=RndTile;
      matrixObj[ShirHt,VisHt]:=RndObj;}
        case RndTile of
          1://земля
          begin
          dirt.Draw(ShirCord,VisCord,ShirTile,VisTile); //Выводит рисунок в позиции (x,y), масштабируя его к размеру (w,h) 
          if RndObj=1 then tree1.Draw(ShirCord + (ShirObj div 2),VisCord + (VisObj div 2),ShirObj,VisObj); //Выводит рисунок в позиции (x,y), масштабируя его к размеру (w,h)
          if RndObj=2 then tree2.Draw(ShirCord + (ShirObj div 2),VisCord + (VisObj div 2),ShirObj,VisObj); //Выводит рисунок в позиции (x,y), масштабируя его к размеру (w,h)
          Redraw;
          end;
          2://трава
          begin
          grass.Draw(ShirCord,VisCord,ShirTile,VisTile); //Выводит рисунок в позиции (x,y), масштабируя его к размеру (w,h) 
          if RndObj=1 then tree1.Draw(ShirCord + (ShirObj div 2),VisCord + (VisObj div 2),ShirObj,VisObj); //Выводит рисунок в позиции (x,y), масштабируя его к размеру (w,h)
          if RndObj=2 then tree2.Draw(ShirCord + (ShirObj div 2),VisCord + (VisObj div 2),ShirObj,VisObj); //Выводит рисунок в позиции (x,y), масштабируя его к размеру (w,h)
          Redraw;
          end;
          3://песок
          begin
          sand.Draw(ShirCord,VisCord,ShirTile,VisTile); //Выводит рисунок в позиции (x,y), масштабируя его к размеру (w,h) 
          if RndObj=3 then tree3.Draw(ShirCord + (ShirObj div 2),VisCord + (VisObj div 2),ShirObj,VisObj); //Выводит рисунок в позиции (x,y), масштабируя его к размеру (w,h)
          Redraw;
          end;
          4://вода
          begin
          water.Draw(ShirCord,VisCord,ShirTile,VisTile); //Выводит рисунок в позиции (x,y), масштабируя его к размеру (w,h) 
          if RndObj=4 then boat.Draw(ShirCord + (ShirObj div 2),VisCord + (VisObj div 2),ShirObj,VisObj); //Выводит рисунок в позиции (x,y), масштабируя его к размеру (w,h)
          Redraw;
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
 { write(f1,matrixTile[i,j]);
  write(f1,' ');
  write(f2,matrixObj[i,j]);
  write(f2,' ');}
  end;
  write(f1,#13#10);
  write(f2,#13#10);
  end;
  close(f1);
  close(f2);
  {EndLog}
  
  end;

end.