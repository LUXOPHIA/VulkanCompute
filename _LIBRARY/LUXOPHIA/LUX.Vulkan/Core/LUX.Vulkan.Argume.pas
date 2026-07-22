unit LUX.Vulkan.Argume;

interface //#################################################################### ■

uses vk_platform, vulkan_core,
     LUX.Data.List,
     LUX.Code.C,
     LUX.Vulkan.core;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 T Y P E 】

     TVkArgumes <TVkSystem_,TVkDevice_,TVkContex_:class> = class;
       TVkArgume<TVkSystem_,TVkDevice_,TVkContex_:class> = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkArgume<TVkSystem_,TVkDevice_,TVkContex_>

     // 記述子へ接続できる実引数の基底クラス。
     // シェーダの反射で得た記述子タイプに応じ、TVkParame.Bind が必要なハンドルを取得する。
     TVkArgume<TVkSystem_,TVkDevice_,TVkContex_:class> = class( TListChildr<TVkContex_,TVkArgumes<TVkSystem_,TVkDevice_,TVkContex_>> )
     private
       type TVkArgumes_ = TVkArgumes<TVkSystem_,TVkDevice_,TVkContex_>;
     protected
       ///// A C C E S S O R
       function GetBuffeH :T_VkBuffer; virtual;
       function GetViewrH :T_VkImageView; virtual;
       function GetSamplH :T_VkSampler; virtual;
     public
       constructor Create; override;
       constructor Create( const Contex_:TVkContex_ ); overload; virtual;
       destructor Destroy; override;
       ///// P R O P E R T Y
       property Contex  :TVkContex_    read GetOwnere;
       property Argumes :TVkArgumes_   read GetParent;
       property BuffeH  :T_VkBuffer    read GetBuffeH;
       property ViewrH  :T_VkImageView read GetViewrH;
       property SamplH  :T_VkSampler   read GetSamplH;
       ///// M E T H O D
       procedure PreRun( const Command_:T_VkCommandBuffer; const DescriTyp_:T_VkDescriptorType ); virtual;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkArgumes<TVkSystem_,TVkDevice_,TVkContex_>

     TVkArgumes<TVkSystem_,TVkDevice_,TVkContex_:class> = class( TListParent<TVkContex_,TVkArgume<TVkSystem_,TVkDevice_,TVkContex_>> )
     private
     protected
     public
       ///// P R O P E R T Y
       property Contex :TVkContex_ read GetOwnere;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C O N S T A N T 】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 V A R I A B L E 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

implementation //############################################################### ■

uses LUX.Vulkan.Contex;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R E C O R D 】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C L A S S 】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkArgume<TVkSystem_,TVkDevice_,TVkContex_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//////////////////////////////////////////////////////////////// A C C E S S O R

function TVkArgume<TVkSystem_,TVkDevice_,TVkContex_>.GetBuffeH :T_VkBuffer;
begin
     Result := Default( T_VkBuffer );
end;

function TVkArgume<TVkSystem_,TVkDevice_,TVkContex_>.GetViewrH :T_VkImageView;
begin
     Result := Default( T_VkImageView );
end;

function TVkArgume<TVkSystem_,TVkDevice_,TVkContex_>.GetSamplH :T_VkSampler;
begin
     Result := Default( T_VkSampler );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVkArgume<TVkSystem_,TVkDevice_,TVkContex_>.Create;
begin
     inherited;

end;

constructor TVkArgume<TVkSystem_,TVkDevice_,TVkContex_>.Create( const Contex_:TVkContex_ );
begin
     inherited Create( TVkContex<TVkSystem_,TVkDevice_>( Contex_ ).Argumes );
end;

destructor TVkArgume<TVkSystem_,TVkDevice_,TVkContex_>.Destroy;
begin

     inherited;
end;

//////////////////////////////////////////////////////////////////// M E T H O D

procedure TVkArgume<TVkSystem_,TVkDevice_,TVkContex_>.PreRun( const Command_:T_VkCommandBuffer; const DescriTyp_:T_VkDescriptorType );
begin

end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVkArgumes<TVkSystem_,TVkDevice_,TVkContex_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 R O U T I N E 】

end. //######################################################################### ■
