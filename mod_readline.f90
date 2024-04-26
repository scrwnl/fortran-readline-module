module mod_readline
    implicit none
contains
    function readLine(prompt) result (str)
        !* The function that read a line from console.
        character(len=*), intent(in), optional :: prompt
        !* Prompt string
        integer :: status = 0
        character :: buffer
        character(:), allocatable :: str
        if ( present(prompt) ) then
            write( *, fmt='(A)', advance='no' ) prompt
        end if
        str = ""
        do
            read( *, fmt='(A)', advance='no', iostat=status ) buffer
            str = str // buffer
            if( is_iostat_eor(status) ) exit
        end do
        return
    end function
end module mod_readline