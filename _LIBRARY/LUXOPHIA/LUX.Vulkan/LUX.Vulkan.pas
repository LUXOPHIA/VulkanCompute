unit LUX.Vulkan;

interface //#################################################################### ■

uses System.Classes,
     LUX.Vulkan.core,
     LUX.Vulkan.Show,
     LUX.Vulkan.Device,
     LUX.Vulkan.Contex,
     LUX.Vulkan.Queuer,
     LUX.Vulkan.Argume,
     LUX.Vulkan.Argume.Samplr,
     LUX.Vulkan.Argume.Memory,
     LUX.Vulkan.Argume.Memory.Buffer,
     LUX.Vulkan.Argume.Memory.Imager,
     LUX.Vulkan.Argume.Memory.Imager.D1,
     LUX.Vulkan.Argume.Memory.Imager.D2,
     LUX.Vulkan.Argume.Memory.Imager.D3,
     LUX.Vulkan.Shader,
     LUX.Vulkan.Kernel;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     TVulkan                     = class;

     TVkSystem                   = class;
       TVkDevices                = TVkDevices<TVkSystem>;
         TVkDevice               = TVkDevice <TVkSystem>;
           TVkContexs            = TVkContexs<TVkSystem,TVkDevice>;
             TVkContex           = TVkContex <TVkSystem,TVkDevice>;
               TVkQueuers        = TVkQueuers<TVkSystem,TVkDevice,TVkContex>;
                 TVkQueuer       = TVkQueuer <TVkSystem,TVkDevice,TVkContex>;
               TVkArgumes        = TVkArgumes<TVkSystem,TVkDevice,TVkContex>;
                 TVkArgume       = TVkArgume <TVkSystem,TVkDevice,TVkContex>;
                 TVkSamplr       = TVkSamplr <TVkSystem,TVkDevice,TVkContex>;
                 TVkMemory       = TVkMemory <TVkSystem,TVkDevice,TVkContex>;
               TVkShaders        = TVkShaders<TVkSystem,TVkDevice,TVkContex>;
                 TVkShader       = TVkShader <TVkSystem,TVkDevice,TVkContex>;
                   TVkKernels    = TVkKernels<TVkSystem,TVkDevice,TVkContex,TVkShader>;
                     TVkKernel   = TVkKernel <TVkSystem,TVkDevice,TVkContex,TVkShader>;
                       TVkParames = TVkParames<TVkSystem,TVkDevice,TVkContex,TVkShader>;
                         TVkParame = TVkParame <TVkSystem,TVkDevice,TVkContex,TVkShader>;

     TVkBinding = LUX.Vulkan.Shader.TVkBinding;

     TVkBuffer<TValue_:record> = class( TVkBuffer<TVkSystem,TVkDevice,TVkContex,TValue_> );

     TVkImager1DxBGRAxUInt8  = TVkImager1DxBGRAxUInt8 <TVkSystem,TVkDevice,TVkContex>;
     TVkImager1DxBGRAxUFix8  = TVkImager1DxBGRAxUFix8 <TVkSystem,TVkDevice,TVkContex>;
     TVkImager1DxRGBAxUInt32 = TVkImager1DxRGBAxUInt32<TVkSystem,TVkDevice,TVkContex>;
     TVkImager1DxRGBAxSFlo32 = TVkImager1DxRGBAxSFlo32<TVkSystem,TVkDevice,TVkContex>;

     TVkImager2DxBGRAxUInt8  = TVkImager2DxBGRAxUInt8 <TVkSystem,TVkDevice,TVkContex>;
     TVkImager2DxBGRAxUFix8  = TVkImager2DxBGRAxUFix8 <TVkSystem,TVkDevice,TVkContex>;
     TVkImager2DxRGBAxUInt32 = TVkImager2DxRGBAxUInt32<TVkSystem,TVkDevice,TVkContex>;
     TVkImager2DxRGBAxSFlo32 = TVkImager2DxRGBAxSFlo32<TVkSystem,TVkDevice,TVkContex>;

     TVkImager3DxBGRAxUInt8  = TVkImager3DxBGRAxUInt8 <TVkSystem,TVkDevice,TVkContex>;
     TVkImager3DxBGRAxUFix8  = TVkImager3DxBGRAxUFix8 <TVkSystem,TVkDevice,TVkContex>;
     TVkImager3DxRGBAxUInt32 = TVkImager3DxRGBAxUInt32<TVkSystem,TVkDevice,TVkContex>;
     TVkImager3DxRGBAxSFlo32 = TVkImager3DxRGBAxSFlo32<TVkSystem,TVkDevice,TVkContex>;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkSystem

     TVkSystem = class
     private
     protected
       _Devices :TVkDevices;
       ///// A C C E S S O R
       function GetDevices :TVkDevices;
     public
       constructor Create;
       destructor Destroy; override;
       ///// P R O P E R T Y
       property Devices :TVkDevices read GetDevices;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVulkan

     TVulkan = class
     private
       class var _System :TVkSystem;
     protected
       ///// A C C E S S O R
       class function GetAvailable :Boolean; static;
       class function GetDevices :TVkDevices; static;
     public
       class constructor Create;
       class destructor Destroy;
       ///// P R O P E R T Y
       class property Available :Boolean     read GetAvailable;
       class property Devices   :TVkDevices  read GetDevices  ;
       ///// M E T H O D
       class procedure Show( const Strings_:TStrings );
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C O N S T A N T 】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 V A R I A B L E 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

implementation //############################################################### ■

uses vulkan_functions;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkSystem

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkSystem.GetDevices :TVkDevices;
begin
     Result := _Devices;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkSystem.Create;
begin
     inherited;

     _Devices := TVkDevices.Create( Self );
end;

destructor TVkSystem.Destroy;
begin
     _Devices.Free;

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVulkan

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

class function TVulkan.GetAvailable :Boolean;
begin
     Result := LoadFunctions;
end;

class function TVulkan.GetDevices :TVkDevices;
begin
     Result := _System.Devices;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

class constructor TVulkan.Create;
begin
     LoadFunctions;

     _System := TVkSystem.Create;
end;

class destructor TVulkan.Destroy;
begin
     _System.Free;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

class procedure TVulkan.Show( const Strings_:TStrings );
begin
     ShowSystem( Strings_ );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

end. //######################################################################### ■
