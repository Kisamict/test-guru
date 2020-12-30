document.addEventListener('turbolinks:load', function() {
  var $links = $('.form-inline-link')

  $links.on('click', formInlineLinkHandler)

  var errors = document.querySelector('.resource-errors')

  if (errors && $links.length) {
    formInlineHandler(errors.dataset.resourceId)
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault()
  
  testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
  var $testTitle = $('.test-title[data-test-id="' + testId + '"]')
  var $inlineForm = $('.form-inline[data-test-id="' + testId + '"]')

  $testTitle.toggle()
  $inlineForm.toggle()

  if ($inlineForm.is(':visible')) {
    link.innerText = 'Cancel'
  } else {
    link.innerText = 'Edit'
  }
}
