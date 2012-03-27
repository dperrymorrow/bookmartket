window.dpm ?= {}

class dpm.Errors

  @alert_classes:   ['alert-warning','alert-error','alert-success','alert-info']
  @input_container: '.control-group'
  @lbl_template:    "<span class='{{lbl_class}}'><strong>{{field}}: </strong>{{message}}</span>"
  @lbl_class:       'label label-important'

  @showMsg:(message, css_class, autofade, element)->
    element = $('#flash') if not element
    css_class = 'alert-notice' unless $.inArray(css_class, @alert_classes)

    element.html(message)
    element.removeClass( @alert_classes.join(' ') ).addClass(css_class)
    element.fadeIn(200) unless element.is(':visible')

    if autofade
      element.delay(5000).fadeOut(500)
    else
      element.css('cursor','pointer').click ->
        $(this).hide(200)

    return dpm.Errors

  @clearErrors:(form)->
    form.find("#{@input_container}.error").removeClass('error')
    sel = @lbl_class.replace(' ', '.')
    form.find(".#{sel}").remove()

  @highlightErrors:(errors,form)->
    dpm.Errors.clearErrors(form)
    fields = _.keys( errors )

    for field in fields
      input = form.find("*[name=\"#{field}\"]")

      if input
        for error in errors[field]
          msg = @lbl_template.replace('{{field}}',field).replace('{{message}}',error).replace('{{lbl_class}}',@lbl_class)
          input.closest( @input_container ).addClass('error')
          input.closest('.controls').append( msg )

    return dpm.Errors