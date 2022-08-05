module precice
  use, intrinsic :: iso_c_binding
  implicit none

  interface
  
    subroutine precicef_create(participantName, configFileName, &
      &                        solverProcessIndex, solverProcessSize, &
      &                        lengthAccessorName, lengthConfigFileName) &
      &  bind(c, name='precicef_create_')

      use, intrinsic :: iso_c_binding
      character(kind=c_char), dimension(*) :: participantName
      character(kind=c_char), dimension(*) :: configFileName
      integer(kind=c_int) :: solverProcessIndex
      integer(kind=c_int) :: solverProcessSize
      integer(kind=c_int), value :: lengthAccessorName
      integer(kind=c_int), value :: lengthConfigFileName
    end subroutine precicef_create

    subroutine precicef_initialize(timestepLengthLimit) &
      &  bind(c, name='precicef_initialize_')

      use, intrinsic :: iso_c_binding
      real(kind=c_double) :: timestepLengthLimit
    end subroutine precicef_initialize
    
    subroutine precicef_initialize_data() &
      &  bind(c, name='precicef_initialize_data_')

      use, intrinsic :: iso_c_binding
    end subroutine precicef_initialize_data

    subroutine precicef_advance(timestepLengthLimit) &
      &  bind(c, name='precicef_advance_')

      use, intrinsic :: iso_c_binding
      real(kind=c_double) :: timestepLengthLimit
    end subroutine precicef_advance

    subroutine precicef_finalize() bind(c, name='precicef_finalize_')

      use, intrinsic :: iso_c_binding
    end subroutine precicef_finalize

    subroutine precicef_get_dims(dimensions) &
      &  bind(c, name='precicef_get_dims_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: dimensions
    end subroutine precicef_get_dims

    ! Deprecated - Forwards to precicef_is_coupling_ongoing_
    subroutine precicef_ongoing(isOngoing) &
      &  bind(c, name='precicef_is_coupling_ongoing_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: isOngoing
    end subroutine precicef_ongoing

    subroutine precicef_is_coupling_ongoing(isOngoing) &
      &  bind(c, name='precicef_is_coupling_ongoing_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: isOngoing
    end subroutine precicef_is_coupling_ongoing
    
    ! Deprecated - Forwards to precicef_is_read_data_available_
    subroutine precicef_read_data_available(isAvailable) &
      &  bind(c, name='precicef_is_read_data_available_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: isAvailable
    end subroutine precicef_read_data_available

    subroutine precicef_is_read_data_available(isAvailable) &
      &  bind(c, name='precicef_is_read_data_available_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: isAvailable
    end subroutine precicef_is_read_data_available

    ! Deprecated - Forwards to precicef_is_write_data_required_
    subroutine precicef_write_data_required(computedTimestepLength, &
      &                                     isRequired) &
      &  bind(c, name='precicef_is_write_data_required_')

      use, intrinsic :: iso_c_binding
      real(kind=c_double) :: computedTimestepLength
      integer(kind=c_int) :: isRequired
    end subroutine precicef_write_data_required

    subroutine precicef_is_write_data_required(computedTimestepLength, &
      &                                       isRequired) &
      &  bind(c, name='precicef_is_write_data_required_')

      use, intrinsic :: iso_c_binding
      real(kind=c_double) :: computedTimestepLength
      integer(kind=c_int) :: isRequired
    end subroutine precicef_is_write_data_required

    subroutine precicef_is_time_window_complete(isComplete) &
      &  bind(c, name='precicef_is_time_window_complete_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: isComplete
  end subroutine precicef_is_time_window_complete
    
    subroutine precicef_has_to_evaluate_surrogate_model(hasToEvaluate) &
      &  bind(c, name='precicef_has_to_evaluate_surrogate_model_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: hasToEvaluate
    end subroutine precicef_has_to_evaluate_surrogate_model
    
    subroutine precicef_has_to_evaluate_fine_model(hasToEvaluate) &
      &  bind(c, name='precicef_has_to_evaluate_fine_model_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: hasToEvaluate
    end subroutine precicef_has_to_evaluate_fine_model        

    subroutine precicef_is_action_required(action, isRequired, lengthAction) &
      &  bind(c, name='precicef_is_action_required_')

      use, intrinsic :: iso_c_binding
      character(kind=c_char), dimension(*) :: action
      integer(kind=c_int)                  :: isRequired
      integer(kind=c_int), value           :: lengthAction
    end subroutine precicef_is_action_required

    ! Deprecated - Forwards to precicef_is_action_required_
    subroutine precicef_action_required(action, isRequired, lengthAction) &
      &  bind(c, name='precicef_is_action_required_')

      use, intrinsic :: iso_c_binding
      character(kind=c_char), dimension(*) :: action
      integer(kind=c_int)                  :: isRequired
      integer(kind=c_int), value           :: lengthAction
    end subroutine precicef_action_required

    subroutine precicef_mark_action_fulfilled(action, lengthAction) &
      &  bind(c, name='precicef_mark_action_fulfilled_')

      use, intrinsic :: iso_c_binding
      character(kind=c_char), dimension(*) :: action
      integer(kind=c_int), value           :: lengthAction
    end subroutine precicef_mark_action_fulfilled

    subroutine precicef_has_mesh(meshName, hasMesh, lengthMeshName) &
      &  bind(c, name='precicef_has_mesh_')

      use, intrinsic :: iso_c_binding
      character(kind=c_char), dimension(*) :: meshName
      integer(kind=c_int)                  :: hasMesh
      integer(kind=c_int), value           :: lengthMeshName
    end subroutine precicef_has_mesh  

    subroutine precicef_get_mesh_id(meshName, meshID, lengthMeshName) &
      &  bind(c, name='precicef_get_mesh_id_')

      use, intrinsic :: iso_c_binding
      character(kind=c_char), dimension(*) :: meshName
      integer(kind=c_int)                  :: meshID
      integer(kind=c_int), value           :: lengthMeshName
    end subroutine precicef_get_mesh_id

    subroutine precicef_set_vertex(meshID, position, vertexID) &
      &  bind(c, name='precicef_set_vertex_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: meshID
      real(kind=c_double) :: position(3)
      integer(kind=c_int) :: vertexID
    end subroutine precicef_set_vertex
    
    subroutine precicef_get_mesh_vertex_size(meshID, meshSize) &
      &  bind(c, name='precicef_get_mesh_vertex_size_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: meshID
      integer(kind=c_int) :: meshSize
    end subroutine precicef_get_mesh_vertex_size    
    
    subroutine precicef_set_vertices(meshID, meshsize, positions, positionIDs) &
      &  bind(c, name='precicef_set_vertices_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: meshID
      integer(kind=c_int) :: meshsize
      real(kind=c_double) :: positions(*)
      integer(kind=c_int) :: positionIDs(*)
    end subroutine precicef_set_vertices
    
    subroutine precicef_get_vertices(meshID, size, ids, positions ) &
      &  bind(c, name='precicef_get_vertices_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: meshID
      integer(kind=c_int) :: size
      integer(kind=c_int) :: ids(*)
      real(kind=c_double) :: positions(*)
    end subroutine precicef_get_vertices    

    subroutine precicef_get_vertex_ids_from_positions(meshID, size, positions, ids ) &
      &  bind(c, name='precicef_get_vertices_from_positions_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: meshID
      integer(kind=c_int) :: size
      real(kind=c_double) :: positions(*)
      integer(kind=c_int) :: ids(*)
    end subroutine precicef_get_vertex_ids_from_positions   

    subroutine precicef_set_edge(meshID, firstVertexID, secondVertexID, &
      &                          edgeID) &
      &  bind(c, name='precicef_set_edge_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: meshID
      integer(kind=c_int) :: firstVertexID
      integer(kind=c_int) :: secondVertexID
      integer(kind=c_int) :: edgeID
    end subroutine precicef_set_edge

    subroutine precicef_set_triangle(meshID, firstEdgeID, secondEdgeID, &
      &                              thirdEdgeID) &
      &  bind(c, name='precicef_set_triangle_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: meshID
      integer(kind=c_int) :: firstEdgeID
      integer(kind=c_int) :: secondEdgeID
      integer(kind=c_int) :: thirdEdgeID
    end subroutine precicef_set_triangle

    subroutine precicef_set_tetrahedron(meshID, firstVertexID, secondVertexID, &
      &                                 thirdVertexID, fourthVertexID) &
      &  bind(c, name='precicef_set_tetrahedron')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: meshID
      integer(kind=c_int) :: firstVertexID
      integer(kind=c_int) :: secondVertexID
      integer(kind=c_int) :: thirdVertexID
      integer(kind=c_int) :: fourthVertexID
    end subroutine precicef_set_tetrahedron
    
    subroutine precicef_set_triangle_we(meshID, firstVertexID, secondVertexID, &
      &                              thirdVertexID) &
      &  bind(c, name='precicef_set_triangle_we_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: meshID
      integer(kind=c_int) :: firstVertexID
      integer(kind=c_int) :: secondVertexID
      integer(kind=c_int) :: thirdVertexID
    end subroutine precicef_set_triangle_we

    subroutine precicef_set_quad(meshID, firstEdgeID, secondEdgeID, &
      &                              thirdEdgeID, fourthEdgeID ) &
      &  bind(c, name='precicef_set_quad_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: meshID
      integer(kind=c_int) :: firstEdgeID
      integer(kind=c_int) :: secondEdgeID
      integer(kind=c_int) :: thirdEdgeID
      integer(kind=c_int) :: fourthEdgeID
    end subroutine precicef_set_quad
    
    subroutine precicef_set_quad_we(meshID, firstVertexID, secondVertexID, &
      &                              thirdVertexID, fourthVertexID) &
      &  bind(c, name='precicef_set_quad_we_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: meshID
      integer(kind=c_int) :: firstVertexID
      integer(kind=c_int) :: secondVertexID
      integer(kind=c_int) :: thirdVertexID
      integer(kind=c_int) :: fourthVertexID
    end subroutine precicef_set_quad_we    

   subroutine precicef_has_data(dataName, meshID, hasData, lengthDataName) &
      &  bind(c, name='precicef_has_data_')

      use, intrinsic :: iso_c_binding
      character(kind=c_char), dimension(*) :: dataName
      integer(kind=c_int)                  :: meshID
      integer(kind=c_int)                  :: hasData
      integer(kind=c_int), value           :: lengthDataName
    end subroutine precicef_has_data

    subroutine precicef_get_data_id(dataName, meshID, dataID, lengthDataName ) &
      &  bind(c, name='precicef_get_data_id_')

      use, intrinsic :: iso_c_binding
      character(kind=c_char), dimension(*) :: dataName
      integer(kind=c_int)                  :: meshID
      integer(kind=c_int)                  :: dataID
      integer(kind=c_int), value           :: lengthDataName
    end subroutine precicef_get_data_id

    subroutine precicef_is_mesh_connectivity_required(meshID, required) &
      & bind(c, name='precicef_is_mesh_connectivity_required_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: meshID
      integer(kind=c_int) :: required
    end subroutine precicef_is_mesh_connectivity_required

    subroutine precicef_map_read_data_to(meshID) &
      &  bind(c, name='precicef_map_read_data_to_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: meshID
    end subroutine precicef_map_read_data_to
    
    subroutine precicef_map_write_data_from(meshID) &
      &  bind(c, name='precicef_map_write_data_from_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: meshID
    end subroutine precicef_map_write_data_from

    subroutine precicef_write_sdata( dataID, valueIndex, dataValue) &
      &  bind(c, name='precicef_write_sdata_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: dataID
      integer(kind=c_int) :: valueIndex
      real(kind=c_double) :: dataValue   
    end subroutine precicef_write_sdata

    subroutine precicef_write_bsdata( dataID, blockSize, valueIndices, values) &
      &  bind(c, name='precicef_write_bsdata_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: dataID
      integer(kind=c_int) :: blockSize
      integer(kind=c_int) :: valueIndices(*)
      real(kind=c_double) :: values(*)   
    end subroutine precicef_write_bsdata

    subroutine precicef_write_vdata( dataID, valueIndex, dataValue) &
      &  bind(c, name='precicef_write_vdata_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: dataID
      integer(kind=c_int) :: valueIndex
      real(kind=c_double), dimension(*) :: dataValue 
    end subroutine precicef_write_vdata
    
    subroutine precicef_write_bvdata( dataID, blockSize, valueIndices, values) &
      &  bind(c, name='precicef_write_bvdata_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: dataID
      integer(kind=c_int) :: blockSize
      integer(kind=c_int) :: valueIndices(*)
      real(kind=c_double) :: values(*)   
    end subroutine precicef_write_bvdata  
    
    subroutine precicef_read_sdata( dataID, valueIndex, dataValue) &
      &  bind(c, name='precicef_read_sdata_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: dataID
      integer(kind=c_int) :: valueIndex
      real(kind=c_double) :: dataValue   
    end subroutine precicef_read_sdata

    subroutine precicef_read_bsdata( dataID, blocksize, valueIndices, values) &
      &  bind(c, name='precicef_read_bsdata_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: dataID
      integer(kind=c_int) :: blocksize
      integer(kind=c_int) :: valueIndices(*)
      real(kind=c_double) :: values(*)   
    end subroutine precicef_read_bsdata

    subroutine precicef_read_vdata( dataID, valueIndex, dataValue) &
      &  bind(c, name='precicef_read_vdata_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: dataID
      integer(kind=c_int) :: valueIndex
      real(kind=c_double) :: dataValue(*)
    end subroutine precicef_read_vdata
    
    subroutine precicef_read_bvdata( dataID, blocksize, valueIndices, values) &
      &  bind(c, name='precicef_read_bvdata_')

      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: dataID
      integer(kind=c_int) :: blocksize
      integer(kind=c_int) :: valueIndices(*)
      real(kind=c_double) :: values(*)   
    end subroutine precicef_read_bvdata

    subroutine precicef_action_write_iter_checkp(nameAction, lengthNameAction) &
      &        bind(c, name="precicef_action_write_iter_checkp_")
      use, intrinsic :: iso_c_binding
      character(kind=c_char), dimension(*) :: nameAction
      integer(kind=c_int), value :: lengthNameAction
    end subroutine precicef_action_write_iter_checkp

    subroutine precicef_action_write_initial_data(nameAction, lengthNameAction) &
      &        bind(c, name="precicef_action_write_initial_data_")
      use, intrinsic :: iso_c_binding
      character(kind=c_char), dimension(*) :: nameAction
      integer(kind=c_int), value :: lengthNameAction
    end subroutine precicef_action_write_initial_data

    subroutine precicef_action_read_iter_checkp(nameAction, lengthNameAction) &
      &        bind(c, name="precicef_action_read_iter_checkp_")
      use, intrinsic :: iso_c_binding
      character(kind=c_char), dimension(*) :: nameAction
      integer(kind=c_int), value :: lengthNameAction
    end subroutine precicef_action_read_iter_checkp

    subroutine precicef_get_version_information(versionInfo, lengthVersionInfo) &
      &        bind(c, name="precicef_get_version_information_")
      use, intrinsic :: iso_c_binding
      character(kind=c_char), dimension(*) :: versionInfo
      integer(kind=c_int), value :: lengthVersionInfo
    end subroutine precicef_get_version_information

    ! Experimental API function
    subroutine precicef_set_mesh_access_region(meshID, boundingBox) &
      &        bind(c, name="precicef_set_mesh_access_region_")
      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: meshID
      real(kind=c_double) :: boundingBox(*)  
    end subroutine precicef_set_mesh_access_region

    ! Experimental API function
    subroutine precicef_get_mesh_vertices_and_ids(meshID, size, ids, coordinates) &
      &        bind(c, name="precicef_get_mesh_vertices_and_IDs_")
      use, intrinsic :: iso_c_binding
      integer(kind=c_int) :: meshID
      integer(kind=c_int) :: size
      integer(kind=c_int) :: ids(*)
      real(kind=c_double) :: coordinates(*) 
    end subroutine precicef_get_mesh_vertices_and_ids
  end interface

end module precice
