@hide = false

@edit = () ->
  if @hide
    $('.menu-del').css 'display' : 'none'
    $('#edit-label').html 'Edit List'
    $('.menu-del').removeClass 'close'
    @hide = false
  else
    $('.menu-del').css 'display' : 'inline'
    $('.menu-del').addClass 'close'
    $('#edit-label').html 'Cancel'
    @hide = true

@show_loading = () ->
  $('.contentblock').html "Loading..."

