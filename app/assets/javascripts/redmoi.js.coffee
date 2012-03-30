@hide = false
@test = () ->
  if @hide
    $('.operation').css 'display' : 'none'
    $('#menu-edit').find('a').text 'EDIT'
    @hide = false
  else
    $('.operation').css 'display' : 'block'
    $('#menu-edit').find('a').text 'CANCEL'
    @hide = true
