unit glslang_functions;

interface //#################################################################### ■

uses glslang_c_shader_types, glslang_c_interface;

const
     {$IF Defined(MSWINDOWS)} DLLNAME = 'glslang.dll';
     {$ELSEIF Defined(MACOS)} DLLNAME = 'libglslang.dylib';
     {$ELSE} DLLNAME = 'libglslang.so';
     {$ENDIF}

var glslang_get_version                        :T_PFN_glslang_get_version                       ;

var glslang_initialize_process                 :T_PFN_glslang_initialize_process                ;

var glslang_finalize_process                   :T_PFN_glslang_finalize_process                  ;

var glslang_default_resource                   :T_PFN_glslang_default_resource                  ;

var glslang_shader_create                      :T_PFN_glslang_shader_create                     ;

var glslang_shader_delete                      :T_PFN_glslang_shader_delete                     ;

var glslang_shader_set_options                 :T_PFN_glslang_shader_set_options                ;

var glslang_shader_set_glsl_version            :T_PFN_glslang_shader_set_glsl_version           ;

var glslang_shader_preprocess                  :T_PFN_glslang_shader_preprocess                 ;

var glslang_shader_parse                       :T_PFN_glslang_shader_parse                      ;

var glslang_shader_get_preprocessed_code       :T_PFN_glslang_shader_get_preprocessed_code      ;

var glslang_shader_get_info_log                :T_PFN_glslang_shader_get_info_log               ;

var glslang_shader_get_info_debug_log          :T_PFN_glslang_shader_get_info_debug_log         ;

var glslang_program_create                     :T_PFN_glslang_program_create                    ;

var glslang_program_delete                     :T_PFN_glslang_program_delete                    ;

var glslang_program_add_shader                 :T_PFN_glslang_program_add_shader                ;

var glslang_program_link                       :T_PFN_glslang_program_link                      ;

var glslang_program_map_io                     :T_PFN_glslang_program_map_io                    ;

var glslang_program_SPIRV_generate             :T_PFN_glslang_program_SPIRV_generate            ;

var glslang_program_SPIRV_generate_with_options:T_PFN_glslang_program_SPIRV_generate_with_options;

var glslang_program_SPIRV_get_size             :T_PFN_glslang_program_SPIRV_get_size            ;

var glslang_program_SPIRV_get                  :T_PFN_glslang_program_SPIRV_get                 ;

var glslang_program_SPIRV_get_ptr              :T_PFN_glslang_program_SPIRV_get_ptr             ;

var glslang_program_SPIRV_get_messages         :T_PFN_glslang_program_SPIRV_get_messages        ;

var glslang_program_get_info_log               :T_PFN_glslang_program_get_info_log              ;

var glslang_program_get_info_debug_log         :T_PFN_glslang_program_get_info_debug_log        ;

function LoadFunctions( const LibName_:String = DLLNAME ) :Boolean;

implementation //############################################################### ■

uses {$IFDEF MSWINDOWS} Winapi.Windows, {$ENDIF} System.SysUtils;

var
   _GlslangLib :HMODULE = 0;

function LoadFunctions( const LibName_:String ) :Boolean;
begin
     if _GlslangLib <> 0 then Exit( True );

     _GlslangLib := SafeLoadLibrary( LibName_ );

     Result := _GlslangLib <> 0;

     if not Result then Exit;

     glslang_get_version                         := GetProcAddress( _GlslangLib, 'glslang_get_version' );
     glslang_initialize_process                  := GetProcAddress( _GlslangLib, 'glslang_initialize_process' );
     glslang_finalize_process                    := GetProcAddress( _GlslangLib, 'glslang_finalize_process' );
     glslang_default_resource                    := GetProcAddress( _GlslangLib, 'glslang_default_resource' );
     glslang_shader_create                       := GetProcAddress( _GlslangLib, 'glslang_shader_create' );
     glslang_shader_delete                       := GetProcAddress( _GlslangLib, 'glslang_shader_delete' );
     glslang_shader_set_options                  := GetProcAddress( _GlslangLib, 'glslang_shader_set_options' );
     glslang_shader_set_glsl_version             := GetProcAddress( _GlslangLib, 'glslang_shader_set_glsl_version' );
     glslang_shader_preprocess                   := GetProcAddress( _GlslangLib, 'glslang_shader_preprocess' );
     glslang_shader_parse                        := GetProcAddress( _GlslangLib, 'glslang_shader_parse' );
     glslang_shader_get_preprocessed_code        := GetProcAddress( _GlslangLib, 'glslang_shader_get_preprocessed_code' );
     glslang_shader_get_info_log                 := GetProcAddress( _GlslangLib, 'glslang_shader_get_info_log' );
     glslang_shader_get_info_debug_log           := GetProcAddress( _GlslangLib, 'glslang_shader_get_info_debug_log' );
     glslang_program_create                      := GetProcAddress( _GlslangLib, 'glslang_program_create' );
     glslang_program_delete                      := GetProcAddress( _GlslangLib, 'glslang_program_delete' );
     glslang_program_add_shader                  := GetProcAddress( _GlslangLib, 'glslang_program_add_shader' );
     glslang_program_link                        := GetProcAddress( _GlslangLib, 'glslang_program_link' );
     glslang_program_map_io                      := GetProcAddress( _GlslangLib, 'glslang_program_map_io' );
     glslang_program_SPIRV_generate              := GetProcAddress( _GlslangLib, 'glslang_program_SPIRV_generate' );
     glslang_program_SPIRV_generate_with_options := GetProcAddress( _GlslangLib, 'glslang_program_SPIRV_generate_with_options' );
     glslang_program_SPIRV_get_size              := GetProcAddress( _GlslangLib, 'glslang_program_SPIRV_get_size' );
     glslang_program_SPIRV_get                   := GetProcAddress( _GlslangLib, 'glslang_program_SPIRV_get' );
     glslang_program_SPIRV_get_ptr               := GetProcAddress( _GlslangLib, 'glslang_program_SPIRV_get_ptr' );
     glslang_program_SPIRV_get_messages          := GetProcAddress( _GlslangLib, 'glslang_program_SPIRV_get_messages' );
     glslang_program_get_info_log                := GetProcAddress( _GlslangLib, 'glslang_program_get_info_log' );
     glslang_program_get_info_debug_log          := GetProcAddress( _GlslangLib, 'glslang_program_get_info_debug_log' );
end;

end. //######################################################################### ■
