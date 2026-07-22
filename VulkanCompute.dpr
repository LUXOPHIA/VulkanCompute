program VulkanCompute;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {Form1},
  LUX in '_LIBRARY\LUXOPHIA\LUX\LUX.pas',
  LUX.Code.C in '_LIBRARY\LUXOPHIA\LUX\Code\LUX.Code.C.pas',
  LUX.Data.List.core in '_LIBRARY\LUXOPHIA\LUX\Data\List\LUX.Data.List.core.pas',
  LUX.Data.List in '_LIBRARY\LUXOPHIA\LUX\Data\List\LUX.Data.List.pas',
  LUX.Color in '_LIBRARY\LUXOPHIA\LUX\Color\LUX.Color.pas',
  LUX.Complex in '_LIBRARY\LUXOPHIA\LUX\Complex\LUX.Complex.pas',
  LUX.D1 in '_LIBRARY\LUXOPHIA\LUX\LUX.D1.pas',
  LUX.D2 in '_LIBRARY\LUXOPHIA\LUX\LUX.D2.pas',
  LUX.D3 in '_LIBRARY\LUXOPHIA\LUX\LUX.D3.pas',
  LUX.D4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D4.pas',
  glslang_c_shader_types in '_LIBRARY\LUXOPHIA\LUX.Vulkan\Glslang\glslang_c_shader_types.pas',
  glslang_c_interface in '_LIBRARY\LUXOPHIA\LUX.Vulkan\Glslang\glslang_c_interface.pas',
  glslang_functions in '_LIBRARY\LUXOPHIA\LUX.Vulkan\Glslang\glslang_functions.pas',
  vk_platform in '_LIBRARY\LUXOPHIA\LUX.Vulkan\Vulkan\vk_platform.pas',
  vulkan_core in '_LIBRARY\LUXOPHIA\LUX.Vulkan\Vulkan\vulkan_core.pas',
  vulkan_win32 in '_LIBRARY\LUXOPHIA\LUX.Vulkan\Vulkan\vulkan_win32.pas',
  vulkan_functions in '_LIBRARY\LUXOPHIA\LUX.Vulkan\Vulkan\vulkan_functions.pas',
  LUX.Vulkan.core in '_LIBRARY\LUXOPHIA\LUX.Vulkan\Core\LUX.Vulkan.core.pas',
  LUX.Vulkan.Device in '_LIBRARY\LUXOPHIA\LUX.Vulkan\Core\LUX.Vulkan.Device.pas',
  LUX.Vulkan.Contex in '_LIBRARY\LUXOPHIA\LUX.Vulkan\Core\LUX.Vulkan.Contex.pas',
  LUX.Vulkan.Queuer in '_LIBRARY\LUXOPHIA\LUX.Vulkan\Core\LUX.Vulkan.Queuer.pas',
  LUX.Vulkan.Argume in '_LIBRARY\LUXOPHIA\LUX.Vulkan\Core\LUX.Vulkan.Argume.pas',
  LUX.Vulkan.Argume.Samplr in '_LIBRARY\LUXOPHIA\LUX.Vulkan\Core\LUX.Vulkan.Argume.Samplr.pas',
  LUX.Vulkan.Argume.Memory in '_LIBRARY\LUXOPHIA\LUX.Vulkan\Core\LUX.Vulkan.Argume.Memory.pas',
  LUX.Vulkan.Argume.Memory.Buffer in '_LIBRARY\LUXOPHIA\LUX.Vulkan\Core\LUX.Vulkan.Argume.Memory.Buffer.pas',
  LUX.Vulkan.Argume.Memory.Imager in '_LIBRARY\LUXOPHIA\LUX.Vulkan\Core\LUX.Vulkan.Argume.Memory.Imager.pas',
  LUX.Vulkan.Argume.Memory.Imager.D1 in '_LIBRARY\LUXOPHIA\LUX.Vulkan\Core\LUX.Vulkan.Argume.Memory.Imager.D1.pas',
  LUX.Vulkan.Argume.Memory.Imager.D2 in '_LIBRARY\LUXOPHIA\LUX.Vulkan\Core\LUX.Vulkan.Argume.Memory.Imager.D2.pas',
  LUX.Vulkan.Argume.Memory.Imager.D3 in '_LIBRARY\LUXOPHIA\LUX.Vulkan\Core\LUX.Vulkan.Argume.Memory.Imager.D3.pas',
  LUX.Vulkan.Shader in '_LIBRARY\LUXOPHIA\LUX.Vulkan\Core\LUX.Vulkan.Shader.pas',
  LUX.Vulkan.Kernel in '_LIBRARY\LUXOPHIA\LUX.Vulkan\Core\LUX.Vulkan.Kernel.pas',
  LUX.Vulkan.Show in '_LIBRARY\LUXOPHIA\LUX.Vulkan\Core\LUX.Vulkan.Show.pas',
  LUX.Vulkan in '_LIBRARY\LUXOPHIA\LUX.Vulkan\LUX.Vulkan.pas',
  LUX.Vulkan.Stream.FMX.D1 in '_LIBRARY\LUXOPHIA\LUX.Vulkan\Stream\LUX.Vulkan.Stream.FMX.D1.pas',
  LUX.Vulkan.Stream.FMX.D2 in '_LIBRARY\LUXOPHIA\LUX.Vulkan\Stream\LUX.Vulkan.Stream.FMX.D2.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
