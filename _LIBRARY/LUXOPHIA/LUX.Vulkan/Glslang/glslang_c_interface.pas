unit glslang_c_interface;

(*
** Copyright (C) 2019 Google, Inc.
**
** SPDX-License-Identifier: BSD-3-Clause
*)

(* This file is generated from glslang/Include/glslang_c_interface.h *)

interface //#################################################################### ■

uses LUX.Code.C,
     glslang_c_shader_types;

//typedef struct glslang_shader_s glslang_shader_t;
type T_glslang_shader_t = ^T__glslang_shader_t;  T__glslang_shader_t = record end;  P_glslang_shader_t = ^T_glslang_shader_t;

//typedef struct glslang_program_s glslang_program_t;
type T_glslang_program_t = ^T__glslang_program_t;  T__glslang_program_t = record end;  P_glslang_program_t = ^T_glslang_program_t;

//typedef struct glslang_mapper_s glslang_mapper_t;
type T_glslang_mapper_t = ^T__glslang_mapper_t;  T__glslang_mapper_t = record end;  P_glslang_mapper_t = ^T_glslang_mapper_t;

//typedef struct glslang_resolver_s glslang_resolver_t;
type T_glslang_resolver_t = ^T__glslang_resolver_t;  T__glslang_resolver_t = record end;  P_glslang_resolver_t = ^T_glslang_resolver_t;

(* TLimits counterpart *)
type T_glslang_limits_t = record
       non_inductive_for_loops                  :T_bool;
       while_loops                              :T_bool;
       do_while_loops                           :T_bool;
       general_uniform_indexing                 :T_bool;
       general_attribute_matrix_vector_indexing :T_bool;
       general_varying_indexing                 :T_bool;
       general_sampler_indexing                 :T_bool;
       general_variable_indexing                :T_bool;
       general_constant_matrix_vector_indexing  :T_bool;
     end;
     P_glslang_limits_t = ^T_glslang_limits_t;

(* TBuiltInResource counterpart *)
type T_glslang_resource_t = record
       max_lights                                      :T_int;
       max_clip_planes                                 :T_int;
       max_texture_units                               :T_int;
       max_texture_coords                              :T_int;
       max_vertex_attribs                              :T_int;
       max_vertex_uniform_components                   :T_int;
       max_varying_floats                              :T_int;
       max_vertex_texture_image_units                  :T_int;
       max_combined_texture_image_units                :T_int;
       max_texture_image_units                         :T_int;
       max_fragment_uniform_components                 :T_int;
       max_draw_buffers                                :T_int;
       max_vertex_uniform_vectors                      :T_int;
       max_varying_vectors                             :T_int;
       max_fragment_uniform_vectors                    :T_int;
       max_vertex_output_vectors                       :T_int;
       max_fragment_input_vectors                      :T_int;
       min_program_texel_offset                        :T_int;
       max_program_texel_offset                        :T_int;
       max_clip_distances                              :T_int;
       max_compute_work_group_count_x                  :T_int;
       max_compute_work_group_count_y                  :T_int;
       max_compute_work_group_count_z                  :T_int;
       max_compute_work_group_size_x                   :T_int;
       max_compute_work_group_size_y                   :T_int;
       max_compute_work_group_size_z                   :T_int;
       max_compute_uniform_components                  :T_int;
       max_compute_texture_image_units                 :T_int;
       max_compute_image_uniforms                      :T_int;
       max_compute_atomic_counters                     :T_int;
       max_compute_atomic_counter_buffers              :T_int;
       max_varying_components                          :T_int;
       max_vertex_output_components                    :T_int;
       max_geometry_input_components                   :T_int;
       max_geometry_output_components                  :T_int;
       max_fragment_input_components                   :T_int;
       max_image_units                                 :T_int;
       max_combined_image_units_and_fragment_outputs   :T_int;
       max_combined_shader_output_resources            :T_int;
       max_image_samples                               :T_int;
       max_vertex_image_uniforms                       :T_int;
       max_tess_control_image_uniforms                 :T_int;
       max_tess_evaluation_image_uniforms              :T_int;
       max_geometry_image_uniforms                     :T_int;
       max_fragment_image_uniforms                     :T_int;
       max_combined_image_uniforms                     :T_int;
       max_geometry_texture_image_units                :T_int;
       max_geometry_output_vertices                    :T_int;
       max_geometry_total_output_components            :T_int;
       max_geometry_uniform_components                 :T_int;
       max_geometry_varying_components                 :T_int;
       max_tess_control_input_components               :T_int;
       max_tess_control_output_components              :T_int;
       max_tess_control_texture_image_units            :T_int;
       max_tess_control_uniform_components             :T_int;
       max_tess_control_total_output_components        :T_int;
       max_tess_evaluation_input_components            :T_int;
       max_tess_evaluation_output_components           :T_int;
       max_tess_evaluation_texture_image_units         :T_int;
       max_tess_evaluation_uniform_components          :T_int;
       max_tess_patch_components                       :T_int;
       max_patch_vertices                              :T_int;
       max_tess_gen_level                              :T_int;
       max_viewports                                   :T_int;
       max_vertex_atomic_counters                      :T_int;
       max_tess_control_atomic_counters                :T_int;
       max_tess_evaluation_atomic_counters             :T_int;
       max_geometry_atomic_counters                    :T_int;
       max_fragment_atomic_counters                    :T_int;
       max_combined_atomic_counters                    :T_int;
       max_atomic_counter_bindings                     :T_int;
       max_vertex_atomic_counter_buffers               :T_int;
       max_tess_control_atomic_counter_buffers         :T_int;
       max_tess_evaluation_atomic_counter_buffers      :T_int;
       max_geometry_atomic_counter_buffers             :T_int;
       max_fragment_atomic_counter_buffers             :T_int;
       max_combined_atomic_counter_buffers             :T_int;
       max_atomic_counter_buffer_size                  :T_int;
       max_transform_feedback_buffers                  :T_int;
       max_transform_feedback_interleaved_components   :T_int;
       max_cull_distances                              :T_int;
       max_combined_clip_and_cull_distances            :T_int;
       max_samples                                     :T_int;
       max_mesh_output_vertices_nv                     :T_int;
       max_mesh_output_primitives_nv                   :T_int;
       max_mesh_work_group_size_x_nv                   :T_int;
       max_mesh_work_group_size_y_nv                   :T_int;
       max_mesh_work_group_size_z_nv                   :T_int;
       max_task_work_group_size_x_nv                   :T_int;
       max_task_work_group_size_y_nv                   :T_int;
       max_task_work_group_size_z_nv                   :T_int;
       max_mesh_view_count_nv                          :T_int;
       max_mesh_output_vertices_ext                    :T_int;
       max_mesh_output_primitives_ext                  :T_int;
       max_mesh_work_group_size_x_ext                  :T_int;
       max_mesh_work_group_size_y_ext                  :T_int;
       max_mesh_work_group_size_z_ext                  :T_int;
       max_task_work_group_size_x_ext                  :T_int;
       max_task_work_group_size_y_ext                  :T_int;
       max_task_work_group_size_z_ext                  :T_int;
       max_mesh_view_count_ext                         :T_int;
       max_dual_source_draw_buffers_ext                :T_int;
       limits                                          :T_glslang_limits_t;
     end;
     P_glslang_resource_t = ^T_glslang_resource_t;

(* Inclusion result structure allocated by C include_local/include_system callbacks *)
type T_glsl_include_result_t = record
       header_name   :P_char;    (* Header file name or NULL if inclusion failed *)
       header_data   :P_char;    (* Header data or NULL if inclusion failed *)
       header_length :T_size_t;
     end;
     P_glsl_include_result_t = ^T_glsl_include_result_t;

(* Callback for local file inclusion *)
type T_glsl_include_local_func = function( ctx_:P_void; header_name_:P_char; includer_name_:P_char; include_depth_:T_size_t ) :P_glsl_include_result_t; cdecl;

(* Callback for system file inclusion *)
type T_glsl_include_system_func = function( ctx_:P_void; header_name_:P_char; includer_name_:P_char; include_depth_:T_size_t ) :P_glsl_include_result_t; cdecl;

(* Callback for include result destruction *)
type T_glsl_free_include_result_func = function( ctx_:P_void; result_:P_glsl_include_result_t ) :T_int; cdecl;

(* Collection of callbacks for GLSL preprocessor *)
type T_glsl_include_callbacks_t = record
       include_system      :T_glsl_include_system_func;
       include_local       :T_glsl_include_local_func;
       free_include_result :T_glsl_free_include_result_func;
     end;
     P_glsl_include_callbacks_t = ^T_glsl_include_callbacks_t;

type T_glslang_input_t = record
       language                          :T_glslang_source_t;
       stage                             :T_glslang_stage_t;
       client                            :T_glslang_client_t;
       client_version                    :T_glslang_target_client_version_t;
       target_language                   :T_glslang_target_language_t;
       target_language_version           :T_glslang_target_language_version_t;
       code                              :P_char;
       default_version                   :T_int;
       default_profile                   :T_glslang_profile_t;
       force_default_version_and_profile :T_int;
       forward_compatible                :T_int;
       messages                          :T_glslang_messages_t;
       resource                          :P_glslang_resource_t;
       callbacks                         :T_glsl_include_callbacks_t;
       callbacks_ctx                     :P_void;
     end;
     P_glslang_input_t = ^T_glslang_input_t;

(* SpvOptions counterpart *)
type T_glslang_spv_options_t = record
       generate_debug_info                  :T_bool;
       strip_debug_info                     :T_bool;
       disable_optimizer                    :T_bool;
       optimize_size                        :T_bool;
       disassemble                          :T_bool;
       validate                             :T_bool;
       emit_nonsemantic_shader_debug_info   :T_bool;
       emit_nonsemantic_shader_debug_source :T_bool;
       compile_only                         :T_bool;
       optimize_allow_expanded_id_bound     :T_bool;
     end;
     P_glslang_spv_options_t = ^T_glslang_spv_options_t;

type T_glslang_version_t = record
       major  :T_int;
       minor  :T_int;
       patch  :T_int;
       flavor :P_char;
     end;
     P_glslang_version_t = ^T_glslang_version_t;

type
T_PFN_glslang_get_version = procedure( version_:P_glslang_version_t ); cdecl;

type
T_PFN_glslang_initialize_process = function :T_int; cdecl;

type
T_PFN_glslang_finalize_process = procedure; cdecl;

type
T_PFN_glslang_default_resource = function :P_glslang_resource_t; cdecl;

type
T_PFN_glslang_shader_create = function( const input_:P_glslang_input_t ) :T_glslang_shader_t; cdecl;

type
T_PFN_glslang_shader_delete = procedure( shader_:T_glslang_shader_t ); cdecl;

type
T_PFN_glslang_shader_set_options = procedure( shader_:T_glslang_shader_t; options_:T_int ); cdecl;

type
T_PFN_glslang_shader_set_glsl_version = procedure( shader_:T_glslang_shader_t; version_:T_int ); cdecl;

type
T_PFN_glslang_shader_preprocess = function( shader_:T_glslang_shader_t; const input_:P_glslang_input_t ) :T_int; cdecl;

type
T_PFN_glslang_shader_parse = function( shader_:T_glslang_shader_t; const input_:P_glslang_input_t ) :T_int; cdecl;

type
T_PFN_glslang_shader_get_preprocessed_code = function( shader_:T_glslang_shader_t ) :P_char; cdecl;

type
T_PFN_glslang_shader_get_info_log = function( shader_:T_glslang_shader_t ) :P_char; cdecl;

type
T_PFN_glslang_shader_get_info_debug_log = function( shader_:T_glslang_shader_t ) :P_char; cdecl;

type
T_PFN_glslang_program_create = function :T_glslang_program_t; cdecl;

type
T_PFN_glslang_program_delete = procedure( program_:T_glslang_program_t ); cdecl;

type
T_PFN_glslang_program_add_shader = procedure( program_:T_glslang_program_t; shader_:T_glslang_shader_t ); cdecl;

type
T_PFN_glslang_program_link = function( program_:T_glslang_program_t; messages_:T_int ) :T_int; cdecl;

type
T_PFN_glslang_program_map_io = function( program_:T_glslang_program_t ) :T_int; cdecl;

type
T_PFN_glslang_program_SPIRV_generate = procedure( program_:T_glslang_program_t; stage_:T_glslang_stage_t ); cdecl;

type
T_PFN_glslang_program_SPIRV_generate_with_options = procedure( program_:T_glslang_program_t; stage_:T_glslang_stage_t; spv_options_:P_glslang_spv_options_t ); cdecl;

type
T_PFN_glslang_program_SPIRV_get_size = function( program_:T_glslang_program_t ) :T_size_t; cdecl;

type
T_PFN_glslang_program_SPIRV_get = procedure( program_:T_glslang_program_t; out_:P_unsigned_int ); cdecl;

type
T_PFN_glslang_program_SPIRV_get_ptr = function( program_:T_glslang_program_t ) :P_unsigned_int; cdecl;

type
T_PFN_glslang_program_SPIRV_get_messages = function( program_:T_glslang_program_t ) :P_char; cdecl;

type
T_PFN_glslang_program_get_info_log = function( program_:T_glslang_program_t ) :P_char; cdecl;

type
T_PFN_glslang_program_get_info_debug_log = function( program_:T_glslang_program_t ) :P_char; cdecl;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【 C O N S T A N T 】

const // DefaultTBuiltInResource ( glslang/ResourceLimits/ResourceLimits.cpp )
      GLSLANG_DEFAULT_RESOURCE :T_glslang_resource_t = (
        max_lights                                    :32;
        max_clip_planes                               :6;
        max_texture_units                             :32;
        max_texture_coords                            :32;
        max_vertex_attribs                            :64;
        max_vertex_uniform_components                 :4096;
        max_varying_floats                            :64;
        max_vertex_texture_image_units                :32;
        max_combined_texture_image_units              :80;
        max_texture_image_units                       :32;
        max_fragment_uniform_components               :4096;
        max_draw_buffers                              :32;
        max_vertex_uniform_vectors                    :128;
        max_varying_vectors                           :8;
        max_fragment_uniform_vectors                  :16;
        max_vertex_output_vectors                     :16;
        max_fragment_input_vectors                    :15;
        min_program_texel_offset                      :-8;
        max_program_texel_offset                      :7;
        max_clip_distances                            :8;
        max_compute_work_group_count_x                :65535;
        max_compute_work_group_count_y                :65535;
        max_compute_work_group_count_z                :65535;
        max_compute_work_group_size_x                 :1024;
        max_compute_work_group_size_y                 :1024;
        max_compute_work_group_size_z                 :64;
        max_compute_uniform_components                :1024;
        max_compute_texture_image_units               :16;
        max_compute_image_uniforms                    :8;
        max_compute_atomic_counters                   :8;
        max_compute_atomic_counter_buffers            :1;
        max_varying_components                        :60;
        max_vertex_output_components                  :64;
        max_geometry_input_components                 :64;
        max_geometry_output_components                :128;
        max_fragment_input_components                 :128;
        max_image_units                               :8;
        max_combined_image_units_and_fragment_outputs :8;
        max_combined_shader_output_resources          :8;
        max_image_samples                             :0;
        max_vertex_image_uniforms                     :0;
        max_tess_control_image_uniforms               :0;
        max_tess_evaluation_image_uniforms            :0;
        max_geometry_image_uniforms                   :0;
        max_fragment_image_uniforms                   :8;
        max_combined_image_uniforms                   :8;
        max_geometry_texture_image_units              :16;
        max_geometry_output_vertices                  :256;
        max_geometry_total_output_components          :1024;
        max_geometry_uniform_components               :1024;
        max_geometry_varying_components               :64;
        max_tess_control_input_components             :128;
        max_tess_control_output_components            :128;
        max_tess_control_texture_image_units          :16;
        max_tess_control_uniform_components           :1024;
        max_tess_control_total_output_components      :4096;
        max_tess_evaluation_input_components          :128;
        max_tess_evaluation_output_components         :128;
        max_tess_evaluation_texture_image_units       :16;
        max_tess_evaluation_uniform_components        :1024;
        max_tess_patch_components                     :120;
        max_patch_vertices                            :32;
        max_tess_gen_level                            :64;
        max_viewports                                 :16;
        max_vertex_atomic_counters                    :0;
        max_tess_control_atomic_counters              :0;
        max_tess_evaluation_atomic_counters           :0;
        max_geometry_atomic_counters                  :0;
        max_fragment_atomic_counters                  :8;
        max_combined_atomic_counters                  :8;
        max_atomic_counter_bindings                   :1;
        max_vertex_atomic_counter_buffers             :0;
        max_tess_control_atomic_counter_buffers       :0;
        max_tess_evaluation_atomic_counter_buffers    :0;
        max_geometry_atomic_counter_buffers           :0;
        max_fragment_atomic_counter_buffers           :1;
        max_combined_atomic_counter_buffers           :1;
        max_atomic_counter_buffer_size                :16384;
        max_transform_feedback_buffers                :4;
        max_transform_feedback_interleaved_components :64;
        max_cull_distances                            :8;
        max_combined_clip_and_cull_distances          :8;
        max_samples                                   :4;
        max_mesh_output_vertices_nv                   :256;
        max_mesh_output_primitives_nv                 :512;
        max_mesh_work_group_size_x_nv                 :32;
        max_mesh_work_group_size_y_nv                 :1;
        max_mesh_work_group_size_z_nv                 :1;
        max_task_work_group_size_x_nv                 :32;
        max_task_work_group_size_y_nv                 :1;
        max_task_work_group_size_z_nv                 :1;
        max_mesh_view_count_nv                        :4;
        max_mesh_output_vertices_ext                  :256;
        max_mesh_output_primitives_ext                :256;
        max_mesh_work_group_size_x_ext                :128;
        max_mesh_work_group_size_y_ext                :128;
        max_mesh_work_group_size_z_ext                :128;
        max_task_work_group_size_x_ext                :128;
        max_task_work_group_size_y_ext                :128;
        max_task_work_group_size_z_ext                :128;
        max_mesh_view_count_ext                       :4;
        max_dual_source_draw_buffers_ext              :1;
        limits                                        :(
          non_inductive_for_loops                  :True;
          while_loops                              :True;
          do_while_loops                           :True;
          general_uniform_indexing                 :True;
          general_attribute_matrix_vector_indexing :True;
          general_varying_indexing                 :True;
          general_sampler_indexing                 :True;
          general_variable_indexing                :True;
          general_constant_matrix_vector_indexing  :True;
        );
      );

implementation //############################################################### ■

end. //######################################################################### ■
