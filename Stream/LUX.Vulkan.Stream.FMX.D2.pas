unit LUX.Vulkan.Stream.FMX.D2;

interface //#################################################################### ■

uses System.UITypes,
     FMX.Graphics,
     LUX.Color,
     LUX.Vulkan,
     LUX.Vulkan.Stream.FMX.D1;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     TVkStream2D_FMX<TVkImager_:class> = class;
       TVkStream2DxBGRAxUInt8_FMX      = class;
       TVkStream2DxBGRAxUFix8_FMX      = class;
       TVkStream2DxRGBAxUInt32_FMX     = class;
       TVkStream2DxRGBAxSFlo32_FMX     = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkStream2D_FMX<TVkImager_>

     IVkStream2D_FMX<TVkImager_:class> = interface( IVkStream1D_FMX<TVkImager_> )
     ['{2B4D9A63-64C8-4F0B-B5E2-97A1D5C40D02}']
     {protected}
     {public}
     end;

     TVkStream2D_FMX<TVkImager_:class> = class( TVkStream1D_FMX<TVkImager_>, IVkStream2D_FMX<TVkImager_> )
     private
     protected
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkStream2DxBGRAxUInt8_FMX

     IVkStream2DxBGRAxUInt8_FMX = IVkStream2D_FMX<TVkImager2DxBGRAxUInt8>;

     TVkStream2DxBGRAxUInt8_FMX = class( TVkStream2D_FMX<TVkImager2DxBGRAxUInt8>, IVkStream2DxBGRAxUInt8_FMX )
     private
     protected
     public
       ///// M E T H O D
       procedure CopyTo( const Bitmap_:TBitmap ); override;
       procedure CopyFrom( const Bitmap_:TBitmap ); override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkStream2DxBGRAxUFix8_FMX

     IVkStream2DxBGRAxUFix8_FMX = IVkStream2D_FMX<TVkImager2DxBGRAxUFix8>;

     TVkStream2DxBGRAxUFix8_FMX = class( TVkStream2D_FMX<TVkImager2DxBGRAxUFix8>, IVkStream2DxBGRAxUFix8_FMX )
     private
     protected
     public
       ///// M E T H O D
       procedure CopyTo( const Bitmap_:TBitmap ); override;
       procedure CopyFrom( const Bitmap_:TBitmap ); override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkStream2DxRGBAxUInt32_FMX

     IVkStream2DxRGBAxUInt32_FMX = IVkStream2D_FMX<TVkImager2DxRGBAxUInt32>;

     TVkStream2DxRGBAxUInt32_FMX = class( TVkStream2D_FMX<TVkImager2DxRGBAxUInt32>, IVkStream2DxRGBAxUInt32_FMX )
     private
     protected
     public
       ///// M E T H O D
       procedure CopyTo( const Bitmap_:TBitmap ); override;
       procedure CopyFrom( const Bitmap_:TBitmap ); override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkStream2DxRGBAxSFlo32_FMX

     IVkStream2DxRGBAxSFlo32_FMX = IVkStream2D_FMX<TVkImager2DxRGBAxSFlo32>;

     TVkStream2DxRGBAxSFlo32_FMX = class( TVkStream2D_FMX<TVkImager2DxRGBAxSFlo32>, IVkStream2DxRGBAxSFlo32_FMX )
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

uses System.Threading;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkStream2D_FMX<TVkImager_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkStream2DxBGRAxUInt8_FMX

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkStream2DxBGRAxUInt8_FMX.CopyTo( const Bitmap_:TBitmap );
var
   B :TBitmapData;
begin
     with _Imager do
     begin
          Bitmap_.SetSize( CountX, CountY );

          Data.Map;

          Bitmap_.Map( TMapAccess.Write, B );

          TParallel.For( 0, CountY-1, procedure( Y:Integer )
          begin
               Move( Data.ValueP[ 0, Y ]^,
                     B.GetScanline( Y )^,
                     B.BytesPerLine );
          end );

          Bitmap_.Unmap( B );

          Data.Unmap;
     end;
end;

procedure TVkStream2DxBGRAxUInt8_FMX.CopyFrom( const Bitmap_:TBitmap );
var
   B :TBitmapData;
begin
     with _Imager do
     begin
          CountX := Bitmap_.Width ;
          CountY := Bitmap_.Height;

          Bitmap_.Map( TMapAccess.Read, B );

          Data.Map;

          TParallel.For( 0, CountY-1, procedure( Y:Integer )
          begin
               Move( B.GetScanline( Y )^,
                     Data.ValueP[ 0, Y ]^,
                     B.BytesPerLine );
          end );

          Data.Unmap;

          Bitmap_.Unmap( B );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkStream2DxBGRAxUFix8_FMX

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkStream2DxBGRAxUFix8_FMX.CopyTo( const Bitmap_:TBitmap );
var
   B :TBitmapData;
begin
     with _Imager do
     begin
          Bitmap_.SetSize( CountX, CountY );

          Data.Map;

          Bitmap_.Map( TMapAccess.Write, B );

          TParallel.For( 0, CountY-1, procedure( Y:Integer )
          begin
               Move( Data.ValueP[ 0, Y ]^,
                     B.GetScanline( Y )^,
                     B.BytesPerLine );
          end );

          Bitmap_.Unmap( B );

          Data.Unmap;
     end;
end;

procedure TVkStream2DxBGRAxUFix8_FMX.CopyFrom( const Bitmap_:TBitmap );
var
   B :TBitmapData;
begin
     with _Imager do
     begin
          CountX := Bitmap_.Width ;
          CountY := Bitmap_.Height;

          Bitmap_.Map( TMapAccess.Read, B );

          Data.Map;

          TParallel.For( 0, CountY-1, procedure( Y:Integer )
          begin
               Move( B.GetScanline( Y )^,
                     Data.ValueP[ 0, Y ]^,
                     B.BytesPerLine );
          end );

          Data.Unmap;

          Bitmap_.Unmap( B );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkStream2DxRGBAxUInt32_FMX

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkStream2DxRGBAxUInt32_FMX.CopyTo( const Bitmap_:TBitmap );
var
   B :TBitmapData;
begin
     with _Imager do
     begin
          Bitmap_.SetSize( CountX, CountY );

          Data.Map;

          Bitmap_.Map( TMapAccess.Write, B );

          TParallel.For( 0, CountY-1, procedure( Y:Integer )
          var
             X :Integer;
          begin
               for X := 0 to CountX-1 do
               begin
                    B.SetPixel( X, Y, TByteRGBA( Data[ X, Y ] ) );
               end;
          end );

          Bitmap_.Unmap( B );

          Data.Unmap;
     end;
end;

procedure TVkStream2DxRGBAxUInt32_FMX.CopyFrom( const Bitmap_:TBitmap );
var
   B :TBitmapData;
begin
     with _Imager do
     begin
          CountX := Bitmap_.Width ;
          CountY := Bitmap_.Height;

          Bitmap_.Map( TMapAccess.Read, B );

          Data.Map;

          TParallel.For( 0, CountY-1, procedure( Y:Integer )
          var
             X :Integer;
          begin
               for X := 0 to CountX-1 do
               begin
                    Data[ X, Y ] := B.GetPixel( X, Y );
               end;
          end );

          Data.Unmap;

          Bitmap_.Unmap( B );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkStream2DxRGBAxSFlo32_FMX

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkStream2DxRGBAxSFlo32_FMX.CopyTo( const Bitmap_:TBitmap );
var
   B :TBitmapData;
begin
     with _Imager do
     begin
          Bitmap_.SetSize( CountX, CountY );

          Data.Map;

          Bitmap_.Map( TMapAccess.Write, B );

          TParallel.For( 0, CountY-1, procedure( Y:Integer )
          var
             X :Integer;
          begin
               for X := 0 to CountX-1 do
               begin
                    B.SetPixel( X, Y, TByteRGBA( Data[ X, Y ] ) );
               end;
          end );

          Bitmap_.Unmap( B );

          Data.Unmap;
     end;
end;

procedure TVkStream2DxRGBAxSFlo32_FMX.CopyFrom( const Bitmap_:TBitmap );
var
   B :TBitmapData;
begin
     with _Imager do
     begin
          CountX := Bitmap_.Width ;
          CountY := Bitmap_.Height;

          Bitmap_.Map( TMapAccess.Read, B );

          Data.Map;

          TParallel.For( 0, CountY-1, procedure( Y:Integer )
          var
             X :Integer;
          begin
               for X := 0 to CountX-1 do
               begin
                    Data[ X, Y ] := B.GetPixel( X, Y );
               end;
          end );

          Data.Unmap;

          Bitmap_.Unmap( B );
     end;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

end. //######################################################################### ■
