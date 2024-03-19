PROGRAM main
  use precice
  IMPLICIT NONE
  
  ! We need the length of the strings, set this to a meaningful value in your code.
  ! Here assumed that length = 50 (arbitrary).
  CHARACTER(50)                   :: config
  CHARACTER(50)                   :: participantName, meshName
  CHARACTER(50)                   :: readDataName, writeDataName
  INTEGER                         :: rank, commsize, ongoing, dimensions, bool, numberOfVertices, i, j
  REAL(8)                         :: dt
  DOUBLE PRECISION, DIMENSION(:), ALLOCATABLE :: vertices, writeData, readData
  INTEGER, DIMENSION(:), ALLOCATABLE :: vertexIDs
  integer(kind=c_int)             :: c_participantNameLength = 50
  integer(kind=c_int)             :: c_configFileNameLength = 50

  WRITE (*,*) 'DUMMY: Starting Fortran solver dummy...'
  CALL get_command_argument(1, config)
  CALL get_command_argument(2, participantName)

  IF(participantName .eq. 'SolverOne') THEN
    write(*,*) "SolverOne"
    writeDataName = 'Data-One'
    readDataName = 'Data-Two'
    meshName = 'SolverOne-Mesh'
  ENDIF
  IF(participantName .eq. 'SolverTwo') THEN
    write(*,*) "SolverTwo"
    writeDataName = 'Data-Two'
    readDataName = 'Data-One'
    meshName = 'SolverTwo-Mesh'
  ENDIF

  rank = 0
  commsize = 1
  dt = 1
  numberOfVertices = 3
  CALL precicef_create(participantName, config, rank, commsize, 50, 50)

  ! Allocate dummy mesh with only one vertex
  CALL precicef_get_mesh_dimensions(meshName, dimensions, 50)
  ALLOCATE(vertices(numberOfVertices*dimensions))
  ALLOCATE(vertexIDs(numberOfVertices))
  ALLOCATE(readData(numberOfVertices*dimensions))
  ALLOCATE(writeData(numberOfVertices*dimensions))

  do i = 1,numberOfVertices,1
    do j = 1,dimensions,1
      vertices((i - 1)*dimensions + j ) = i-1
      readData((i - 1)*dimensions + j ) = i-1
      writeData((i - 1)*dimensions + j ) = i-1
    enddo
    vertexIDs(i) = i-1
  enddo

  CALL precicef_set_vertices(meshName, numberOfVertices, vertices, vertexIDs, 50)
  DEALLOCATE(vertices)

  CALL precicef_requires_initial_data(bool)
  IF (bool.EQ.1) THEN
    WRITE (*,*) 'DUMMY: Writing initial data'
  ENDIF
  CALL precicef_initialize()

  CALL precicef_is_coupling_ongoing(ongoing)
  DO WHILE (ongoing.NE.0)

    CALL precicef_requires_writing_checkpoint(bool)

    IF (bool.EQ.1) THEN
      WRITE (*,*) 'DUMMY: Writing iteration checkpoint'
    ENDIF

    CALL precicef_get_max_time_step_size(dt)
    CALL precicef_read_data(meshName, readDataName, numberOfVertices, vertexIDs, dt, readData, 50, 50)

    WRITE (*,*) 'readData: ', readData

    writeData = readData + 1

    CALL precicef_write_data(meshName, writeDataName, numberOfVertices, vertexIDs, writeData, 50, 50)

    CALL precicef_advance(dt)

    CALL precicef_requires_reading_checkpoint(bool)
    IF (bool.EQ.1) THEN
      WRITE (*,*) 'DUMMY: Reading iteration checkpoint'
    ELSE
      WRITE (*,*) 'DUMMY: Advancing in time'
    ENDIF

    CALL precicef_is_coupling_ongoing(ongoing)

  ENDDO
  
  CALL precicef_finalize()
  WRITE (*,*) 'DUMMY: Closing Fortran solver dummy...'

  DEALLOCATE(writeData)
  DEALLOCATE(readData)
  DEALLOCATE(vertexIDs)

END PROGRAM 
