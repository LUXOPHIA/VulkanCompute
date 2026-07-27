unit LUX.Vulkan.core;

interface //#################################################################### ■

uses System.SysUtils,
     vk_platform, vulkan_core,
     LUX.Code.C;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkMapMode

     TVkMapMode  = ( Read, Write );          // マップの用途
     TVkMapModes = set of TVkMapMode;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkNames

     // 文字列の配列を C の char* の配列（ppEnabled*Names など）として渡すための保持箱。
     // 変換した AnsiString を内部に保持するため、Vulkan の呼び出しが終わるまで
     // このレコードを生存させておく必要がある。
     TVkNames = record
     private
       _Datas :TArray<AnsiString>;  // 変換後の文字列の実体（Ptrs の指す先）
       _Ptrs  :TArray<P_char>;
       ///// A C C E S S O R
       function GetCount :T_uint32_t;
       function GetPtrs :PP_char;
     public
       constructor Create( const Names_:TArray<String> );
       ///// P R O P E R T Y
       property Count :T_uint32_t read GetCount;
       property Ptrs  :PP_char    read GetPtrs ;  // 要素が無ければ nil
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkVersion

     TVkVersion = record
     private
     public
       Value :T_uint32_t;
       /////
       constructor Create( const Value_:T_uint32_t );
       ///// M E T H O D
       function Major :Integer;
       function Minor :Integer;
       function Patch :Integer;
       function ToString :String;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EVkError

     EVkError = class( Exception )
     private
       _Code :T_VkResult;
     public
       constructor Create( const Code_:T_VkResult; const Comment_:String = '' );
       ///// P R O P E R T Y
       property Code :T_VkResult read _Code;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C O N S T A N T 】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 V A R I A B L E 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

function ErrorToMessage( const Error_:T_VkResult ) :String;

procedure CheckVk( const Error_:T_VkResult; const Comment_:String = '' );

// 固定長の char 配列（deviceName / extensionName など）を String へ変換する
function VkTextOf( const Chars_:P_char ) :String;

// Names_ のうち Availa_ に在るものだけを、Names_ の順序で返す（重複は除く）
function VkNameFilter( const Names_,Availa_:TArray<String> ) :TArray<String>;

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkNames

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkNames.GetCount :T_uint32_t;
begin
     Result := Length( _Ptrs );
end;

function TVkNames.GetPtrs :PP_char;
begin
     if Length( _Ptrs ) = 0 then Result := nil
                            else Result := @_Ptrs[ 0 ];
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkNames.Create( const Names_:TArray<String> );
var
   I :Integer;
begin
     SetLength( _Datas, Length( Names_ ) );
     SetLength( _Ptrs , Length( Names_ ) );

     for I := 0 to High( Names_ ) do
     begin
          _Datas[ I ] := AnsiString( Names_[ I ] );

          _Ptrs[ I ] := P_char( _Datas[ I ] );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkVersion

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkVersion.Create( const Value_:T_uint32_t );
begin
     Value := Value_;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

function TVkVersion.Major :Integer;
begin
     Result := ( Value shr 22 ) and $7F;
end;

function TVkVersion.Minor :Integer;
begin
     Result := ( Value shr 12 ) and $3FF;
end;

function TVkVersion.Patch :Integer;
begin
     Result := Value and $FFF;
end;

function TVkVersion.ToString :String;
begin
     Result := Major.ToString + '.' + Minor.ToString + '.' + Patch.ToString;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EVkError

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor EVkError.Create( const Code_:T_VkResult; const Comment_:String );
begin
     _Code := Code_;

     inherited Create( '【' + ErrorToMessage( Code_ ) + '】' + Comment_ );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

function ErrorToMessage( const Error_:T_VkResult ) :String;
begin
     case Error_ of
       VK_SUCCESS                                            : Result := 'SUCCESS';
       VK_NOT_READY                                          : Result := 'NOT_READY';
       VK_TIMEOUT                                            : Result := 'TIMEOUT';
       VK_EVENT_SET                                          : Result := 'EVENT_SET';
       VK_EVENT_RESET                                        : Result := 'EVENT_RESET';
       VK_INCOMPLETE                                         : Result := 'INCOMPLETE';
       VK_ERROR_OUT_OF_HOST_MEMORY                           : Result := 'ERROR_OUT_OF_HOST_MEMORY';
       VK_ERROR_OUT_OF_DEVICE_MEMORY                         : Result := 'ERROR_OUT_OF_DEVICE_MEMORY';
       VK_ERROR_INITIALIZATION_FAILED                        : Result := 'ERROR_INITIALIZATION_FAILED';
       VK_ERROR_DEVICE_LOST                                  : Result := 'ERROR_DEVICE_LOST';
       VK_ERROR_MEMORY_MAP_FAILED                            : Result := 'ERROR_MEMORY_MAP_FAILED';
       VK_ERROR_LAYER_NOT_PRESENT                            : Result := 'ERROR_LAYER_NOT_PRESENT';
       VK_ERROR_EXTENSION_NOT_PRESENT                        : Result := 'ERROR_EXTENSION_NOT_PRESENT';
       VK_ERROR_FEATURE_NOT_PRESENT                          : Result := 'ERROR_FEATURE_NOT_PRESENT';
       VK_ERROR_INCOMPATIBLE_DRIVER                          : Result := 'ERROR_INCOMPATIBLE_DRIVER';
       VK_ERROR_TOO_MANY_OBJECTS                             : Result := 'ERROR_TOO_MANY_OBJECTS';
       VK_ERROR_FORMAT_NOT_SUPPORTED                         : Result := 'ERROR_FORMAT_NOT_SUPPORTED';
       VK_ERROR_FRAGMENTED_POOL                              : Result := 'ERROR_FRAGMENTED_POOL';
       VK_ERROR_UNKNOWN                                      : Result := 'ERROR_UNKNOWN';
       VK_ERROR_OUT_OF_POOL_MEMORY                           : Result := 'ERROR_OUT_OF_POOL_MEMORY';
       VK_ERROR_INVALID_EXTERNAL_HANDLE                      : Result := 'ERROR_INVALID_EXTERNAL_HANDLE';
       VK_ERROR_FRAGMENTATION                                : Result := 'ERROR_FRAGMENTATION';
       VK_ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS               : Result := 'ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS';
       VK_PIPELINE_COMPILE_REQUIRED                          : Result := 'PIPELINE_COMPILE_REQUIRED';
       VK_ERROR_SURFACE_LOST_KHR                             : Result := 'ERROR_SURFACE_LOST_KHR';
       VK_ERROR_NATIVE_WINDOW_IN_USE_KHR                     : Result := 'ERROR_NATIVE_WINDOW_IN_USE_KHR';
       VK_SUBOPTIMAL_KHR                                     : Result := 'SUBOPTIMAL_KHR';
       VK_ERROR_OUT_OF_DATE_KHR                              : Result := 'ERROR_OUT_OF_DATE_KHR';
     else                                                      Result := 'UNKNOWN:' + Error_.ToString;
     end;
end;

procedure CheckVk( const Error_:T_VkResult; const Comment_:String = '' );
begin
     if Error_ <> VK_SUCCESS then raise EVkError.Create( Error_, Comment_ );
end;

//------------------------------------------------------------------------------

function VkTextOf( const Chars_:P_char ) :String;
begin
     Result := String( AnsiString( Chars_ ) );
end;

function VkNameFilter( const Names_,Availa_:TArray<String> ) :TArray<String>;
   //////////  Vulkan の拡張名は大文字小文字を区別する厳密一致
   function Has( const Name_:String; const Names_:TArray<String> ) :Boolean;
   var
      N :String;
   begin
        for N in Names_ do if N = Name_ then Exit( True );

        Result := False;
   end;
   //////////
var
   N :String;
begin
     Result := nil;

     for N in Names_ do
     begin
          if Has( N, Availa_ ) and not Has( N, Result ) then Result := Result + [ N ];
     end;
end;

end. //######################################################################### ■
