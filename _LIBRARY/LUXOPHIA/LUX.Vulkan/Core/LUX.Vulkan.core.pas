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

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

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

end. //######################################################################### ■
