@hide = false
@edit = () ->
  if @hide
    $('.menu-del').css 'display' : 'none'
    $('#menu-edit').find('a').text 'EDIT'
    $('.menu-del').removeClass 'close'
    @hide = false
  else
    $('.menu-del').css 'display' : 'inline'
    $('.menu-del').addClass 'close'
    $('#menu-edit').find('a').text 'CANCEL'
    @hide = true
