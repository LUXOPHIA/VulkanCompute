unit LUX.Vulkan.Show;

interface //#################################################################### ■

uses System.Classes,
     vk_platform, vulkan_core,
     LUX.Code.C,
     LUX.Vulkan.core;

//type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C O N S T A N T 】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 V A R I A B L E 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

function DeviceTypeToString( const Type_:T_VkPhysicalDeviceType ) :String;

function QueueFlagsToString( const Flags_:T_VkQueueFlags ) :String;

function DescriTypToString( const Type_:T_VkDescriptorType ) :String;

procedure ShowSystem( const Strings_:TStrings );

implementation //############################################################### ■

uses System.SysUtils,
     LUX.Vulkan.Shader,
     LUX.Vulkan;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

function DeviceTypeToString( const Type_:T_VkPhysicalDeviceType ) :String;
begin
     case Type_ of
       VK_PHYSICAL_DEVICE_TYPE_OTHER          : Result := 'OTHER';
       VK_PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU : Result := 'INTEGRATED_GPU';
       VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU   : Result := 'DISCRETE_GPU';
       VK_PHYSICAL_DEVICE_TYPE_VIRTUAL_GPU    : Result := 'VIRTUAL_GPU';
       VK_PHYSICAL_DEVICE_TYPE_CPU            : Result := 'CPU';
     else                                       Result := 'UNKNOWN:' + Type_.ToString;
     end;
end;

function QueueFlagsToString( const Flags_:T_VkQueueFlags ) :String;
begin
     Result := '';

     if Flags_ and VK_QUEUE_GRAPHICS_BIT        <> 0 then Result := Result + '|GRAPHICS';
     if Flags_ and VK_QUEUE_COMPUTE_BIT         <> 0 then Result := Result + '|COMPUTE';
     if Flags_ and VK_QUEUE_TRANSFER_BIT        <> 0 then Result := Result + '|TRANSFER';
     if Flags_ and VK_QUEUE_SPARSE_BINDING_BIT  <> 0 then Result := Result + '|SPARSE_BINDING';
     if Flags_ and VK_QUEUE_PROTECTED_BIT       <> 0 then Result := Result + '|PROTECTED';

     Result := Result.TrimLeft( ['|'] );
end;

function DescriTypToString( const Type_:T_VkDescriptorType ) :String;
begin
     case Type_ of
       VK_DESCRIPTOR_TYPE_SAMPLER                : Result := 'SAMPLER';
       VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER : Result := 'COMBINED_IMAGE_SAMPLER';
       VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE          : Result := 'SAMPLED_IMAGE';
       VK_DESCRIPTOR_TYPE_STORAGE_IMAGE          : Result := 'STORAGE_IMAGE';
       VK_DESCRIPTOR_TYPE_UNIFORM_TEXEL_BUFFER   : Result := 'UNIFORM_TEXEL_BUFFER';
       VK_DESCRIPTOR_TYPE_STORAGE_TEXEL_BUFFER   : Result := 'STORAGE_TEXEL_BUFFER';
       VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER         : Result := 'UNIFORM_BUFFER';
       VK_DESCRIPTOR_TYPE_STORAGE_BUFFER         : Result := 'STORAGE_BUFFER';
       VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC : Result := 'UNIFORM_BUFFER_DYNAMIC';
       VK_DESCRIPTOR_TYPE_STORAGE_BUFFER_DYNAMIC : Result := 'STORAGE_BUFFER_DYNAMIC';
       VK_DESCRIPTOR_TYPE_INPUT_ATTACHMENT       : Result := 'INPUT_ATTACHMENT';
     else                                          Result := 'UNKNOWN:' + Type_.ToString;
     end;
end;

//------------------------------------------------------------------------------

procedure ShowParames( const Strings_:TStrings; const Parames_:TVkParames );
var
   A :TVkParame;
begin
     with Strings_ do
     begin
          Add( ' ┃　│　┃　│　┃　│　┃　│' );
          Add( ' ┃　│　┃　│　┃　│　┃　┝ Parames(' + Parames_.Count.ToString + ') :TVkParames' );
          for A in Parames_ do
          begin
               Add( ' ┃　│　┃　│　┃　│　┃　│　┃' );
               Add( ' ┃　│　┃　│　┃　│　┃　│　┣・Parame[' + A.Order.ToString + '] :TVkParame' );
               Add( ' ┃　│　┃　│　┃　│　┃　│　┃　├ Name      = ' + A.Name );
               Add( ' ┃　│　┃　│　┃　│　┃　│　┃　├ BindingI  = ' + A.BindingI.ToString );
               Add( ' ┃　│　┃　│　┃　│　┃　│　┃　├ DescriTyp = ' + DescriTypToString( A.DescriTyp ) );
          end;
     end;
end;

procedure ShowKernels( const Strings_:TStrings; const Kernels_:TVkKernels );
var
   K :TVkKernel;
begin
     with Strings_ do
     begin
          Add( ' ┃　│　┃　│　┃　│' );
          Add( ' ┃　│　┃　│　┃　┝ Kernels(' + Kernels_.Count.ToString + ') :TVkKernels' );
          for K in Kernels_ do
          begin
               Add( ' ┃　│　┃　│　┃　│　┃' );
               Add( ' ┃　│　┃　│　┃　│　┣・Kernel[' + K.Order.ToString + '] :TVkKernel' );
               Add( ' ┃　│　┃　│　┃　│　┃　├ Name    = ' + K.Name );
               Add( ' ┃　│　┃　│　┃　│　┃　├ GloDimN = ' + K.GloDimN.ToString );

               ShowParames( Strings_, K.Parames );
          end;
     end;
end;

procedure ShowShaders( const Strings_:TStrings; const Shaders_:TVkShaders );
var
   S :TVkShader;
   B :TVkBinding;
   E :String;
begin
     with Strings_ do
     begin
          Add( ' ┃　│　┃　│' );
          Add( ' ┃　│　┃　┝ Shaders(' + Shaders_.Count.ToString + ') :TVkShaders' );
          for S in Shaders_ do
          begin
               Add( ' ┃　│　┃　│　┃' );
               Add( ' ┃　│　┃　│　┣・Shader[' + S.Order.ToString + '] :TVkShader' );
               Add( ' ┃　│　┃　│　┃　├ Name      = ' + S.Name );
               Add( ' ┃　│　┃　│　┃　├ Binary    = ' + S.Binary.Size.ToString + ' Bytes' );
               Add( ' ┃　│　┃　│　┃　├ LocalSize = ' + S.LocalX.ToString + ' × ' + S.LocalY.ToString + ' × ' + S.LocalZ.ToString );

               for E in S.Entrys
               do Add( ' ┃　│　┃　│　┃　├ Entry     = ' + E );

               for B in S.Bindins
               do Add( ' ┃　│　┃　│　┃　├ Binding[' + B.Binding.ToString + '] = ' + B.Name + ' :' + DescriTypToString( B.DescriTyp ) );

               ShowKernels( Strings_, S.Kernels );
          end;
     end;
end;

procedure ShowArgumes( const Strings_:TStrings; const Argumes_:TVkArgumes );
var
   A :TVkArgume;
begin
     with Strings_ do
     begin
          Add( ' ┃　│　┃　│' );
          Add( ' ┃　│　┃　┝ Argumes(' + Argumes_.Count.ToString + ') :TVkArgumes' );
          for A in Argumes_ do
          begin
               Add( ' ┃　│　┃　│　┃' );
               Add( ' ┃　│　┃　│　┣・Argume[' + A.Order.ToString + '] :TVkArgume' );
               Add( ' ┃　│　┃　│　┃　├ Class = ' + A.ClassName );

               if A is TVkMemory then
               begin
                    Add( ' ┃　│　┃　│　┃　├ Size  = ' + UInt64( TVkMemory( A ).Size ).ToString );
               end;
          end;
     end;
end;

procedure ShowQueuers( const Strings_:TStrings; const Queuers_:TVkQueuers );
var
   Q :TVkQueuer;
begin
     with Strings_ do
     begin
          Add( ' ┃　│　┃　│' );
          Add( ' ┃　│　┃　┝ Queuers(' + Queuers_.Count.ToString + ') :TVkQueuers' );
          for Q in Queuers_ do
          begin
               Add( ' ┃　│　┃　│　┃' );
               Add( ' ┃　│　┃　│　┣・Queuer[' + Q.Order.ToString + '] :TVkQueuer' );
               Add( ' ┃　│　┃　│　┃　├ FamilyI = ' + Q.Contex.FamilyI.ToString );
          end;
     end;
end;

procedure ShowContexs( const Strings_:TStrings; const Contexs_:TVkContexs );
var
   C :TVkContex;
begin
     with Strings_ do
     begin
          Add( ' ┃　│' );
          Add( ' ┃　┝ Contexs(' + Contexs_.Count.ToString + ') :TVkContexs' );
          for C in Contexs_ do
          begin
               Add( ' ┃　│　┃' );
               Add( ' ┃　│　┣・Contex[' + C.Order.ToString + '] :TVkContex' );
               Add( ' ┃　│　┃　├ FamilyI = ' + C.FamilyI.ToString );

               ShowQueuers( Strings_, C.Queuers );
               ShowArgumes( Strings_, C.Argumes );
               ShowShaders( Strings_, C.Shaders );
          end;
     end;
end;

procedure ShowDevices( const Strings_:TStrings; const Devices_:TVkDevices );
var
   D :TVkDevice;
   Fs :TArray<T_VkQueueFamilyProperties>;
   I :Integer;
begin
     with Strings_ do
     begin
          Add( 'Devices(' + Devices_.Count.ToString + ') :TVkDevices' );
          for D in Devices_ do
          begin
               Add( ' ┃' );
               Add( ' ┣・Device[' + D.Order.ToString + '] :TVkDevice' );
               Add( ' ┃　├ DEVICE_NAME    = ' + D.DEVICE_NAME );
               Add( ' ┃　├ DEVICE_TYPE    = ' + DeviceTypeToString( D.DEVICE_TYPE ) );
               Add( ' ┃　├ VENDOR_ID      = $' + IntToHex( D.VENDOR_ID, 4 ) );
               Add( ' ┃　├ DEVICE_ID      = $' + IntToHex( D.DEVICE_ID, 4 ) );
               Add( ' ┃　├ API_VERSION    = ' + D.API_VERSION.ToString );
               Add( ' ┃　├ DRIVER_VERSION = ' + D.DRIVER_VERSION.Value.ToString );

               Fs := D.Familys;

               for I := 0 to Length( Fs )-1 do
               begin
                    Add( ' ┃　├ Family[' + I.ToString + ']      = ' + QueueFlagsToString( Fs[ I ].queueFlags )
                                                                    + ' ×' + Fs[ I ].queueCount.ToString );
               end;

               ShowContexs( Strings_, D.Contexs );
          end;
     end;
end;

procedure ShowSystem( const Strings_:TStrings );
begin
     ShowDevices( Strings_, TVulkan.Devices );

     Strings_.Add( '' );
end;

end. //######################################################################### ■
