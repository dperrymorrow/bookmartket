describe "alerts", ->
  defaults =
    test_msg:'the test message'
    errors:
      name: ['cannot be blank']
      city: ['is not valid','cannot be blank']

  beforeEach ->
    loadFixtures 'errors'

  it "shows the message in #flash", ->
    dpm.Errors.showMsg defaults.test_msg
    expect($('#flash')).toHaveText defaults.test_msg

  it "shows the message in .alt-msg", ->
    dpm.Errors.showMsg defaults.test_msg, null, false, $('.alt-msg')
    expect($('.alt-msg')).toHaveText defaults.test_msg

  it "clears other classes when msg shown", ->
    dpm.Errors.showMsg defaults.test_msg, '.alert-error', false, $('.alt-msg')
    dpm.Errors.showMsg defaults.test_msg, '.alert-notice', false, $('.alt-msg')
    expect($('.alt-msg')).not.toHaveClass 'alert-error'

  # test setting and clearing of classes
  # test autohide somehow
  describe "highlight errors", ->

    beforeEach ->
      dpm.Errors.highlightErrors defaults.errors, $('#the-form')

    it "highlights the errors correctly", ->
      expect($('#name-input').closest('.control-group')).toHaveClass 'error'
      expect($('#name-input').closest('.controls')).toContain ".#{dpm.Errors.lbl_class.replace(' ', '.')}"

    it "clears the errors", ->
      dpm.Errors.clearErrors($('#the-form'))
      expect($('#name-input').closest('.control-group')).not.toHaveClass 'error'




