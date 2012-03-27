window.dpm ?= {}

class dpm.Errors

  @alert_classes:   ['alert-warning','alert-error','alert-success','alert-info']
  @input_container: '.control-group'
  @lbl_template:    "<span class='help-block error'><strong>{{field}}:</strong>{{message}}</span>"

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
    form.find('.help-block.error').remove().find('.help-block,.help-inline').show()

  @highlightErrors:(errors,form)->
    dpm.Errors.clearErrors(form)

    _.each errors, ( error )=>
      input = form.find("*[name=\"#{error[0]}\"]")

      if input
        msg = @lbl_template.replace('{{field}}',error[0]).replace('{{message}}',error[1])

        input.closest( @input_container ).addClass('error')
        input.closest('.controls').find('.help-block,.help-inline').not('.error').hide()
        input.closest('.controls').append( msg )

    return dpm.Errors