program hello

#ifdef _OPENMP
    use omp_lib
#endif

    implicit none

    integer :: thread_id
    integer :: num_threads

#ifdef _OPENMP

    !$omp parallel private(thread_id)

    thread_id = omp_get_thread_num()

    if (thread_id == 0) then
        num_threads = omp_get_num_threads()
        print *, "OpenMP enabled"
        print *, "Number of threads =", num_threads
    end if

    print *, "Hello from thread", thread_id

    !$omp end parallel

#else

    print *, "OpenMP not enabled"
    print *, "Hello from single-threaded program"

#endif

end program hello