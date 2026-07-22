unit LUX.Vulkan.Stream.FMX.D1;

interface //#################################################################### ■

uses System.UITypes,
     FMX.Graphics,
     LUX.Color,
     LUX.Vulkan;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     TVkStream1D_FMX<TVkImager_:class> = class;
       TVkStream1DxBGRAxUInt8_FMX      = class;
       TVkStream1DxBGRAxUFix8_FMX      = class;
       TVkStream1DxRGBAxUInt32_FMX     = class;
       TVkStream1DxRGBAxSFlo32_FMX     = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkStream1D_FMX<TVkImager_>

     IVkStream1D_FMX<TVkImager_:class> = interface
     ['{6F2A70F1-27F2-4CE1-AA9B-3A7E8B1C9D01}']
     {protected}
       function GetImage :TVkImager_;
       procedure SetImage( const Imager_:TVkImager_ );
     {public}
       ///// P R O P E R T Y
       property Imager :TVkImager_ read GetImage write SetImage;
       ///// M E T H O D
       procedure CopyTo( const Bitmap_:TBitmap ); overload;
       procedure CopyFrom( const Bitmap_:TBitmap ); overload;
       procedure SaveToFile( const FileName_:String );
       procedure LoadFromFile( const FileName_:String );
     end;

     TVkStream1D_FMX<TVkImager_:class> = class( TInterfacedObject, IVkStream1D_FMX<TVkImager_> )
     private
     protected
       _Imager :TVkImager_;
       ///// A C C E S S O R
       function GetImage :TVkImager_;
       procedure SetImage( const Imager_:TVkImager_ );
     public
       constructor Create; overload;
       constructor Create( const Imager_:TVkImager_ ); overload;
       ///// P R O P E R T Y
       property Imager :TVkImager_ read GetImage write SetImage;
       ///// M E T H O D
       procedure CopyTo( const Bitmap_:TBitmap ); overload; virtual; abstract;
       procedure CopyFrom( const Bitmap_:TBitmap ); overload; virtual; abstract;
       procedure SaveToFile( const FileName_:String ); virtual;
       procedure LoadFromFile( const FileName_:String ); virtual;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkStream1DxBGRAxUInt8_FMX

     IVkStream1DxBGRAxUInt8_FMX = IVkStream1D_FMX<TVkImager1DxBGRAxUInt8>;

     TVkStream1DxBGRAxUInt8_FMX = class( TVkStream1D_FMX<TVkImager1DxBGRAxUInt8>, IVkStream1DxBGRAxUInt8_FMX )
     private
     protected
     public
       ///// M E T H O D
       procedure CopyTo( const Bitmap_:TBitmap ); override;
       procedure CopyFrom( const Bitmap_:TBitmap ); override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkStream1DxBGRAxUFix8_FMX

     IVkStream1DxBGRAxUFix8_FMX = IVkStream1D_FMX<TVkImager1DxBGRAxUFix8>;

     TVkStream1DxBGRAxUFix8_FMX = class( TVkStream1D_FMX<TVkImager1DxBGRAxUFix8>, IVkStream1DxBGRAxUFix8_FMX )
     private
     protected
     public
       ///// M E T H O D
       procedure CopyTo( const Bitmap_:TBitmap ); override;
       procedure CopyFrom( const Bitmap_:TBitmap ); override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkStream1DxRGBAxUInt32_FMX

     IVkStream1DxRGBAxUInt32_FMX = IVkStream1D_FMX<TVkImager1DxRGBAxUInt32>;

     TVkStream1DxRGBAxUInt32_FMX = class( TVkStream1D_FMX<TVkImager1DxRGBAxUInt32>, IVkStream1DxRGBAxUInt32_FMX )
     private
     protected
     public
       ///// M E T H O D
       procedure CopyTo( const Bitmap_:TBitmap ); override;
       procedure CopyFrom( const Bitmap_:TBitmap ); override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkStream1DxRGBAxSFlo32_FMX

     IVkStream1DxRGBAxSFlo32_FMX = IVkStream1D_FMX<TVkImager1DxRGBAxSFlo32>;

     TVkStream1DxRGBAxSFlo32_FMX = class( TVkStream1D_FMX<TVkImager1DxRGBAxSFlo32>, IVkStream1DxRGBAxSFlo32_FMX )
     private
     protected
     public
       ///// M E T H O D
       procedure CopyTo( const Bitmap_:TBitmap ); override;
       procedure CopyFrom( const Bitmap_:TBitmap ); override;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C O N S T A N T 】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 V A R I A B L E 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkStream1D_FMX<TVkImager_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkStream1D_FMX<TVkImager_>.GetImage :TVkImager_;
begin
     Result := _Imager;
end;

procedure TVkStream1D_FMX<TVkImager_>.SetImage( const Imager_:TVkImager_ );
begin
     _Imager := Imager_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkStream1D_FMX<TVkImager_>.Create;
begin
     inherited;

end;

constructor TVkStream1D_FMX<TVkImager_>.Create( const Imager_:TVkImager_ );
begin
     Create;

     Imager := Imager_;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkStream1D_FMX<TVkImager_>.SaveToFile( const FileName_:String );
var
   B :TBitmap;
begin
     B := TBitmap.Create;

     CopyTo( B );

     B.SaveToFile( FileName_ );

     B.Free;
end;

procedure TVkStream1D_FMX<TVkImager_>.LoadFromFile( const FileName_:String );
var
   B :TBitmap;
begin
     B := TBitmap.Create;

     B.LoadFromFile( FileName_ );

     CopyFrom( B );

     B.Free;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkStream1DxBGRAxUInt8_FMX

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkStream1DxBGRAxUInt8_FMX.CopyTo( const Bitmap_:TBitmap );
var
   B :TBitmapData;
begin
     with _Imager do
     begin
          Bitmap_.SetSize( CountX, CountY );

          Data.Map;

          Bitmap_.Map( TMapAccess.Write, B );

          Move( Data.ValueP[ 0 ]^,
                B.GetScanline( 0 )^,
                B.BytesPerLine );

          Bitmap_.Unmap( B );

          Data.Unmap;
     end;
end;

procedure TVkStream1DxBGRAxUInt8_FMX.CopyFrom( const Bitmap_:TBitmap );
var
   B :TBitmapData;
begin
     with _Imager do
     begin
          CountX := Bitmap_.Width;

          Bitmap_.Map( TMapAccess.Read, B );

          Data.Map;

          Move( B.GetScanline( 0 )^,
                Data.ValueP[ 0 ]^,
                B.BytesPerLine );

          Data.Unmap;

          Bitmap_.Unmap( B );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkStream1DxBGRAxUFix8_FMX

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkStream1DxBGRAxUFix8_FMX.CopyTo( const Bitmap_:TBitmap );
var
   B :TBitmapData;
begin
     with _Imager do
     begin
          Bitmap_.SetSize( CountX, CountY );

          Data.Map;

          Bitmap_.Map( TMapAccess.Write, B );

          Move( Data.ValueP[ 0 ]^,
                B.GetScanline( 0 )^,
                B.BytesPerLine );

          Bitmap_.Unmap( B );

          Data.Unmap;
     end;
end;

procedure TVkStream1DxBGRAxUFix8_FMX.CopyFrom( const Bitmap_:TBitmap );
var
   B :TBitmapData;
begin
     with _Imager do
     begin
          CountX := Bitmap_.Width;

          Bitmap_.Map( TMapAccess.Read, B );

          Data.Map;

          Move( B.GetScanline( 0 )^,
                Data.ValueP[ 0 ]^,
                B.BytesPerLine );

          Data.Unmap;

          Bitmap_.Unmap( B );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkStream1DxRGBAxUInt32_FMX

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkStream1DxRGBAxUInt32_FMX.CopyTo( const Bitmap_:TBitmap );
var
   B :TBitmapData;
   X :Integer;
begin
     with _Imager do
     begin
          Bitmap_.SetSize( CountX, 1 );

          Data.Map;

          Bitmap_.Map( TMapAccess.Write, B );

          for X := 0 to CountX-1 do B.SetPixel( X, 0, TByteRGBA( Data[ X ] ) );

          Bitmap_.Unmap( B );

          Data.Unmap;
     end;
end;

procedure TVkStream1DxRGBAxUInt32_FMX.CopyFrom( const Bitmap_:TBitmap );
var
   B :TBitmapData;
   X :Integer;
begin
     with _Imager do
     begin
          CountX := Bitmap_.Width;

          Bitmap_.Map( TMapAccess.Read, B );

          Data.Map;

          for X := 0 to CountX-1 do Data[ X ] := B.GetPixel( X, 0 );

          Data.Unmap;

          Bitmap_.Unmap( B );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkStream1DxRGBAxSFlo32_FMX

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkStream1DxRGBAxSFlo32_FMX.CopyTo( const Bitmap_:TBitmap );
var
   B :TBitmapData;
   X :Integer;
begin
     with _Imager do
     begin
          Bitmap_.SetSize( CountX, CountY );

          Data.Map;

          Bitmap_.Map( TMapAccess.Write, B );

          for X := 0 to CountX-1 do
          begin
               B.SetPixel( X, 0, TAlphaColor( TByteRGBA( Data[ X ] ) ) );
          end;

          Bitmap_.Unmap( B );

          Data.Unmap;
     end;
end;

procedure TVkStream1DxRGBAxSFlo32_FMX.CopyFrom( const Bitmap_:TBitmap );
var
   B :TBitmapData;
   X :Integer;
begin
     with _Imager do
     begin
          CountX := Bitmap_.Width;

          Bitmap_.Map( TMapAccess.Read, B );

          Data.Map;

          for X := 0 to CountX-1 do
          begin
               Data[ X ] := B.GetPixel( X, 0 );
          end;

          Data.Unmap;

          Bitmap_.Unmap( B );
     end;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

end. //######################################################################### ■
